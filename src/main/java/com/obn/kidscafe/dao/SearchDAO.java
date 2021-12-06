package com.obn.kidscafe.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.obn.kidscafe.vo.CafeVO;
import com.obn.kidscafe.vo.OrderVO;
import com.obn.kidscafe.vo.ReserveVO;
import com.obn.kidscafe.vo.ReviewVO;
import com.obn.kidscafe.vo.ScheduleVO;
import com.obn.kidscafe.vo.SearchVO;
import com.obn.kidscafe.vo.TcChkVO;
import com.obn.kidscafe.vo.TicketVO;


@Repository
@Mapper
public interface SearchDAO {
	//list
	public List<CafeVO> searchList1(SearchVO search);
	//해당 지역, 해당 날짜에 예약이 하나라도 있는 카페
	public List<CafeVO> searchList2(SearchVO search);
	//해당 지역, 해당 날짜에 예약이 하나도 없는 카페
	
	
	//info
	public CafeVO selectByCafeId(String kc_id);
	public List<ReviewVO> selectCafeAll(String kc_id);
	public List<ScheduleVO> selectByKcId(String kc_id);
	public List<TicketVO> selectByKCafeId(String kc_id);
	public TcChkVO selectTcChk( Map<String, String> param);
	
	//reserve
	public int insertRsv(ReserveVO rsv);
	public int insertOrder(OrderVO order);
	public ScheduleVO selectBySId(String s_id);

	
	
}
