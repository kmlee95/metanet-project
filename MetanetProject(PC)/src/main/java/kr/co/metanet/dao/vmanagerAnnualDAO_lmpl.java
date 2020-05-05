package kr.co.metanet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.metanet.dto.AnnualDTO;
import kr.co.metanet.search.Search;

@Repository
public class vmanagerAnnualDAO_lmpl implements vmanagerAnnualDAO {
	public static final String NAMESPACE ="Annual";
	
	@Autowired
	SqlSession sql;

	public List<AnnualDTO> List2(Search search) throws Exception{
		return sql.selectList(NAMESPACE+".List2", search);
	}
	
	@Override
	public void updateDays(Map map) throws Exception {
		sql.update(NAMESPACE + ".updateDays", map);
	}
	
	@Override
	public void updateAqDate(String date) throws Exception {
		sql.update(NAMESPACE+".updateAqDate", date);
		
	}
	
	}

