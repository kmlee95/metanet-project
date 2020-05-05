package kr.co.metanet.dao;

import java.util.List;
import java.util.Map;

import kr.co.metanet.dto.ApplicantListDTO;

public interface ApplicantListDAO {
	public List<ApplicantListDTO> getList(String empCodeOfLoginedMember);
	
	public void vaupdate(Map<Integer,String> map);
	public void vaupdate_rej(Map<String,String> map);
	
	
	
	
	public ApplicantListDTO getInfoOfLoginedMember(String empCodeOfLoginedMember) throws Exception;
	public List<ApplicantListDTO> getkidsannual(String empCodeOfLoginedMember) throws Exception;

}
