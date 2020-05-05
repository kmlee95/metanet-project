package kr.co.metanet.service;

import java.util.List;

import kr.co.metanet.dto.CodeDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;

public interface VacationApplyService {

	// 휴가 신청 작성
	public void writeApply(VacationApplyDTO apply) throws Exception;

	// 휴가 유형 가져오기
	public List<CodeDTO> selectVacationCode(CodeDTO dto) throws Exception;

	// 휴가 신청 목록
	public List<VacationApplyDTO> selectVacationList(VacationApplyDTO dto) throws Exception;

	// 휴가 신청 페이지 내 정보
	public List<EmployeeDTO> selectVacationMyInfo(EmployeeDTO dto) throws Exception;

	// 휴가 신청 삭제
	public void deletApply(String num) throws Exception;

	// 휴가 신청 수정
	public void updateApply(VacationApplyDTO dto) throws Exception;

	// 휴가 신청 정보 가져오기
	public VacationApplyDTO selectApply(String num) throws Exception;

}