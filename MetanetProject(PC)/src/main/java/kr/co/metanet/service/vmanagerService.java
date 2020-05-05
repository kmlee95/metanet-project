package kr.co.metanet.service;

import java.util.List;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.search.Search;

public interface vmanagerService {
	public List<EmployeeDTO> List(Search search) throws Exception;

}