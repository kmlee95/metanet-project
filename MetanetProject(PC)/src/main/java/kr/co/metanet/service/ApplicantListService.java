package kr.co.metanet.service;

import java.util.List;
import java.util.Map;

import kr.co.metanet.dto.ApplicantListDTO;



public interface ApplicantListService {
	
	//testlistdao
	public List<ApplicantListDTO> getList(String empCodeOfLoginedMember) throws Exception;
	public void vaupdate(Map<Integer, String> map) throws Exception;
	public void vaupdate_rej(Map<String, String> map) throws Exception;
	
	//testdao
	public ApplicantListDTO getInfoOfLoginedMember(String empCodeOfLoginedMember) throws Exception;
	public List<ApplicantListDTO> getkidsannual(String empCodeOfLoginedMember) throws Exception;	
}
