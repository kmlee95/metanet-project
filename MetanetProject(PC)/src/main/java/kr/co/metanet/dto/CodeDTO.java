package kr.co.metanet.dto;

import java.sql.Date;

public class CodeDTO {
	
	private String code;
	private String code_group;
	private String code_name;
	
	private String code_upper;
	private String code_level;
	private Date code_use_yn;
	private Date code_effective_start_date;
	private String code_effective_end_date;
	private Date code_create_date;
	private String code_create_id_code;
	private Date code_update_date;
	private String code_update_id_code;
	private String code_value1;
	private String code_value2;
	private String code_value3;
	
	@Override
	public String toString() {
		return "CodeDTO [code=" + code + ", code_group=" + code_group + ", code_name=" + code_name + ", code_upper="
				+ code_upper + ", code_level=" + code_level + ", code_use_yn=" + code_use_yn
				+ ", code_effective_start_date=" + code_effective_start_date + ", code_effective_end_date="
				+ code_effective_end_date + ", code_create_date=" + code_create_date + ", code_create_id_code="
				+ code_create_id_code + ", code_update_date=" + code_update_date + ", code_update_id_code="
				+ code_update_id_code + ", code_value1=" + code_value1 + ", code_value2=" + code_value2
				+ ", code_value3=" + code_value3 + "]";
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode_group() {
		return code_group;
	}
	public void setCode_group(String code_group) {
		this.code_group = code_group;
	}
	
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	
	public String getCode_upper() {
		return code_upper;
	}
	public void setCode_upper(String code_upper) {
		this.code_upper = code_upper;
	}
	public String getCode_level() {
		return code_level;
	}
	public void setCode_level(String code_level) {
		this.code_level = code_level;
	}
	public Date getCode_use_yn() {
		return code_use_yn;
	}
	public void setCode_use_yn(Date code_use_yn) {
		this.code_use_yn = code_use_yn;
	}
	public Date getCode_effective_start_date() {
		return code_effective_start_date;
	}
	public void setCode_effective_start_date(Date code_effective_start_date) {
		this.code_effective_start_date = code_effective_start_date;
	}
	public String getCode_effective_end_date() {
		return code_effective_end_date;
	}
	public void setCode_effective_end_date(String code_effective_end_date) {
		this.code_effective_end_date = code_effective_end_date;
	}
	public Date getCode_create_date() {
		return code_create_date;
	}
	public void setCode_create_date(Date code_create_date) {
		this.code_create_date = code_create_date;
	}
	public String getCode_create_id_code() {
		return code_create_id_code;
	}
	public void setCode_create_id_code(String code_create_id_code) {
		this.code_create_id_code = code_create_id_code;
	}
	public Date getCode_update_date() {
		return code_update_date;
	}
	public void setCode_update_date(Date code_update_date) {
		this.code_update_date = code_update_date;
	}
	public String getCode_update_id_code() {
		return code_update_id_code;
	}
	public void setCode_update_id_code(String code_update_id_code) {
		this.code_update_id_code = code_update_id_code;
	}
	public String getCode_value1() {
		return code_value1;
	}
	public void setCode_value1(String code_value1) {
		this.code_value1 = code_value1;
	}
	public String getCode_value2() {
		return code_value2;
	}
	public void setCode_value2(String code_value2) {
		this.code_value2 = code_value2;
	}
	public String getCode_value3() {
		return code_value3;
	}
	public void setCode_value3(String code_value3) {
		this.code_value3 = code_value3;
	}
 
	
}
