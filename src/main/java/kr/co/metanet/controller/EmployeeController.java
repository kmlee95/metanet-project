package kr.co.metanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login/employee/")
public class EmployeeController {
	@RequestMapping(value = "/applyforvacation")
	public String ApplyVacation() {
		return "employee/ApplyForVacation";
	}
}
