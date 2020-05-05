package kr.co.metanet.dao;

import java.util.List;

import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.search.Search;

public interface MemberDAO {
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	public AuthorityDTO loginMenu(String emp_code) throws Exception;
	
	//회원가입
	public void signup(MemberDTO dto) throws Exception;
	public void signupguest(MemberDTO dto) throws Exception;
	
	
	//메일인증
	public void createAuthKey(String userEmail, String authKey) throws Exception;
	public void userAuth(String userEmail) throws Exception;
	
	//아이디 check
	public int userIdCheck(String id) throws Exception;
	//아이디 코드check
	public int userIdCodeCheck(String id_code) throws Exception;

	//emp(사원번호) check
	public MemberDTO empCodeCheck(String emp_code) throws Exception;
	
	//계정관련 CRUD
	public List<MemberDTO> getMemberList(Search search) throws Exception;
	public int updateMember(MemberDTO dto) throws Exception;
	public int deleteMember(String employCode) throws Exception;
	
	//empcodelist 출력
	public List<MemberDTO> getEmpCodeList() throws Exception;
	
	
	//권한 리스트 출력
	public List<AuthorityDTO> getAuthorityList() throws Exception;
	//권한 업데이트
	public int updateAuthority(AuthorityDTO dto) throws Exception;
}
