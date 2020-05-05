package kr.co.metanet.dto;

import java.sql.Date;

public class VacationApplyDTO {

    private String va_code;
    private String emp_code;
    private String va_reg_date;
    private String va_start_date;
    private String va_end_date;
    private String vk_code;
    private String va_reason;
    private String vs_code;
    private String rej_reason;
    
    private String confirm_emp_upper;
    private Date confirm_date;
    
    private String id;
    private String vk_code_name;
    private String vs_code_name;
    private String upper_emp_name;
    
	private String va_days_num;

	public String getVa_code() {
		return va_code;
	}

	public void setVa_code(String va_code) {
		this.va_code = va_code;
	}

	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getVa_reg_date() {
		return va_reg_date;
	}

	public void setVa_reg_date(String va_reg_date) {
		this.va_reg_date = va_reg_date;
	}

	public String getVa_start_date() {
		return va_start_date;
	}

	public void setVa_start_date(String va_start_date) {
		this.va_start_date = va_start_date;
	}

	public String getVa_end_date() {
		return va_end_date;
	}

	public void setVa_end_date(String va_end_date) {
		this.va_end_date = va_end_date;
	}

	public String getVk_code() {
		return vk_code;
	}

	public void setVk_code(String vk_code) {
		this.vk_code = vk_code;
	}

	public String getVa_reason() {
		return va_reason;
	}

	public void setVa_reason(String va_reason) {
		this.va_reason = va_reason;
	}

	public String getVs_code() {
		return vs_code;
	}

	public void setVs_code(String vs_code) {
		this.vs_code = vs_code;
	}

	public String getRej_reason() {
		return rej_reason;
	}

	public void setRej_reason(String rej_reason) {
		this.rej_reason = rej_reason;
	}

	public String getConfirm_emp_upper() {
		return confirm_emp_upper;
	}

	public void setConfirm_emp_upper(String confirm_emp_upper) {
		this.confirm_emp_upper = confirm_emp_upper;
	}

	public Date getConfirm_date() {
		return confirm_date;
	}

	public void setConfirm_date(Date confirm_date) {
		this.confirm_date = confirm_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVk_code_name() {
		return vk_code_name;
	}

	public void setVk_code_name(String vk_code_name) {
		this.vk_code_name = vk_code_name;
	}

	public String getVs_code_name() {
		return vs_code_name;
	}

	public void setVs_code_name(String vs_code_name) {
		this.vs_code_name = vs_code_name;
	}

	public String getUpper_emp_name() {
		return upper_emp_name;
	}

	public void setUpper_emp_name(String upper_emp_name) {
		this.upper_emp_name = upper_emp_name;
	}

	public String getVa_days_num() {
		return va_days_num;
	}

	public void setVa_days_num(String va_days_num) {
		this.va_days_num = va_days_num;
	}

	@Override
	public String toString() {
		return "VacationApplyDTO [va_code=" + va_code + ", emp_code=" + emp_code + ", va_reg_date=" + va_reg_date
				+ ", va_start_date=" + va_start_date + ", va_end_date=" + va_end_date + ", vk_code=" + vk_code
				+ ", va_reason=" + va_reason + ", vs_code=" + vs_code + ", rej_reason=" + rej_reason
				+ ", confirm_emp_upper=" + confirm_emp_upper + ", confirm_date=" + confirm_date + ", id=" + id
				+ ", vk_code_name=" + vk_code_name + ", vs_code_name=" + vs_code_name + ", upper_emp_name="
				+ upper_emp_name + ", va_days_num=" + va_days_num + "]";
	}
    
	
	
}
