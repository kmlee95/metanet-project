package kr.co.metanet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.search.Search;

@Repository
public class vmanagerListDAO_lmpl implements vmanagerListDAO {
	public static final String NAMESPACE ="List";
	@Autowired
	SqlSession sql;

	public List<EmployeeDTO> List(Search search) throws Exception{
		return sql.selectList(NAMESPACE+".List", search);
	}
	
}
