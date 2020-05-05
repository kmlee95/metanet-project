package kr.co.metanet.dto;

public class AuthorityDTO {
	private String id;  // 아이디
	private String id_code; // 아이디코드
    private String password; // 패스워드
	private String emp_code; //사원코드
	
	private String id_code_auth; //id코드 권한쪽
	private String ag_code; // 권한 그룹 코드 AG0000, AG0001, AG0002, AG0003, AG0004
	private String AG0001;//일반사용자
	private String AG0002;//휴가승인자
	private String AG0003;//휴가 업무 관리자
	private String AG0004;//계정관리자
	
	private String aa_use_yn; // 해당 코드 사용 유무
	private String aa_effective_start_date; // 계정당 하나의 권한의 유효 날짜(시작)
	private String aa_effective_end_date; //계정당 하나의 권한의 유효날짜(종료)
	
	private String ag_name; // 권한 그룹코드 이름
	
	
	private String AG0001_end_date; //AG0001 ~ 4 만료날자
	private String AG0002_end_date;
	private String AG0003_end_date;
	private String AG0004_end_date;

	
	
	
	
	public String getId_code_auth() {
		return id_code_auth;
	}

	public void setId_code_auth(String id_code_auth) {
		this.id_code_auth = id_code_auth;
	}

	public String getAG0001_end_date() {
		return AG0001_end_date;
	}

	public void setAG0001_end_date(String aG0001_end_date) {
		AG0001_end_date = aG0001_end_date;
	}

	public String getAG0002_end_date() {
		return AG0002_end_date;
	}

	public void setAG0002_end_date(String aG0002_end_date) {
		AG0002_end_date = aG0002_end_date;
	}

	public String getAG0003_end_date() {
		return AG0003_end_date;
	}

	public void setAG0003_end_date(String aG0003_end_date) {
		AG0003_end_date = aG0003_end_date;
	}

	public String getAG0004_end_date() {
		return AG0004_end_date;
	}

	public void setAG0004_end_date(String aG0004_end_date) {
		AG0004_end_date = aG0004_end_date;
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

	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getAg_code() {
		return ag_code;
	}

	public void setAg_code(String ag_code) {
		this.ag_code = ag_code;
	}

	public String getAa_use_yn() {
		return aa_use_yn;
	}

	public void setAa_use_yn(String aa_use_yn) {
		this.aa_use_yn = aa_use_yn;
	}

	public String getAa_effective_start_date() {
		return aa_effective_start_date;
	}

	public void setAa_effective_start_date(String aa_effective_start_date) {
		this.aa_effective_start_date = aa_effective_start_date;
	}

	public String getAa_effective_end_date() {
		return aa_effective_end_date;
	}

	public void setAa_effective_end_date(String aa_effective_end_date) {
		this.aa_effective_end_date = aa_effective_end_date;
	}

	public String getAg_name() {
		return ag_name;
	}

	public void setAg_name(String ag_name) {
		this.ag_name = ag_name;
	}

	public String getAG0001() {
		return AG0001;
	}

	public void setAG0001(String aG0001) {
		AG0001 = aG0001;
	}

	public String getAG0002() {
		return AG0002;
	}

	public void setAG0002(String aG0002) {
		AG0002 = aG0002;
	}

	public String getAG0003() {
		return AG0003;
	}

	public void setAG0003(String aG0003) {
		AG0003 = aG0003;
	}

	public String getAG0004() {
		return AG0004;
	}

	public void setAG0004(String aG0004) {
		AG0004 = aG0004;
	}

	
}
