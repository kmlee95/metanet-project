package kr.co.metanet.service;

import javax.servlet.http.HttpSession;

import kr.co.metanet.dto.MemberDTO;

public interface MemberService {
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	//회원가입
	public void signup(MemberDTO dto) throws Exception;
	public void userAuth(String userId) throws Exception;
	
	
	//로그아웃
	public void logout(HttpSession session) throws Exception;
}
