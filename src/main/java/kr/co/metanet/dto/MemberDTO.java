package kr.co.metanet.dto;

public class MemberDTO {
	private String id;  //
	private String id_code; //id_code
	
	private String id_code_guest; //게스트 아이디 코드
	private String guestId; //게스트 아이디
	private String guestPassword; //게스트 패스워드
	private String guest_id_use_yn;//게스트 아이디 사용 확인 y, n
	
    private String password; //비밀번호
    private String name; //이름
    private String join_date; //입사일자
    private String id_use_yn;//아이디 사용
    private String gender; //성별
    private String phone; //휴대폰 
	private String emp_code; //사원코드
	private String emp_use_yn; //emp 유효일자
	private String emp_rank; // 사원등급(부장, 이사 등등)
	private String certified_yn; //인증
	private String org_code; // 부서 코드
	
	private String org_name;//조직 이름
	private String org_div; //議곗쭅 援щ
	private String org_upper; //상위조직
	
	private int acq_days_num;//휴가 발생일 수
	private int use_days_num;//휴가 사용일 수
	private int res_days_num;//휴가 잔여일 수
	
	
	private String id_effective_start_date;//유효시작날자
	private String id_effective_end_date; //유효종료날자
	
	private String id_create_id_code;//생성자 아이디 코드
	private String id_update_id_code;//변경자 아이디 코드
	
	
	
	
	
	public String getId_code_guest() {
		return id_code_guest;
	}
	public void setId_code_guest(String id_code_guest) {
		this.id_code_guest = id_code_guest;
	}
	public String getGuestId() {
		return guestId;
	}
	public void setGuestId(String guestId) {
		this.guestId = guestId;
	}
	public String getGuestPassword() {
		return guestPassword;
	}
	public void setGuestPassword(String guestPassword) {
		this.guestPassword = guestPassword;
	}
	public String getGuest_id_use_yn() {
		return guest_id_use_yn;
	}
	public void setGuest_id_use_yn(String guest_id_use_yn) {
		this.guest_id_use_yn = guest_id_use_yn;
	}
	public String getId_effective_start_date() {
		return id_effective_start_date;
	}
	public void setId_effective_start_date(String id_effective_start_date) {
		this.id_effective_start_date = id_effective_start_date;
	}

	public String getId_effective_end_date() {
		return id_effective_end_date;
	}
	public void setId_effective_end_date(String id_effective_end_date) {
		this.id_effective_end_date = id_effective_end_date;
	}
	public String getId_use_yn() {
		return id_use_yn;
	}
	public void setId_use_yn(String id_use_yn) {
		this.id_use_yn = id_use_yn;
	}
	public String getId_create_id_code() {
		return id_create_id_code;
	}
	public void setId_create_id_code(String id_create_id_code) {
		this.id_create_id_code = id_create_id_code;
	}
	public String getId_update_id_code() {
		return id_update_id_code;
	}
	public void setId_update_id_code(String id_update_id_code) {
		this.id_update_id_code = id_update_id_code;
	}
	public int getAcq_days_num() {
		return acq_days_num;
	}
	public void setAcq_days_num(int acq_days_num) {
		this.acq_days_num = acq_days_num;
	}
	public int getUse_days_num() {
		return use_days_num;
	}
	public void setUse_days_num(int use_days_num) {
		this.use_days_num = use_days_num;
	}
	public int getRes_days_num() {
		return res_days_num;
	}
	public void setRes_days_num(int res_days_num) {
		this.res_days_num = res_days_num;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
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
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
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
