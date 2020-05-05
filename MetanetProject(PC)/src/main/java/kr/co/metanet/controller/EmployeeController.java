package kr.co.metanet.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.dao.VacationApplyDAO;
import kr.co.metanet.dto.CodeDTO;
import kr.co.metanet.dto.EmployeeDTO;
import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.dto.VacationApplyDTO;
import kr.co.metanet.service.VacationApplyService;

@Controller
@RequestMapping("/login/employee/")
public class EmployeeController {
	
	@Autowired
	VacationApplyDAO vkindDao;
	@Autowired
	VacationApplyService vapplyService;
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@RequestMapping(value = "/applyforvacation", method = RequestMethod.GET)
	public String ApplyVacation(Model model, CodeDTO kind , HttpSession session
			                    , VacationApplyDTO vacationDto, EmployeeDTO empDto) throws Exception {
		
		//휴가 유형 
		List<CodeDTO> codeList = vapplyService.selectVacationCode(kind);
		model.addAttribute("codelist", codeList);
		
		// 로그인 한 유저 ID 가져오기 
		MemberDTO MemberDTO = (MemberDTO) session.getAttribute("member");
		
		// 휴가 신청 목록 리스트
		vacationDto.setId(MemberDTO.getId());
        List<VacationApplyDTO> applyList = vapplyService.selectVacationList(vacationDto);
        model.addAttribute("applyList", applyList);
		
		
		// 휴가 신청 유저 정보 가져오기
        empDto.setId(MemberDTO.getId());
		vapplyService.selectVacationMyInfo(empDto);
		model.addAttribute("myinfo", vapplyService.selectVacationMyInfo(empDto));
			
		return "employee/ApplyForVacation";
	}
	
	
	@RequestMapping(value = "/applyforvacation", method=RequestMethod.POST )
	public String ApplyVacation_apply(VacationApplyDTO dto , Model model,
			HttpServletRequest req, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		//로그인한 사용자 정보
		MemberDTO MemberDTO = (MemberDTO) session.getAttribute("member");
		dto.setId(MemberDTO.getId());
		
		//휴가 신청
		vapplyService.writeApply(dto);
		
		return "redirect:/login/employee/applyforvacation"; 
	}
	
	@RequestMapping(value = "/applyforvacation/update", method=RequestMethod.POST )
	public String updatePost(String va_code, String va_start_date, String va_end_date,
			           String vk_code_name, String va_reason, 
			VacationApplyDTO dto, Model model, HttpSession session) throws Exception{

		// 휴가 정보 업데이트
		vapplyService.updateApply(dto);
		System.out.println("va_code : " + va_code);
		
		return "redirect:/login/employee/applyforvacation";

	}
	
	@RequestMapping(value = "/applyforvacation/update", method=RequestMethod.GET )
	public String updateGet(String va_code,
			VacationApplyDTO dto, Model model, HttpSession session) throws Exception{
		
		// 선택된 글번호로 글정보 불러오기
		VacationApplyDTO applyInfo = vapplyService.selectApply(va_code);
		model.addAttribute("applyInfo", applyInfo);
		System.out.println("휴가신청정보" + applyInfo);
		System.out.println("휴가신청번호 : " + va_code);

		
		return "redirect:/login/employee/applyforvacation";
	}

	
	@RequestMapping(value="/applyforvacation/delete", method=RequestMethod.GET) 
	public String commentSubmit(Model model, String va_code) throws Exception{
		
		vapplyService.deletApply(va_code);
		
		return "redirect:/login/employee/applyforvacation";
	}
	
	
}
