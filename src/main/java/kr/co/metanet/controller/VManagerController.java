package kr.co.metanet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/vmanager/")
public class VManagerController {
	@RequestMapping(value = "/annual")
	public String Annual() {
		return "vmanager/AnnualManage";
	}


	@RequestMapping(value = "/vmanagelist")
	public String VManageList() {
		return "vmanager/vmanageList";
	}

}
