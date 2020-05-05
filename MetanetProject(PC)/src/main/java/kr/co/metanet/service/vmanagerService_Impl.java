package kr.co.metanet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.metanet.dao.vmanagerListDAO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.search.Search;

@Service
public class vmanagerService_Impl implements vmanagerService{
 
    @Autowired
    vmanagerListDAO dao;

	@Override
	public List<EmployeeDTO> List(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.List(search);
	}

		
	}

