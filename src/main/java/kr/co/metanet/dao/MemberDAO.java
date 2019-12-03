package kr.co.metanet.dao;

import java.util.List;

import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.search.Search;

public interface MemberDAO {
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	//회원가입
	public void signup(MemberDTO dto) throws Exception;
	
	//메일인증
	public void createAuthKey(String userEmail, String authKey) throws Exception;
	public void userAuth(String userEmail) throws Exception;
	
	
	
	//계정관련 CRUD
	public List<MemberDTO> getMemberList(Search search) throws Exception;
	public int updateMember(MemberDTO dto) throws Exception;
	public int deleteMember(String employCode) throws Exception;
}
