package kr.co.metanet.dao;

import java.util.List;

import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.search.Search;

public interface vmanagerListDAO {
	public List<EmployeeDTO> List(Search search) throws Exception;


}
