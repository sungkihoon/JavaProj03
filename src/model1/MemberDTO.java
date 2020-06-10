package model1;

public class MemberDTO {

	//개인정보이므로 private로 선언
	private String name;
	private String id;
	private String pass;
	private String tel;
	private String mobile;
	private String email;
	private String addr;
	private String zip;
	private String date;


	//기본생성자
	public MemberDTO() {}

	//인자생성자
	public MemberDTO(String name, String id, String pass, String tel, String mobile, String email, String addr,
			String zip, String date) {
		super();
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.tel = tel;
		this.mobile = mobile;
		this.email = email;
		this.addr = addr;
		this.zip = zip;
		this.date = date;
	}
	
	
	// getter/ setter
	
	
	@Override
	public String toString() {
		return String.format("아이디 : %s, 비밀번호 : %s, 이름  : %s", 
				id, pass, name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
