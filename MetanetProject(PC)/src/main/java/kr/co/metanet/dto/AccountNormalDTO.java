package kr.co.metanet.dto;

import java.sql.Date;

public class AccountNormalDTO {
	
	private String id_code;
	private String id;
	private String password;
	private String emp_code;
	private String certified_yn;
	private String id_use_yn;
	private Date id_effective_start_date;
	private Date id_effective_end_date;
	private Date id_create_date;
	private String id_create_id_code;
	private Date id_update_date;
	private String id_update_id_code;
	
	
		
	
	public String getId_code() {
		return id_code;
	}
	public void setId_code(String id_code) {
		this.id_code = id_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getCertified_yn() {
		return certified_yn;
	}
	public void setCertified_yn(String certified_yn) {
		this.certified_yn = certified_yn;
	}
	public String getId_use_yn() {
		return id_use_yn;
	}
	public void setId_use_yn(String id_use_yn) {
		this.id_use_yn = id_use_yn;
	}
	public Date getId_effective_start_date() {
		return id_effective_start_date;
	}
	public void setId_effective_start_date(Date id_effective_start_date) {
		this.id_effective_start_date = id_effective_start_date;
	}
	public Date getId_effective_end_date() {
		return id_effective_end_date;
	}
	public void setId_effective_end_date(Date id_effective_end_date) {
		this.id_effective_end_date = id_effective_end_date;
	}
	public Date getId_create_date() {
		return id_create_date;
	}
	public void setId_create_date(Date id_create_date) {
		this.id_create_date = id_create_date;
	}
	public String getId_create_id_code() {
		return id_create_id_code;
	}
	public void setId_create_id_code(String id_create_id_code) {
		this.id_create_id_code = id_create_id_code;
	}
	public Date getId_update_date() {
		return id_update_date;
	}
	public void setId_update_date(Date id_update_date) {
		this.id_update_date = id_update_date;
	}
	public String getId_update_id_code() {
		return id_update_id_code;
	}
	public void setId_update_id_code(String id_update_id_code) {
		this.id_update_id_code = id_update_id_code;
	}
	
	@Override
	public String toString() {
		return "Account_NormalDTO [id_code=" + id_code + ", id=" + id + ", password=" + password + ", emp_code="
				+ emp_code + ", certified_yn=" + certified_yn + ", id_use_yn=" + id_use_yn
				+ ", id_effective_start_date=" + id_effective_start_date + ", id_effective_end_date="
				+ id_effective_end_date + ", id_create_date=" + id_create_date + ", id_create_id_code="
				+ id_create_id_code + ", id_update_date=" + id_update_date + ", id_update_id_code=" + id_update_id_code
				+ "]";
	}
	
	

}