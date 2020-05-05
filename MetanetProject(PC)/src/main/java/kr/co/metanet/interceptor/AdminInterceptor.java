package kr.co.metanet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.metanet.dto.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	 @Override
	 public boolean preHandle(HttpServletRequest req,
	    HttpServletResponse res, Object obj) throws Exception {
	  
	  HttpSession session = req.getSession();
	  MemberDTO member = (MemberDTO)session.getAttribute("member"); //현재 세션을 불러와 member로 변환(MemberDTO타입)
	  
	  if(member==null) {
		  res.sendRedirect("/login");
		  return false;
	  }
	  return true;
	 }
}