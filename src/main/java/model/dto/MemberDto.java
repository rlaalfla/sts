package model.dto;

import java.util.Date;

//¸ðµ¨ºó
public class MemberDto{

	private String id;
	private String passwd;
	private String name;
	private String jumin1;
	private String jumin2;
	
	private String email;
	private String zipcode;
	private String addr;
	private String job;
	private Date regdate;

	public MemberDto() {}//µðÆúÆ® »ý¼ºÀÚ 

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJumin1() {
		return jumin1;
	}

	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}

	public String getJumin2() {
		return jumin2;
	}

	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}//class end
