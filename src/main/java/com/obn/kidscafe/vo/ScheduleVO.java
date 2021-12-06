package com.obn.kidscafe.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleVO {
	private String s_id;
	private String s_time;
	private int s_wticket;
	private int s_hticket;
	
	private String kc_id;

	
}
