package kr.co.metanet.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.metanet.dao.MemberDAO;
import kr.co.metanet.dto.AuthorityDTO;
import kr.co.metanet.dto.MemberDTO;

@Service
public class MemberService_Impl implements MemberService{
	
    @Autowired
    MemberDAO dao;
    
    @Autowired
    private JavaMailSender mailSender;
    
    //로그인 확인
    @Override
    public MemberDTO login(MemberDTO dto) throws Exception{
    	return dao.login(dto);
    }
    
    //회원가입 + 이메일 전송
    @Override
    public void signup(MemberDTO dto) throws Exception{
    	dao.signup(dto);
    	System.out.println("처음 넘어옴2");
    	String key = new TempKey().getKey(50, false);
    	
    	System.out.println("넘어옴" + key);
    	dao.createAuthKey(dto.getId(), key); 
    	System.out.println("넘어옴2");
    	MailHandler sendMail = new MailHandler(mailSender);
    	sendMail.setSubject("[Mentanet User 회원가입 인증메일]");
    	sendMail.setText( 
    			new StringBuffer().append("<h1>안녕하세요. 인증을 하시려면 아래 링크를 클릭!</h1>").append("<a href='http://10.245.18.28:8080/login/emailConfirm?id=")
    			.append(dto.getId()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
    	sendMail.setFrom("kmlee95@gmail.com", "이경민"); 
    	sendMail.setTo(dto.getId()); 
    	sendMail.send();
    	System.out.println("종료");
    }
    //로그인 메뉴 권한 다르게
    @Override
    public AuthorityDTO loginMenu(String emp_code) throws Exception{
    	return dao.loginMenu(emp_code);
    }
    
    @Override
    public void signupguest(MemberDTO dto) throws Exception{
    	dao.signupguest(dto);
    }
    
    @Override
    public void userAuth(String id) throws Exception {
    	dao.userAuth(id);
    }
    
    @Override
    public void logout(HttpSession session) throws Exception{
    	session.invalidate();
    }
    
    @Override
 	public int userIdCheck(String id) throws Exception{
 		return dao.userIdCheck(id);
 	}
    @Override
 	public int userIdCodeCheck(String id_code) throws Exception{
 		return dao.userIdCodeCheck(id_code);
 	}
 
    
    @Override
 	public MemberDTO empCodeCheck(String emp_code) throws Exception{
 		return dao.empCodeCheck(emp_code);
 	}
	@Override
	public List<MemberDTO> getEmpCodeList() throws Exception {
		return dao.getEmpCodeList();
	}
}

