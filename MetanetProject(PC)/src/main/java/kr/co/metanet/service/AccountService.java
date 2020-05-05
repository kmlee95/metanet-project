package kr.co.metanet.service;

import java.util.List;

import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.search.Search;


public interface AccountService {
	//유저 전체 리스트 + 유저 검색
	public List<MemberDTO> getMemberList(Search search) throws Exception;
	
	//유저 업데이트
	public void updateMember(MemberDTO dto) throws Exception;
	
	//유저 삭제
	public void deleteMember(String employCode) throws Exception;
	
	
	//권한 리스트
	public List<AuthorityDTO> getAuthorityList() throws Exception;
	
	
	//권한 업데이트
	public void updateAuthority(AuthorityDTO dto) throws Exception;
}
