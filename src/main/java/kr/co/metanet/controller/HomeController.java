package kr.co.metanet.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	@Autowired
	MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "/login/submain";
	}

	// 유저 정보
	@RequestMapping(value = "/login/userinfo", method = RequestMethod.GET)
	public String userinfo() {
		return "/login/userinfo";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String logins() {
		return "/login/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");

		HttpSession session = req.getSession(true);
		MemberDTO login = service.login(dto);

		if (login == null) {
			System.out.println("실패");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);

		} else {
			System.out.println("성공");
			session.setAttribute("member", login); // session의 login 값을 member라는 key로 저장
			return "redirect:/login/userinfo";

		}
		return "redirect:/login";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");
		service.logout(session);
		return "redirect:/login";
	}

	// 회원가입
	@RequestMapping(value = "/login/signup")
	public String signup() {
		return "login/signup";
	}

	@RequestMapping(value = "/login/signupcheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> signup(MemberDTO dto) throws Exception {
		logger.info(dto.getId());
		Map<String, Object> result = new HashMap<>();
		try {
			service.signup(dto);
			result.put("status", "OK");
		}catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}

	
	// 회원가입 - 이메일 인증
	@RequestMapping(value = "/login/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String userId, Model model) throws Exception { // 이메일 인증 확인창
		service.userAuth(userId);
		model.addAttribute("userId", userId);

		return "/login/emailConfirm"; 
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/login/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) throws Exception{
		return service.userIdCheck(userId);
	}

}
