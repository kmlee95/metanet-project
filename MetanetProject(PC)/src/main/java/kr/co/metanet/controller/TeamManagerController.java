package kr.co.metanet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.service.ApplicantListService;

@Controller

@RequestMapping(value = "/login/teamnanager")
public class TeamManagerController {
	
	@Autowired
	ApplicantListService service;
	
	@RequestMapping(value = "/applicantlist")
	public String ApplycantList(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String empCodeOfLoginedMember = member.getEmp_code();
		System.out.println(empCodeOfLoginedMember);
		model.addAttribute("me", service.getInfoOfLoginedMember(empCodeOfLoginedMember));
		model.addAttribute("kids", service.getList(empCodeOfLoginedMember));
		model.addAttribute("annualbreak", service.getkidsannual(empCodeOfLoginedMember));
		
		System.out.println(service.getList(empCodeOfLoginedMember).toString());
		System.out.println(session.getAttribute("member"));

		return "teammanager/ApplicantList";
	}
	
	
	
	//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*
	@RequestMapping(value = "/test",method=RequestMethod.POST)
	@ResponseBody
	public Object ajax_approve(@RequestBody Map<Integer,String> fruitList) throws Exception {	//占쎈뱟占쎌뵥
		
		Map<Integer, String> map = fruitList;
		service.vaupdate(map);
		return map;
		
	}
	
	@RequestMapping(value = "/test2",method=RequestMethod.POST)
	@ResponseBody
	public Object ajax_rej(@RequestBody List<String> arr) throws Exception {	//獄쏆꼶�젻
		Map<String, String> map = new HashMap<>();
		map.put("va_code", arr.get(0));
		map.put("rej_reason", arr.get(1));
		service.vaupdate_rej(map);
		return "teammanager/ApplicantList";
		
	}	
	
	//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*
}
