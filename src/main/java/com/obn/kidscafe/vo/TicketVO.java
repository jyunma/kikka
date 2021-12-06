package com.obn.kidscafe.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TicketVO {
	private String tc_id;
	private String tc_name;
	private String tc_price;
	private String tc_comment;
	private int tc_adult;
	private int tc_weekend;
	
	private String kc_id;
	
}
