package kr.co.metanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/teamnanager/")
public class TeamManagerController {
	@RequestMapping(value = "/applicantlist")
	public String ApplycantList() {
		return "teammanager/ApplicantList";
	}
}
