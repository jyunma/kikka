package com.obn.kidscafe.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.obn.kidscafe.service.MainService;
import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.UserVO;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	
	@RequestMapping("/main")
	public String mainPage(Model model) {
		model.addAttribute("gulist",mainService.selectGuAll());
		return "main/main";
	}
	
	@RequestMapping("/main/aboutOBN")
	public String aboutOBNPage(Model model) {
		return "main/aboutOBN";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String mainPagePost(Model model, String date, String location, String count) {
		return "redirect:/search/kidscafeList?date="+date+"&location="+location+"&count="+count;
	}
	

	// 로그인
	@RequestMapping("/main/login")
	public String loginPageGet(Model model, @RequestParam(required = false)String join, @RequestParam(required = false)String idpass) {
		if(join!=null) {
			model.addAttribute("join","true");
		}
		if(idpass!=null) {
			model.addAttribute("idpass","true");
		}
		return "main/login";
	}

	// 카페로그인
	@RequestMapping(value = "/main/klogin", method = RequestMethod.POST)
	public String loginPageCafePost(String kc_id, String kc_password, HttpSession session, String kind) {
		session.setAttribute("mem_info", kind);

		CafeVO cafe = mainService.cafeLoginCheck(kc_id, kc_password); // 컨트롤러 서비스 dao
		if (cafe == null) {
			return "redirect:/main/login?idpass=true";
		}
		session.setAttribute("cafe", cafe);
		return "redirect:/main/myPage/kidscafe";
	}

	// 고객로그인
	@RequestMapping(value = "/main/ulogin", method = RequestMethod.POST)
	public String loginPageUserPost(String user_id, String user_password, HttpSession session, String kind) {
		session.setAttribute("mem_info", kind);
		UserVO user = mainService.userLoginCheck(user_id, user_password); // 컨트롤러 서비스 dao
		if (user == null) {
			return "redirect:/main/login?idpass=true";
		}
		session.setAttribute("user", user);
		return "redirect:/main";
	}
	//고객아이디 중복체크
	@RequestMapping(value = "/main/uIdChk")
	@ResponseBody
	public int uIdChk(String user_id) {
		return mainService.uIdChk(user_id);
	}
	//카페아이디 중복체크
	@RequestMapping(value = "/main/kIdChk")
	@ResponseBody
	public int kIdChk(String kc_id) {
		return mainService.kIdChk(kc_id);
	}


	// 로그아웃
	@RequestMapping(value = "/main/logout")
	String logoutPage(Model model, HttpSession session) {
		session.setAttribute("user", null);
		session.setAttribute("cafe", null);
		return "redirect:/main";
	}

	// 고객 회원가입
	@RequestMapping(value = "/main/joinUser", method = RequestMethod.GET)
	public String UserInsertGet() {
		return "main/joinUser";
	}

	@RequestMapping(value = "/main/joinUser", method = RequestMethod.POST)
	public String UserInsertPost(UserVO vo, String user_new_address2, String user_new_address3) {
		vo.setUser_new_address(vo.getUser_new_address() + " " + user_new_address2 + " " +user_new_address3);
		mainService.insertUser(vo);
		return "redirect:/main/login?join=true";
	}

	// 카페 회원가입
	@RequestMapping(value = "/main/joinKidscafe", method = RequestMethod.GET)
	public String KidscafeInsertGet() {
		return "main/joinKidscafe";
	}

	@RequestMapping(value = "/main/joinKidscafe", method = RequestMethod.POST)
	public String KidscafeInsertPost(HttpServletRequest request, CafeVO vo, MultipartFile file,String kc_new_address2, String kc_new_address3)
			throws IllegalStateException, IOException {
		String fileUrl = "uploadfiles";
		fileUrl = request.getServletContext().getRealPath(fileUrl); // c:\aa\bb\cc.png
		String uploadFileName = new Date().getTime() + ".jpg"; 
		File destinationFile = new File(fileUrl, uploadFileName); // uploadfiles\cc.png
		file.transferTo(destinationFile); // upload
		vo.setKc_photo(uploadFileName); // upload된 경로를 vo에 setting
		vo.setKc_new_address(vo.getKc_new_address() + " " + kc_new_address2 +" " + kc_new_address3);
		mainService.insertCafe(vo);

		return "redirect:/main/login?join=true";
	}
	
}
