package com.obn.kidscafe.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.obn.kidscafe.dao.SearchDAO;
import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.OrderVO;
import com.obn.kidscafe.vo.ReserveVO;
import com.obn.kidscafe.vo.ReviewVO;
import com.obn.kidscafe.vo.ScheduleVO;
import com.obn.kidscafe.vo.SearchVO;
import com.obn.kidscafe.vo.TcChkVO;
import com.obn.kidscafe.vo.TicketVO;

@Service
public class SearchService {
	@Autowired
	SearchDAO searchDao;

	//list
	public JSONArray searchList(String date, String location, int count) {
		//date 값에 따라 주말, 평일 구해서 맥스에 적용. 2020-12-01
		Calendar date1 = Calendar.getInstance();
		date1.set(Integer.parseInt(date.substring(0, 4)),Integer.parseInt(date.substring(5, 7))-1,Integer.parseInt(date.substring(8)));
		String max = "kc.kc_wmax";
		int dayOfWeek=date1.get(Calendar.DAY_OF_WEEK);
		if(dayOfWeek == 1 || dayOfWeek == 7) {
			max = "kc.kc_hmax";
		}
		SearchVO search = new SearchVO();
		search.setCount(count);
		search.setDate(date);
		search.setLocation("%"+location+"%");
		search.setMax(max);
		List<CafeVO> cafeList1 = new ArrayList<CafeVO>();
		List<CafeVO> cafeList2 = new ArrayList<CafeVO>();
		cafeList1.addAll(searchDao.searchList1(search));
		cafeList2.addAll(searchDao.searchList2(search));
		cafeList1.addAll(cafeList2);
		HashSet<CafeVO> cafeListSet = new HashSet<CafeVO>(cafeList1);
		List<CafeVO> cafeList = new ArrayList<CafeVO>(cafeListSet);
		JSONArray jsonArr = new JSONArray();
		int i = 0;
		for (CafeVO cafe : cafeList) {
			try {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("kc_id", cafe.getKc_id());
				jsonObj.put("kc_password", cafe.getKc_password());
				jsonObj.put("kc_name", cafe.getKc_name());
				jsonObj.put("kc_new_address", cafe.getKc_new_address());
				jsonObj.put("kc_postal_code", cafe.getKc_postal_code());
				jsonObj.put("kc_phone", cafe.getKc_phone());
				jsonObj.put("kc_license_num", cafe.getKc_license_num());
				jsonObj.put("kc_wmax", cafe.getKc_wmax());
				jsonObj.put("kc_hmax", cafe.getKc_hmax());
				jsonObj.put("kc_business_hours", cafe.getKc_business_hours());
				jsonObj.put("kc_holiday", cafe.getKc_holiday());
				jsonObj.put("kc_photo", cafe.getKc_photo());
				jsonObj.put("kc_introduction", cafe.getKc_introduction());
				jsonObj.put("y", Geocording.geocording(cafe.getKc_new_address()).get("lat"));
				jsonObj.put("x", Geocording.geocording(cafe.getKc_new_address()).get("lng"));
				jsonObj.put("date", date);
				jsonArr.put(i, jsonObj);
				i++;
			} catch (UnsupportedEncodingException | ParseException | JSONException e) {
				e.printStackTrace();
			}
		}
		return jsonArr;
		
	}
	public List<CafeVO> searchListVO(String date, String location, int count) {
		//date 값에 따라 주말, 평일 구해서 맥스에 적용. 2020-12-01
		Calendar date1 = Calendar.getInstance();
		date1.set(Integer.parseInt(date.substring(0, 4)),Integer.parseInt(date.substring(5, 7))-1,Integer.parseInt(date.substring(8)));
		String max = "kc.kc_wmax";
		int dayOfWeek=date1.get(Calendar.DAY_OF_WEEK);
		if(dayOfWeek == 1 || dayOfWeek == 7) {
			max = "kc.kc_hmax";
		}
		SearchVO search = new SearchVO();
		search.setCount(count);
		search.setDate(date);
		search.setLocation("%"+location+"%");
		search.setMax(max);
		List<CafeVO> cafeList1 = new ArrayList<CafeVO>();
		List<CafeVO> cafeList2 = new ArrayList<CafeVO>();
		cafeList1.addAll(searchDao.searchList1(search));
		cafeList2.addAll(searchDao.searchList2(search));
		cafeList1.addAll(cafeList2);
		HashSet<CafeVO> cafeListSet = new HashSet<CafeVO>(cafeList1);
		List<CafeVO> cafeList = new ArrayList<CafeVO>(cafeListSet);
		return cafeList;
	}
	//info
	public CafeVO selectByCafeId(String kc_id) {
		return searchDao.selectByCafeId(kc_id);
	}
	
	public List<ReviewVO> selectCafeAll(String kc_id) {
		return searchDao.selectCafeAll(kc_id);
	}
	
	public List<TicketVO> selectByKCafeId(String kc_id) {
	      return searchDao.selectByKCafeId(kc_id);
	}
	public List<ScheduleVO> selectByKcId(String kc_id) {
		return searchDao.selectByKcId(kc_id);
	}
	
	public TcChkVO selectTcChk(String s_id, String date) {
		Map<String, String> param = new HashMap<>();
		param.put("s_id", s_id);
		param.put("date", date);
		return searchDao.selectTcChk(param);
	}
	
	//reserve
	public int insertRsv(ReserveVO rsv) {
		return searchDao.insertRsv(rsv);
	}
	public int insertOrder(OrderVO order) {
		return searchDao.insertOrder(order);
	}
	public ScheduleVO selectBySId(String s_id) {
		return searchDao.selectBySId(s_id);
	}
}
