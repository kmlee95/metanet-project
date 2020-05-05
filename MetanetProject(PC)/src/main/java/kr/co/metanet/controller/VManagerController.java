package kr.co.metanet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.metanet.search.Search;

import kr.co.metanet.service.vmanagerAnnualService;
import kr.co.metanet.service.vmanagerService;

@Controller
@RequestMapping("/login/vmanager/")
public class VManagerController {
   
   @Inject
   private vmanagerAnnualService AnnualService;
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   @RequestMapping(value = "vmanagerAnnual", method = RequestMethod.GET)
   public String list2(Model model, @RequestParam(required = false, defaultValue = "userId") String searchType,
         @RequestParam(required= false) String keyword) throws Exception {
      
      Search search = new Search();
      search.setSearchType(searchType);
      search.setKeyword(keyword);
      model.addAttribute("vmAnnual", service.List(search));
      return "vmanager/AnnualManage";
   }
   
   @RequestMapping(value = "/vmanagelist/update", method = RequestMethod.POST)
    public String VManageListUpdate2(String acq_days_num , String use_days_num, String res_days_num,  String emp_code) throws Exception {
       
       Map map = new HashMap();
       
       map.put("acq_days_num", acq_days_num);
       map.put("use_days_num", use_days_num);
       map.put("res_days_num", res_days_num);
       map.put("emp_code", emp_code);
                
       logger.info("cancel here!!"+ map);
       
       AnnualService.updateDays(map);
       
       
       return "vmanager/AnnualManage";
    }

      @RequestMapping(value = "/annual/check", method = RequestMethod.POST)
      @ResponseBody
      public String annual_check(@RequestParam(value = "annualArr[]") List<String> annualArr) throws Exception {
         
          List<String> annArr = new ArrayList();
          annArr = annualArr;
         
         for(String item : annualArr) {
            AnnualService.updateAqDate(item);
            System.out.println(item);
            logger.info(item.toString());
            }
         return "vmanager/AnnualManage";
      }
   
   
   @Autowired
   vmanagerService service;

   @RequestMapping(value = "vmanagelist", method = RequestMethod.GET)
   public String list(Model model, @RequestParam(required = false, defaultValue = "userId") String searchType,
         @RequestParam(required = false) String keyword) throws Exception {

      Search search = new Search();
      search.setSearchType(searchType);
      search.setKeyword(keyword);
      model.addAttribute("vmlist", service.List(search));
      return "vmanager/vmanageList";
   }
}