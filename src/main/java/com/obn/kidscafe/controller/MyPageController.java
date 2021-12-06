package com.obn.kidscafe.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.obn.kidscafe.service.MainService;
import com.obn.kidscafe.service.MyPageService;
import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.ReviewVO;
import com.obn.kidscafe.vo.UserVO;

@Controller
public class MyPageController {
	@Autowired
	MyPageService myPageService;
	@Autowired
	MainService mainService;
	//cafe
	@RequestMapping("/main/myPage/kidscafe")
	public String kidscafePage(Model model,HttpSession session, @RequestParam(required = false)String fail) {
		CafeVO kidscafe=(CafeVO)session.getAttribute("cafe");
		if(kidscafe==null) {
			return "redirect:/main/login";
		}
		String kc_id = kidscafe.getKc_id();
		model.addAttribute("kidscafe", kidscafe);
		model.addAttribute("cafeLastRsvList", myPageService.kidscafeRsv(kc_id));
		model.addAttribute("cafeRvList", myPageService.selectCafeRvList(kc_id));
		if(fail != null)	model.addAttribute("fail",fail);
		return "main/myPage/kidscafePage";
	}
	
	@RequestMapping(value = "/main/myPage/kidscafe/update/loginChk", method = RequestMethod.POST)
	public String kidscafeUpdateChk( HttpSession session, String password) {
		CafeVO kidscafe=(CafeVO)session.getAttribute("cafe");
		if(kidscafe==null) {
			return "redirect:/main/login";
		}
		String kc_id = kidscafe.getKc_id();
		CafeVO cafe = mainService.cafeLoginCheck(kc_id, password);
		if(cafe != null) {
			return "redirect:/main/myPage/kidscafe/update";
		}else {
			return "redirect:/main/myPage/kidscafe?fail=true";
		}
		
	}
	
	@RequestMapping("/main/myPage/kidscafe/update")
	public String kidscafeUpdatePageGet(Model model, HttpSession session) {
		CafeVO kidscafe=(CafeVO)session.getAttribute("cafe");
		if(kidscafe==null) {
			return "redirect:/main/login";
		}
		model.addAttribute("kidscafe", kidscafe);
		return "main/myPage/kidscafeUpdatePage";
	}
	
	@RequestMapping(value = "/main/myPage/kidscafe/update", method = RequestMethod.POST)
	public String kidscafeUpdatePagePost(HttpServletRequest request, MultipartFile file, CafeVO kidscafe, HttpSession session) 
			throws IllegalStateException, IOException{
		
		String fileUrl = "uploadfiles";
		fileUrl = request.getServletContext().getRealPath(fileUrl); // c:\aa\bb\cc.png
		String uploadFileName = new Date().getTime() + ".jpg"; 
		File destinationFile = new File(fileUrl, uploadFileName); //uploadfiles\cc.png
		file.transferTo(destinationFile); //upload
		kidscafe.setKc_photo(uploadFileName); //upload된 경로를 vo에 setting
		
		CafeVO oldCafe = (CafeVO)session.getAttribute("cafe");
		oldCafe.setKc_name(kidscafe.getKc_name());
		oldCafe.setKc_phone(kidscafe.getKc_phone());
		oldCafe.setKc_business_hours(kidscafe.getKc_business_hours());
		oldCafe.setKc_introduction(kidscafe.getKc_introduction());
		oldCafe.setKc_photo(kidscafe.getKc_photo());
		myPageService.updateCafe(oldCafe);
		session.setAttribute("cafe", oldCafe);
		
		return "redirect:/main/myPage/kidscafe";
	}
	
	
	@RequestMapping("/main/myPage/kidscafe/RsvByDate")
	public String RsvByDate(Model model,HttpSession session, String rsv_time) {
		CafeVO kidscafe=(CafeVO)session.getAttribute("cafe");
		if(kidscafe==null) {
			return "redirect:/main/login";
		}
		String kc_id = kidscafe.getKc_id();
		//자바 string(yyyy-mm-dd)->mariaDB  date_format(rsv_time,'%Y-%m-%d')
		model.addAttribute("cafeRsvList", myPageService.kidscafeRsvByDate(kc_id, rsv_time));
		return "main/myPage/kidscafeRSVCheckPage";
	}
	
	//user
	@RequestMapping("/main/myPage/user")
	public String userPage(Model model, @RequestParam(required = false)String fail, HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null) {
			return "redirect:/main/login";
		}
		String user_id = user.getUser_id();
		model.addAttribute("user",user);
		model.addAttribute("userRsvList",myPageService.RsvByUserId(user_id));
		model.addAttribute("userLastRsvList",myPageService.LastRsvByUserId(user_id));
		if(fail != null)	model.addAttribute("fail",fail);
		return "main/myPage/userPage";
	}
	
	@RequestMapping(value = "/main/myPage/user/cancel", method = RequestMethod.GET )
	public String cancelRsv(String rsv_id, HttpSession session) {
		if(session.getAttribute("user")==null) {
			return "redirect:/main/login";
		}
		myPageService.cancelRsv(rsv_id);
		return "redirect:/main/myPage/user";
	}
	
	@RequestMapping(value = "/main/myPage/user/after", method = RequestMethod.GET )
	public String afterRsv(String rsv_id, HttpSession session) {
		if(session.getAttribute("user")==null) {
			return "redirect:/main/login";
		}
		myPageService.afterRsv(rsv_id);
		return "redirect:/main/myPage/user";
	}
	
	@RequestMapping(value = "/main/myPage/user/beforRv", method = RequestMethod.GET )
	public String beforeRv(String rsv_id,HttpSession session, String kc_id) {
		UserVO user = (UserVO)session.getAttribute("user");
		if(user==null) {
			return "redirect:/main/login";
		}
		ReviewVO review = myPageService.selectReviewByRsvId(rsv_id);
		
		if(review != null) {
			return "redirect:/main/myPage/user";
		}
		return "redirect:/main/myPage/user/review?rsv_id="+rsv_id+"&kc_id="+kc_id;
	}
	
	
	@RequestMapping(value = "/main/myPage/user/update/loginChk", method = RequestMethod.POST)
	public String userUpdateChk(HttpSession session, String password) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null) {
			return "redirect:/main/login";
		}
		String user_id = user.getUser_id();
		user = mainService.userLoginCheck(user_id, password);
		if(user != null) {
			return "redirect:/main/myPage/user/update";
		}else {
			return "redirect:/main/myPage/user?fail=true";
		}
		
	}
	
	@RequestMapping("/main/myPage/user/update")
	public String userUpdatePageGet(Model model, HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		model.addAttribute("user",user);
		return "main/myPage/userUpdatePage";
	}
	
	@RequestMapping(value = "/main/myPage/user/update", method = RequestMethod.POST)
	public String userUpdatePagePost(UserVO user, String user_new_address2, String user_new_address3, HttpSession session) {
		UserVO oldUser = (UserVO)session.getAttribute("user");
		user.setUser_new_address(user.getUser_new_address() + " " +user_new_address2+user_new_address3);
		user.setUser_level(oldUser.getUser_level());
		user.setUser_name(oldUser.getUser_name());
		user.setUser_rv_count(oldUser.getUser_rv_count());
		user.setUser_password(oldUser.getUser_password());
		myPageService.updateUser(user);
		session.setAttribute("user", user);
		return  "redirect:/main/myPage/user";
	}
	
	

	
	//review
		@RequestMapping(value= "/main/myPage/user/review", method = RequestMethod.POST)
		public String insertReviewPost(HttpServletRequest request, HttpSession session, @RequestParam(required = false)MultipartFile file, Model model, @RequestParam String rsv_id, @RequestParam String kc_id, @RequestParam String rv_content, @RequestParam int rv_state)throws IllegalStateException, IOException {
			Timestamp rv_create_time = Timestamp.valueOf(LocalDateTime.now());
			ReviewVO rv;
			
			if(file!=null) {
				//String sourceFileName = file.getOriginalFilename();
				String fileUrl = "uploadfiles";
				fileUrl = request.getServletContext().getRealPath(fileUrl); //c:\aa\bb\cc.png
				String uploadFileName = new Date().getTime() + ".jpg"; //sourceFileName.substring(sourceFileName.lastIndexOf("\\") + 1);
				File destinationFile = new File(fileUrl, uploadFileName); //uploadfiles\cc.png
				file.transferTo(destinationFile); //upload
				rv = new ReviewVO(rsv_id, rv_content, rv_create_time, rv_state, kc_id);
				rv.setRv_photo(uploadFileName); //upload된 경로를 vo에 setting
				myPageService.insertReview(rv);
			}else {
				rv = new ReviewVO(rsv_id, rv_content, rv_create_time, rv_state,  kc_id);
				myPageService.insertReviewWithoutPhoto(rv);
			}
			UserVO user = (UserVO)session.getAttribute("user");
			int userRvCount=user.getUser_rv_count() + 1;
			user.setUser_rv_count(userRvCount);
			System.out.println(userRvCount);
			userRvCount = user.getUser_rv_count();
			System.out.println(userRvCount);
			if(userRvCount >= 30) {
				user.setUser_level("케이크");
			}else if(userRvCount>=15) {
				user.setUser_level("쿠키");
			}else if(userRvCount>=3) {
				user.setUser_level("푸딩");
			}
			myPageService.updateUserByRv(user);
			session.setAttribute("user", user);
			return "redirect:/main/myPage/user";
		}
	
	
	@RequestMapping(value = "/main/myPage/kidscafe/reviewComment", method = RequestMethod.POST)
	public String insertReviewCommentPost(@RequestParam String rsv_id, @RequestParam String rv_comment) {
		Timestamp rv_comment_create_time = Timestamp.valueOf(LocalDateTime.now());
		ReviewVO rv = myPageService.selectReviewByRsvId(rsv_id);
		rv.setRv_comment_create_time(rv_comment_create_time);
		rv.setRv_comment(rv_comment);
		myPageService.updateReviewComment(rv);
		return "redirect:/main/myPage/kidscafe";
	}
	
	
}
