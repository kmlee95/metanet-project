package kr.co.metanet.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.metanet.dao.MemberDAO;
import kr.co.metanet.dto.MemberDTO;

@Service
public class MemberService_Impl implements MemberService{
 
    @Autowired
    MemberDAO dao;
    
    @Inject
    private JavaMailSender mailSender;
    
    @Override
    public MemberDTO login(MemberDTO dto) throws Exception{
    	return dao.login(dto);
    }
    
    //회원가입
    @Override
    public void signup(MemberDTO dto) throws Exception{
    	dao.signup(dto);
    	String key = new TempKey().getKey(50, false); // 인증키 생성
    	dao.createAuthKey(dto.getId(), key); // 인증키 DB저장
    	MailHandler sendMail = new MailHandler(mailSender);
    	sendMail.setSubject("[Mentanet User 홈페이지 이메일 인증]"); // 메일제목
    	sendMail.setText( // 메일내용
    			new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/login/emailConfirm?userId=")
    			.append(dto.getId()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
    	sendMail.setFrom("kmlee95@gmail.com", "이경민"); // 보낸이
    	sendMail.setTo(dto.getId()); // 받는이
    	sendMail.send();
    }
    
    
    @Override
    public void userAuth(String userId) throws Exception {
    	dao.userAuth(userId);
    }
    
    @Override
    public void logout(HttpSession session) throws Exception{
    	session.invalidate();
    }
    
    @Override
 	public int userIdCheck(String userId) throws Exception{
 		return dao.userIdCheck(userId);
 	}
    
}

