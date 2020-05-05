package kr.co.metanet.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.co.metanet.dao.MemberDAO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.search.Search;

@Service
public class AccountService_Impl implements AccountService {
	@Inject
	private MemberDAO memberDAO;

	//유저 리스트
	public List<MemberDTO> getMemberList(Search search) throws Exception {
		return memberDAO.getMemberList(search);
	}
	//유저 리스트 업데이트(하나씩)
	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		memberDAO.updateMember(dto);
	}
	
	//유저 리스트 삭제(하나씩)
	@Override
	public void deleteMember(String employCode) throws Exception {
		memberDAO.deleteMember(employCode);
	}
	
	//권한 리스트 불러오기(계정)
	@Override
	public List<AuthorityDTO> getAuthorityList() throws Exception{
		return memberDAO.getAuthorityList();
	}

	//권한 업데이트
	@Override
	public void updateAuthority(AuthorityDTO dto) throws Exception{
		memberDAO.updateAuthority(dto);
	}
	
	
}
