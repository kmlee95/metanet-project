package kr.co.metanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//휴가 등록
@Controller
@RequestMapping("/login/employee/")
public class EmployeeController {
	@RequestMapping(value = "/applyforvacation")
	public String ApplyVacation() {
		return "employee/ApplyForVacation";
	}
}
