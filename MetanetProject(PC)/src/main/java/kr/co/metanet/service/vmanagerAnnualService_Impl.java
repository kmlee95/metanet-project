package kr.co.metanet.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.metanet.dao.vmanagerAnnualDAO;
import kr.co.metanet.dto.AnnualDTO;
import kr.co.metanet.search.Search;

@Service
public class vmanagerAnnualService_Impl implements vmanagerAnnualService{
 
    @Autowired
    vmanagerAnnualDAO dao;

	@Override
	public List<AnnualDTO> List2(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.List2(search);
	}

	@Override
	public void updateDays(Map map) throws Exception {
		dao.updateDays(map);
	}

	@Override
	public void updateAqDate(String date) throws Exception {
		dao.updateAqDate(date);
	}
}