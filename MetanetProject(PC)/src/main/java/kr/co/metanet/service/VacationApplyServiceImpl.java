package kr.co.metanet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.dao.VacationApplyDAO;
import kr.co.metanet.dto.CodeDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;

@Service
public class VacationApplyServiceImpl implements VacationApplyService{
	
	// DAO 맵핑
	@Autowired
	VacationApplyDAO applyDao;

	// 휴가 신청 작성
	@Override
	public void writeApply(VacationApplyDTO apply) throws Exception {
		applyDao.writeApply(apply);
	}
	
	// 휴가 유형 가져오기
	@Override
	public List<CodeDTO> selectVacationCode(CodeDTO dto) throws Exception {
		return applyDao.selectVacationCode(dto);
	}

	@Override
	public List<VacationApplyDTO> selectVacationList(VacationApplyDTO dto) throws Exception {
		return applyDao.selectVacationList(dto);
	}

	@Override
	public List<EmployeeDTO> selectVacationMyInfo(EmployeeDTO dto) throws Exception {
		return applyDao.selectVacationMyInfo(dto);
	}


	@Override
	public void deletApply(String num) throws Exception {
		applyDao.deletApply(num);
		
	}

	@Override
	public void updateApply(VacationApplyDTO dto) throws Exception {
		applyDao.updateApply(dto);
	}

	@Override
	public VacationApplyDTO selectApply(String num) throws Exception {
		return applyDao.selectApply(num);  
	}
	
}
