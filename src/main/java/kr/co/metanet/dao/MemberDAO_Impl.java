package kr.co.metanet.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.search.Search;

@Repository
public class MemberDAO_Impl implements MemberDAO {
	public static final String NAMESPACE = "Member";
	@Autowired
	SqlSession sql;

	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return sql.selectOne(NAMESPACE + ".login", dto);
	}

	// 회원가입
	@Override
	public void signup(MemberDTO dto) throws Exception {
		sql.insert("Member.signup", dto);
	}

	// 회원가입 이메일 인증 - 임시 데이터
	@Override
	public void createAuthKey(String userId, String authKey) throws Exception { // 인증키 DB에 넣기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userId", userId);
		map.put("authKey", authKey);

		sql.selectOne(NAMESPACE + ".createAuthKey", map);
	}

	// 회원가입 이메일 인증 - 권한 변경
	@Override
	public void userAuth(String userId) throws Exception { // 인증키 일치시 DB칼럼(인증여부) false->true 로 변경
		sql.update(NAMESPACE + ".userAuth", userId);
	}

	// 계정관련 crud
	//유저 검색  + 유저 리스트 확인
	@Override
	public List<MemberDTO> getMemberList(Search search) throws Exception {
		return sql.selectList(NAMESPACE + ".getMemberList", search);
	}

	@Override
	public int updateMember(MemberDTO dto) throws Exception {
		return sql.update(NAMESPACE + ".updateMember", dto);
	}

	@Override
	public int deleteMember(String employCode) throws Exception {
		return sql.delete(NAMESPACE + ".deleteMember", employCode);
	}



}