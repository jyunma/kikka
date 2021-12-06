package com.obn.kidscafe.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.UserVO;

@Repository
@Mapper
public interface MainDAO {
	public int insertCafe(CafeVO vo) ;
	public CafeVO selectCafeLogin( Map<String, String> id_pass);
	public String[] selectGuAll();
	
	public int insertUser(UserVO vo) ;
	public UserVO selectUserLogin(Map<String, String> id_pass);
	//아이디 중복체크 
	public int uIdChk (String user_id);	
	public int kIdChk (String kc_id);
}
