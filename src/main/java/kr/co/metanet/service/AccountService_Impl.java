package kr.co.metanet.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.co.metanet.dao.MemberDAO;
import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.search.Search;

@Service
public class AccountService_Impl implements AccountService {
	@Inject
	private MemberDAO memberDAO;

	public List<MemberDTO> getMemberList(Search search) throws Exception {
		return memberDAO.getMemberList(search);
	}

	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		memberDAO.updateMember(dto);
	}

	@Override
	public void deleteMember(String employCode) throws Exception {
		memberDAO.deleteMember(employCode);
	}

}
