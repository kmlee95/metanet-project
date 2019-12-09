package kr.co.metanet.dto;

import java.sql.Date;

public class MemberDTO {
	private int bno;
	private String id;  // 아이디
	private String id_code; //아이디 코드
    private String password; //비밀번호
    private String name; //이름
    private Date join_date; //입사일
    private String gender; //성별
    private String phone; //휴대폰번호 
	private String emp_code; //사원코드
	private String emp_use_yn; // 사용 유무
	private String org_code; //조직 코드
	private String emp_rank; //사원 직위
	private String certified_yn; //인증여부
	
	private String org_name;//조직이름
	
	
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId_code() {
		return id_code;
	}
	public void setId_code(String id_code) {
		this.id_code = id_code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getEmp_use_yn() {
		return emp_use_yn;
	}
	public void setEmp_use_yn(String emp_use_yn) {
		this.emp_use_yn = emp_use_yn;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getEmp_rank() {
		return emp_rank;
	}
	public void setEmp_rank(String emp_rank) {
		this.emp_rank = emp_rank;
	}
	public String getCertified_yn() {
		return certified_yn;
	}
	public void setCertified_yn(String certified_yn) {
		this.certified_yn = certified_yn;
	}


}
