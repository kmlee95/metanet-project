package kr.co.metanet.dto;

import java.sql.Date;

public class ApplicantListDTO {

	private String va_code;
	private Date va_reg_date;
	private String name;
	private String org_name;
	private String emp_rank;
	private Date join_date;
	
	private String vk_code_name;
	private Date va_start_date;
	private Date va_end_date;
	private String vs_code_name;
	private String rej_reason;
	private String va_reason;

	//////////////////////////////
	
	private double acq_days_num;
	private double use_days_num;
	private double res_days_num;
	
	private String boss_name;
	
	//////////////////////////////
	
	private String vs_code;
	private String apply_emp_code;
	private String vk_code;
	private double va_days_num;
		
	
	public String getVa_code() {
		return va_code;
	}
	public void setVa_code(String va_code) {
		this.va_code = va_code;
	}
	
	public Date getVa_reg_date() {
		return va_reg_date;
	}
	public void setVa_reg_date(Date va_reg_date) {
		this.va_reg_date = va_reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getEmp_rank() {
		return emp_rank;
	}
	public void setEmp_rank(String emp_rank) {
		this.emp_rank = emp_rank;
	}
	public Date getJoin_Date() {
		return join_date;
	}
	public void setJoin_Date(Date join_Date) {
		this.join_date = join_Date;
	}
	public String getVk_code_name() {
		return vk_code_name;
	}
	public void setVk_code_name(String vk_code_name) {
		this.vk_code_name = vk_code_name;
	}
	public Date getVa_start_date() {
		return va_start_date;
	}
	public void setVa_start_date(Date va_start_date) {
		this.va_start_date = va_start_date;
	}
	public Date getVa_end_date() {
		return va_end_date;
	}
	public void setVa_end_date(Date va_end_date) {
		this.va_end_date = va_end_date;
	}
	public String getVs_code_name() {
		return vs_code_name;
	}
	public void setVs_code_name(String vs_code_name) {
		this.vs_code_name = vs_code_name;
	}
	public String getRej_reason() {
		return rej_reason;
	}
	public void setRej_reason(String rej_reason) {
		this.rej_reason = rej_reason;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getVa_reason() {
		return va_reason;
	}
	public void setVa_reason(String va_reason) {
		this.va_reason = va_reason;
	}
	public double getAcq_days_num() {
		return acq_days_num;
	}
	public void setAcq_days_num(double acq_days_num) {
		this.acq_days_num = acq_days_num;
	}
	public double getUse_days_num() {
		return use_days_num;
	}
	public void setUse_days_num(double use_days_num) {
		this.use_days_num = use_days_num;
	}
	public double getRes_days_num() {
		return res_days_num;
	}
	public void setRes_days_num(double res_days_num) {
		this.res_days_num = res_days_num;
	}
	public String getBoss_name() {
		return boss_name;
	}
	public void setBoss_name(String boss_name) {
		this.boss_name = boss_name;
	}
	public String getVs_code() {
		return vs_code;
	}
	public void setVs_code(String vs_code) {
		this.vs_code = vs_code;
	}
	public String getApply_emp_code() {
		return apply_emp_code;
	}
	public void setApply_emp_code(String apply_emp_code) {
		this.apply_emp_code = apply_emp_code;
	}
	public String getVk_code() {
		return vk_code;
	}
	public void setVk_code(String vk_code) {
		this.vk_code = vk_code;
	}
	public double getVa_days_num() {
		return va_days_num;
	}
	public void setVa_days_num(double va_days_num) {
		this.va_days_num = va_days_num;
	}
	@Override
	public String toString() {
		return "TestListDTO [va_code=" + va_code + ", va_reg_date=" + va_reg_date + ", name=" + name + ", org_name="
				+ org_name + ", emp_rank=" + emp_rank + ", join_date=" + join_date + ", vk_code_name=" + vk_code_name
				+ ", va_start_date=" + va_start_date + ", va_end_date=" + va_end_date + ", vs_code_name=" + vs_code_name
				+ ", rej_reason=" + rej_reason + ", va_reason=" + va_reason + ", acq_days_num=" + acq_days_num
				+ ", use_days_num=" + use_days_num + ", res_days_num=" + res_days_num + ", boss_name=" + boss_name
				+ ", vs_code=" + vs_code + ", apply_emp_code=" + apply_emp_code + ", vk_code=" + vk_code
				+ ", va_days_num=" + va_days_num + "]";
	}

/////////////////////////////////////////
	
	
	
}
