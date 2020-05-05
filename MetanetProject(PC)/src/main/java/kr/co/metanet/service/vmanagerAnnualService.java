package kr.co.metanet.service;

import java.util.List;
import java.util.Map;

import kr.co.metanet.dto.AnnualDTO;
import kr.co.metanet.search.Search;


public interface vmanagerAnnualService {
	public List<AnnualDTO> List2(Search search) throws Exception;
	
	public void updateDays(Map map) throws Exception;

	//public EmployeeDTO List(EmployeeDTO dto);
	
	public void updateAqDate(String date) throws Exception;

}