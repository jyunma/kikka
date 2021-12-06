package com.obn.kidscafe.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.obn.kidscafe.vo.CafeRvChkVO;
import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.ReserveChkVO;
import com.obn.kidscafe.vo.ReserveVO;
import com.obn.kidscafe.vo.ReviewVO;
import com.obn.kidscafe.vo.UserRsvVO;
import com.obn.kidscafe.vo.UserVO;

@Repository
@Mapper
public interface MyPageDAO {
	//cafe
	public int updateCafe(CafeVO kidscafe) ;
	public List<ReserveVO> kidscafeRsv(String kc_id);
	public List<ReserveChkVO> kidscafeRsvByDate(Map<String, String> cafeRsvList);
	//user
	public List<UserRsvVO> RsvByUserId(String user_id);
	public List<UserRsvVO> LastRsvByUserId(String user_id);
	public int updateUser(UserVO user) ;
	public int cancelRsv(String rsv_id);
	public int afterRsv(String rsv_id);
	
	//review
	public ReviewVO selectByReviewByRsvId(String rsv_id);
	public int insertReview(ReviewVO rv);
	public int insertReviewWithoutPhoto(ReviewVO rv);
	public int updateReviewComment(ReviewVO rv);
	public List<CafeRvChkVO> selectCafeRvList(String kc_id);
	public int updateUserByRv(UserVO user);
}
