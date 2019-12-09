package kr.co.metanet.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.metanet.search.Search;
import kr.co.metanet.service.AccountService;

@Controller
@RequestMapping("/login/account/")
public class AccountController {

	@Inject
	private AccountService accountService;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String getMemberList(Model model, @RequestParam(required = false, defaultValue = "userId") String searchType,
			@RequestParam(required = false) String keyword) throws Exception {
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		model.addAttribute("member", accountService.getMemberList(search));
		return "accountmanager/registration";
	}

}
