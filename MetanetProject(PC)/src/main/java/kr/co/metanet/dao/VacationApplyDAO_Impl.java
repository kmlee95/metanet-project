package kr.co.metanet.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.metanet.dto.CodeDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.VacationApplyDTO;

@Repository
public class VacationApplyDAO_Impl implements VacationApplyDAO {
	public static final String NAMESPACE = "Apply";
	@Autowired
	SqlSession sql;

	// 휴가 유형 목록
	@Override
	public List<CodeDTO> selectVacationCode(CodeDTO dto) throws Exception {
		return sql.selectList(NAMESPACE + ".selectVacationCode", dto);
	}

	// 휴가 신청
	@Override
	public void writeApply(VacationApplyDTO dto) throws Exception {
		sql.insert(NAMESPACE + ".writeApply", dto);
	}

	// 휴가 신청 목록
	@Override
	public List<VacationApplyDTO> selectVacationList(VacationApplyDTO dto) throws Exception {
		return sql.selectList(NAMESPACE + ".selectVacationList", dto);
	}

	// 휴가 신청 페이지 내정보
	@Override
	public List<EmployeeDTO> selectVacationMyInfo(EmployeeDTO dto) throws Exception {
		return sql.selectList(NAMESPACE + ".selectVacationMyInfo", dto);
	}

	// 휴가 신청 삭제
	@Override
	public void deletApply(String num) throws Exception {
		sql.delete(NAMESPACE + ".deletApply", num);
	}

	// 휴가 신청 정보 수정
	@Override
	public void updateApply(VacationApplyDTO dto) throws Exception {
		sql.update(NAMESPACE + ".updateApply", dto);

	}

	// 휴가 신청 상제 정보 가져오기
	@Override
	public VacationApplyDTO selectApply(String num) throws Exception {

		return sql.selectOne(NAMESPACE + ".selectApply", num);

	}

}