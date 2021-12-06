package com.obn.kidscafe.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obn.kidscafe.dao.MainDAO;
import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.UserVO;

@Service
public class MainService {
	@Autowired
	MainDAO mainDao;

	//cafe
	public int insertCafe(CafeVO vo) {
		return mainDao.insertCafe(vo);
	}
	public CafeVO cafeLoginCheck(String kc_id, String kc_password) {
		Map<String, String> id_pass = new HashMap<>();
		id_pass.put("kc_id", kc_id);
		id_pass.put("kc_password", kc_password);
		return mainDao.selectCafeLogin(id_pass);
	}
	public String[] selectGuAll() {
		return mainDao.selectGuAll();
	}
	
	//user
	public int insertUser(UserVO vo) {
		return mainDao.insertUser(vo);
	}
	public UserVO userLoginCheck(String user_id, String user_password) {
		Map<String, String> id_pass = new HashMap<>();
		id_pass.put("user_id", user_id);
		id_pass.put("user_password", user_password);
		return mainDao.selectUserLogin(id_pass);
	}
	//아이디 중복체크
	public int uIdChk(String user_id) {
		return mainDao.uIdChk(user_id);
	}
	
	public int kIdChk(String kc_id) {
		return mainDao.kIdChk(kc_id);
	}
	
}
