package com.obn.kidscafe.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.obn.kidscafe.service.SearchService;
import com.obn.kidscafe.vo.OrderVO;
import com.obn.kidscafe.vo.ReserveVO;
import com.obn.kidscafe.vo.TcChkVO;

@Controller
public class SearchController {
	@Autowired
	SearchService searchService;

	@RequestMapping(value = "/search/kidscafeList")
	public String searchList(Model model, @RequestParam String date, @RequestParam String location,
			@RequestParam int count) {
		model.addAttribute("jsonCafeList", searchService.searchList(date, location, count));
		model.addAttribute("cafelist", searchService.searchListVO(date, location, count));
		return "kidscafes/kidscafeList";
	}

	@RequestMapping(value = "/search/kidscafeInfo", method = RequestMethod.GET)
	public String cafeById(Model model, String kc_id, @RequestParam(required = false) String date, @RequestParam(required = false) String rst) {
		model.addAttribute("cafe", searchService.selectByCafeId(kc_id));
		model.addAttribute("reviewlist", searchService.selectCafeAll(kc_id));
		model.addAttribute("ticket", searchService.selectByKCafeId(kc_id));
		model.addAttribute("schedule", searchService.selectByKcId(kc_id));
		if(date!=null) {
			model.addAttribute("date", date);
		}else {
			LocalDate date1 = LocalDate.now();
			String defaultDate = date1.format(DateTimeFormatter.BASIC_ISO_DATE);
			model.addAttribute("date", defaultDate);
		}
		if (rst!=null) {
			model.addAttribute("msg","예약이 성공적으로 완료되었습니다.");
			model.addAttribute("rst", rst);
			if(rst.equals("false")) model.addAttribute("msg", "예약이 실패했습니다ㅠㅠ");
		}
		return "kidscafes/kidscafeInfo";
	}
	
	@RequestMapping(value = "/search/kidscafeInfo/tcChk")
	public String tcChk(Model model, String s_id, String date, int dayOfWeek) {
		TcChkVO tcChk = searchService.selectTcChk(s_id, date);
		
		model.addAttribute("rsvCount",tcChk==null?0:tcChk.getRsv_count());
		
		model.addAttribute("schedule",searchService.selectBySId(s_id));
		model.addAttribute("dayOfWeek", dayOfWeek);
		return "kidscafes/tcChk";
	}
	
	//reserve
	@RequestMapping(value = "/search/kidscafeInfo/reservation", method = RequestMethod.POST)
	public String reservePost( Model model, ReserveVO rsv, @RequestParam int k_count, @RequestParam int a_count, @RequestParam String tc_idk, @RequestParam String tc_ida) {

		int rst1 = searchService.insertRsv(rsv);
		OrderVO kOrder = new OrderVO(rsv.getRsv_id(), tc_idk, k_count);
		int rst2 = searchService.insertOrder(kOrder);
		if (a_count!=0) {
		OrderVO aOrder = new OrderVO(rsv.getRsv_id(), tc_ida, a_count);
		searchService.insertOrder(aOrder);
		}
		String rst ="";
		if(rst1>0 && rst2>0) rst="true";
		else if(rst1==0 || rst2==0) rst="false";
		
		return "redirect:/search/kidscafeInfo?kc_id="+rsv.getKc_id() + "&rst="+rst;
	}
	
}
