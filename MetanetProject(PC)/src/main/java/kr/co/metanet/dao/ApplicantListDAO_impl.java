package kr.co.metanet.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.metanet.dto.ApplicantListDTO;
@Repository
public class ApplicantListDAO_impl implements ApplicantListDAO{
	@Autowired
	SqlSession sql;
	@Override
	public List<ApplicantListDTO> getList(String empCodeOfLoginedMember) {
		// TODO Auto-generated method stub
		return sql.selectList("ApplicantList.testlist", empCodeOfLoginedMember);
	}
	@Override
	public void vaupdate(Map<Integer, String> map) {

		for(Integer i : map.keySet()) {

			String va_code = map.get(i);
			ApplicantListDTO dto = new ApplicantListDTO();
			dto = sql.selectOne("ApplicantList.testlittle", va_code);
			check(dto);
		}
	}
	@Override
	public void vaupdate_rej(Map<String, String> map) {
		// TODO Auto-generated method stub
		ApplicantListDTO dto = new ApplicantListDTO();
		dto = sql.selectOne("ApplicantList.testlittle", map.get("va_code"));
		
		if(dto.getVs_code().equals("VS2")==true ||dto.getVs_code().equals("VS3")==true) {
			return;
		}
		
		sql.update("ApplicantList.updateRej", map);

	}	
	
	
	public void check(ApplicantListDTO dto) {
		
		if(dto.getVs_code().equals("VS2")==true ||dto.getVs_code().equals("VS3")==true) {
			return;
		}
		if(dto.getVk_code().equals("VK1") || dto.getVk_code().equals("VK2")) {	
			if(dto.getRes_days_num()>=dto.getVa_days_num()) {	

				HashMap<String, Object> map = new HashMap<String, Object>();
				
				dto.setRes_days_num(dto.getRes_days_num()-dto.getVa_days_num());
				dto.setUse_days_num(dto.getUse_days_num()+dto.getVa_days_num());
				
				map.put("emp_code", dto.getApply_emp_code());
				map.put("Res_days_num", dto.getRes_days_num());
				map.put("Use_days_num", dto.getUse_days_num());
 				
				sql.update("ApplicantList.updateDays", map);
				sql.update("ApplicantList.approve", dto.getVa_code());

			}
		}else {
			
			sql.update("ApplicantList.approve", dto.getVa_code());
		}
	}
	
	@Override
	public ApplicantListDTO getInfoOfLoginedMember(String empCodeOfLoginedMember) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("ApplicantList.test",empCodeOfLoginedMember);
	}

	@Override
	public List<ApplicantListDTO> getkidsannual(String empCodeOfLoginedMember) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("ApplicantList.kidsanuualbreak", empCodeOfLoginedMember);
	}

}
