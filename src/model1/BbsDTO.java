package model1;

import java.sql.Date;

public class BbsDTO {

	private String num;
	private String title;
	private String content;
	private java.sql.Date postDate;
	private String id;
	private String visitcount;
	private String ofile;
	private String sfile;

	//멤버변수 추가 : board와 member 테이블의 조인을 위해 name컬럼 추가
	private String name;

	//멀티게시판 구현을 위한 멤버변수 추가 : bname(게시판을 구분하기 위한 컬럼)
	private String bname;

	//기본생성자
	public BbsDTO() {}

	//인자생성자
	public BbsDTO(String num, String title, String content, Date postDate, String id, String visitcount, String name,
			String bname, String ofile, String sfile) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.id = id;
		this.visitcount = visitcount;
		this.name = name;
		this.bname = bname;
		this.ofile = ofile;
		this.sfile = sfile;
	}

	// getter/ setter
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public String getOfile() {
		return ofile;
	}

	public void setOfile(String ofile) {
		this.ofile = ofile;
	}

	public String getSfile() {
		return sfile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}





}
