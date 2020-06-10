package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import connect.Dbinfo;

public class MemberDAO implements Dbinfo{

	//멤버변수 (클래스 전체 멤버메소드에서 접근가능)
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	//기본생성자
	public MemberDAO() {
		System.out.println("MemberDAO 생성자 호출");
	}

	public MemberDAO(String driver, String url) {
		try {
			Class.forName(driver);
			/*String id = "kihun0227";
			String pw = "tjdrlgns1@";*/
			con =DriverManager.getConnection(Dbinfo.url, Dbinfo.id, Dbinfo.pw);
			System.out.println("DB연결성공");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
			String id = "kihun0227";
			String pw = "tjdrlgns1@";
			con =DriverManager.getConnection(
					ctx.getInitParameter("MariaConnectURL"), Dbinfo.id, Dbinfo.pw);
			System.out.println("DB연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}
	}

	//회원인증 후 MemberDTO객체로 회원정보를 반환한다.
	public MemberDTO getMemberDTO(String uid, String upass) {
		//DTO객체를 생성한다.
		MemberDTO dto = new MemberDTO();
		//쿼리문을 작성
		String query = "SELECT id, pass, name FROM membership "
				+ " WHERE id=? AND pass=?";

		try {
			//prepared 객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet이 있는지 확인
			if(rs.next()) {
				//true를 반환했다면 결과셋 있음
				//DTO객체에 회원 레코드의 값을 저장한다.
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
			}
			else {
				//false를 반환했다면 결과셋 없음
				System.out.println("입력하신 정보가 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}

		return dto;
	}

	public Map<String, String> getMemberMap(String id, String pwd){

		Map<String, String> maps = new HashMap<String, String>();

		String query = "SELECT id, pass, name FROM membership "
				+ " WHERE id=? AND pass=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();

			if(rs.next()) {
				maps.put("id", rs.getString("id"));
				maps.put("pass", rs.getString("pass"));
				maps.put("name", rs.getString("name"));
			}
			else {
				System.out.println("입력하신 정보가 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberMap오류");
			e.printStackTrace();
		}
		return maps;

	}

	public int insertMember(MemberDTO dto){

		int affected = 0;

		try {
			String query = "insert INTO membership ("
					+ " name, id, pass, tel, mobile, email, addr, zip ) "
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";

			psmt = con.prepareStatement(query);


			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getMobile());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getAddr());
			psmt.setString(8, dto.getZip());

			affected = psmt.executeUpdate();
			System.out.println(affected + "개의 회원정보입력이 완료되었습니다.");

		}
		catch (Exception e) {
			System.out.println("Insert중 예외발생");
			e.printStackTrace();
		}

		return affected;
	}

	public boolean idCheck(String id) {

		String query = "select id from membership where id=? ";

		boolean x = false;

		try {
			psmt =con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if(rs.next()) x = true;

		} catch (Exception e) {
			System.out.println("ID체크 오류");
			e.printStackTrace();

		}
		return x;
	}
}

