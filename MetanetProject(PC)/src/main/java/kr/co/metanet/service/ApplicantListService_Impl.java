package kr.co.metanet.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.metanet.dao.ApplicantListDAO;
import kr.co.metanet.dto.ApplicantListDTO;



@Service
public class ApplicantListService_Impl implements ApplicantListService {
	
	@Inject
	private ApplicantListDAO testlistdao;

	@Override
	public List<ApplicantListDTO> getList(String empCodeOfLoginedMember) {
		// TODO Auto-generated method stub
		return testlistdao.getList(empCodeOfLoginedMember);
	}

	@Override
	public void vaupdate(Map<Integer, String> map) {
		// TODO Auto-generated method stub
		testlistdao.vaupdate(map);
	}

	@Override
	public void vaupdate_rej(Map<String, String> map) {
		// TODO Auto-generated method stub
		testlistdao.vaupdate_rej(map);
	}

	@Override
	public ApplicantListDTO getInfoOfLoginedMember(String empCodeOfLoginedMember) throws Exception {
		// TODO Auto-generated method stub
		return testlistdao.getInfoOfLoginedMember(empCodeOfLoginedMember);
	}

	@Override
	public List<ApplicantListDTO> getkidsannual(String empCodeOfLoginedMember) throws Exception {
		// TODO Auto-generated method stub
		return testlistdao.getkidsannual(empCodeOfLoginedMember);
	}
	
	
	
	
}
