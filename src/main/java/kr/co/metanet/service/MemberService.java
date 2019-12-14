package kr.co.metanet.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import kr.co.metanet.dto.MemberDTO;

public interface MemberService {
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	//회원가입
	public void signup(MemberDTO dto) throws Exception;
	public void userAuth(String id) throws Exception;
	
	
	//로그아웃
	public void logout(HttpSession session) throws Exception;
	
	//아이디 체크
	public int userIdCheck(String id) throws Exception;
	
	//아이디 코드 체크
	public int userIdCodeCheck(String id_code) throws Exception;
	
	//emp code check
	public MemberDTO empCodeCheck(String emp_code) throws Exception;
	
	//사원 코드 리스트
	public List<MemberDTO> getEmpCodeList() throws Exception;
	
}
