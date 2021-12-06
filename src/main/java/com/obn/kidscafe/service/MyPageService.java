package com.obn.kidscafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obn.kidscafe.dao.MyPageDAO;
import com.obn.kidscafe.vo.CafeRvChkVO;
import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.ReserveChkVO;
import com.obn.kidscafe.vo.ReserveVO;
import com.obn.kidscafe.vo.ReviewVO;
import com.obn.kidscafe.vo.UserRsvVO;
import com.obn.kidscafe.vo.UserVO;

@Service
public class MyPageService {
	@Autowired
	MyPageDAO myPageDao;
	
	//cafe
	public int updateCafe(CafeVO kidscafe) {
		return myPageDao.updateCafe(kidscafe);
	}
	public List<ReserveVO> kidscafeRsv(String kc_id) {
		return myPageDao.kidscafeRsv(kc_id);
	}
	public List<ReserveChkVO> kidscafeRsvByDate(String kc_id, String rsv_time) {
		Map<String, String> cafeRsvList = new HashMap<>();
		cafeRsvList.put("kc_id", kc_id);
		cafeRsvList.put("rsv_time", rsv_time);
		return myPageDao.kidscafeRsvByDate(cafeRsvList);
	}
	
	//user
	public List<UserRsvVO> RsvByUserId(String user_id) {
		return myPageDao.RsvByUserId(user_id);
	}
	
	public List<UserRsvVO> LastRsvByUserId(String user_id) {
		return myPageDao.LastRsvByUserId(user_id);
	}
	
	public int updateUser(UserVO user) {
		return myPageDao.updateUser(user);
	}
	
	public int cancelRsv(String rsv_id) {
		return myPageDao.cancelRsv(rsv_id);
	}
	
	public int afterRsv(String rsv_id) {
		return myPageDao.afterRsv(rsv_id);
	}
	
	//review
	public ReviewVO selectReviewByRsvId(String rsv_id) {
		return myPageDao.selectByReviewByRsvId(rsv_id);
	}
	public int insertReview(ReviewVO rv) {
		return myPageDao.insertReview(rv);
	}
	public int insertReviewWithoutPhoto(ReviewVO rv) {
		return myPageDao.insertReviewWithoutPhoto(rv);
	}
	public int updateReviewComment(ReviewVO rv) {
		return myPageDao.updateReviewComment(rv);
	}
	
	public List<CafeRvChkVO> selectCafeRvList(String kc_id) {
		return myPageDao.selectCafeRvList(kc_id);
	}
	public int updateUserByRv(UserVO user) {
		return myPageDao.updateUserByRv(user);
	}
}
