package kr.co.metanet.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.metanet.dto.MemberDTO;
import kr.co.metanet.service.AccountService;

@Controller
@RequestMapping("/login/account/")
public class AccoutControllerAjax {
	@Inject
	private AccountService accountService;

	
	//계정 수정
	@RequestMapping(value = "/updateMember", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> updateMenu(MemberDTO dto) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			accountService.updateMember(dto);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}

	//계정 삭제
	@RequestMapping(value = "/deleteMember", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> deleteMenu(@RequestParam("employCode") String employCode) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			accountService.deleteMember(employCode);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
		}
		return result;
	}

}
