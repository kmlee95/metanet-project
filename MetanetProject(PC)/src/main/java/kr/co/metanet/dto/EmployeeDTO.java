package kr.co.metanet.dto;

import java.sql.Date;

public class EmployeeDTO {

	private String emp_code;
	private String name;
	private String emp_rank;
	private String org_code;
	private String gender;
	private String phone;
	private Date join_date;
	private String emp_upper;
	private String master_yn;
	private String emp_use_yn;
	private Date emp_effective_start_date;
	private Date emp_effective_end_date;
	private Date emp_create_date;
	private String emp_create_id_code;
	private Date emp_update_date;
	private String emp_update_id_code;
	
	private String org_name;     
	private String upper_name;     
	
	private String org_div;
    private String org_upper;
    private String org_use_yn;
    private String org_create_id_code;
    private String org_update_id_code;
    private Date org_effective_start_date;
    private Date org_effective_end_date;
    private Date org_create_date;
    private Date org_update_date;
    
    private String year;
    private String vam_use_yn;
    private String vam_create_id_code;
    private String vam_update_id_code;
    private Date vam_effective_start_date;
	private Date vam_effective_end_date;
    private Date vam_create_date;
    private Date vam_update_date;
    private double acq_days_num;
    private double use_days_num;
    private double res_days_num;
    
    private String org_code_name;
    
    
    public String getOrg_code_name() {
		return org_code_name;
	}
	public void setOrg_code_name(String org_code_name) {
		this.org_code_name = org_code_name;
	}
	private String id;
	
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrg_div() {
		return org_div;
	}
	public void setOrg_div(String org_div) {
		this.org_div = org_div;
	}
	public String getOrg_upper() {
		return org_upper;
	}
	public void setOrg_upper(String org_upper) {
		this.org_upper = org_upper;
	}
	public String getOrg_use_yn() {
		return org_use_yn;
	}
	public void setOrg_use_yn(String org_use_yn) {
		this.org_use_yn = org_use_yn;
	}
	public String getOrg_create_id_code() {
		return org_create_id_code;
	}
	public void setOrg_create_id_code(String org_create_id_code) {
		this.org_create_id_code = org_create_id_code;
	}
	public String getOrg_update_id_code() {
		return org_update_id_code;
	}
	public void setOrg_update_id_code(String org_update_id_code) {
		this.org_update_id_code = org_update_id_code;
	}
	public Date getOrg_effective_start_date() {
		return org_effective_start_date;
	}
	public void setOrg_effective_start_date(Date org_effective_start_date) {
		this.org_effective_start_date = org_effective_start_date;
	}
	public Date getOrg_effective_end_date() {
		return org_effective_end_date;
	}
	public void setOrg_effective_end_date(Date org_effective_end_date) {
		this.org_effective_end_date = org_effective_end_date;
	}
	public Date getOrg_create_date() {
		return org_create_date;
	}
	public void setOrg_create_date(Date org_create_date) {
		this.org_create_date = org_create_date;
	}
	public Date getOrg_update_date() {
		return org_update_date;
	}
	public void setOrg_update_date(Date org_update_date) {
		this.org_update_date = org_update_date;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getVam_use_yn() {
		return vam_use_yn;
	}
	public void setVam_use_yn(String vam_use_yn) {
		this.vam_use_yn = vam_use_yn;
	}
	public String getVam_create_id_code() {
		return vam_create_id_code;
	}
	public void setVam_create_id_code(String vam_create_id_code) {
		this.vam_create_id_code = vam_create_id_code;
	}
	public String getVam_update_id_code() {
		return vam_update_id_code;
	}
	public void setVam_update_id_code(String vam_update_id_code) {
		this.vam_update_id_code = vam_update_id_code;
	}
	public Date getVam_effective_start_date() {
		return vam_effective_start_date;
	}
	public void setVam_effective_start_date(Date vam_effective_start_date) {
		this.vam_effective_start_date = vam_effective_start_date;
	}
	public Date getVam_effective_end_date() {
		return vam_effective_end_date;
	}
	public void setVam_effective_end_date(Date vam_effective_end_date) {
		this.vam_effective_end_date = vam_effective_end_date;
	}
	public Date getVam_create_date() {
		return vam_create_date;
	}
	public void setVam_create_date(Date vam_create_date) {
		this.vam_create_date = vam_create_date;
	}
	public Date getVam_update_date() {
		return vam_update_date;
	}
	public void setVam_update_date(Date vam_update_date) {
		this.vam_update_date = vam_update_date;
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
	
	
	public String getUpper_name() {
		return upper_name;
	}
	public void setUpper_name(String upper_name) {
		this.upper_name = upper_name;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmp_rank() {
		return emp_rank;
	}
	public void setEmp_rank(String emp_rank) {
		this.emp_rank = emp_rank;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
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
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getEmp_upper() {
		return emp_upper;
	}
	public void setEmp_upper(String emp_upper) {
		this.emp_upper = emp_upper;
	}
	public String getMaster_yn() {
		return master_yn;
	}
	public void setMaster_yn(String master_yn) {
		this.master_yn = master_yn;
	}
	public String getEmp_use_yn() {
		return emp_use_yn;
	}
	public void setEmp_use_yn(String emp_use_yn) {
		this.emp_use_yn = emp_use_yn;
	}
	public Date getEmp_effective_start_date() {
		return emp_effective_start_date;
	}
	public void setEmp_effective_start_date(Date emp_effective_start_date) {
		this.emp_effective_start_date = emp_effective_start_date;
	}
	public Date getEmp_effective_end_date() {
		return emp_effective_end_date;
	}
	public void setEmp_effective_end_date(Date emp_effective_end_date) {
		this.emp_effective_end_date = emp_effective_end_date;
	}
	public Date getEmp_create_date() {
		return emp_create_date;
	}
	public void setEmp_create_date(Date emp_create_date) {
		this.emp_create_date = emp_create_date;
	}
	public String getEmp_create_id_code() {
		return emp_create_id_code;
	}
	public void setEmp_create_id_code(String emp_create_id_code) {
		this.emp_create_id_code = emp_create_id_code;
	}
	public Date getEmp_update_date() {
		return emp_update_date;
	}
	public void setEmp_update_date(Date emp_update_date) {
		this.emp_update_date = emp_update_date;
	}
	public String getEmp_update_id_code() {
		return emp_update_id_code;
	}
	public void setEmp_update_id_code(String emp_update_id_code) {
		this.emp_update_id_code = emp_update_id_code;
	}
	@Override
	public String toString() {
		return "EmployeeDTO [emp_code=" + emp_code + ", name=" + name + ", emp_rank=" + emp_rank + ", org_code="
				+ org_code + ", gender=" + gender + ", phone=" + phone + ", join_date=" + join_date + ", emp_upper="
				+ emp_upper + ", master_yn=" + master_yn + ", emp_use_yn=" + emp_use_yn + ", emp_effective_start_date="
				+ emp_effective_start_date + ", emp_effective_end_date=" + emp_effective_end_date + ", emp_create_date="
				+ emp_create_date + ", emp_create_id_code=" + emp_create_id_code + ", emp_update_date="
				+ emp_update_date + ", emp_update_id_code=" + emp_update_id_code + ", org_name=" + org_name
				+ ", upper_name=" + upper_name + ", org_div=" + org_div + ", org_upper=" + org_upper + ", org_use_yn="
				+ org_use_yn + ", org_create_id_code=" + org_create_id_code + ", org_update_id_code="
				+ org_update_id_code + ", org_effective_start_date=" + org_effective_start_date
				+ ", org_effective_end_date=" + org_effective_end_date + ", org_create_date=" + org_create_date
				+ ", org_update_date=" + org_update_date + ", year=" + year + ", vam_use_yn=" + vam_use_yn
				+ ", vam_create_id_code=" + vam_create_id_code + ", vam_update_id_code=" + vam_update_id_code
				+ ", vam_effective_start_date=" + vam_effective_start_date + ", vam_effective_end_date="
				+ vam_effective_end_date + ", vam_create_date=" + vam_create_date + ", vam_update_date="
				+ vam_update_date + ", acq_days_num=" + acq_days_num + ", use_days_num=" + use_days_num
				+ ", res_days_num=" + res_days_num + ", org_code_name=" + org_code_name + ", id=" + id + "]";
	}


}