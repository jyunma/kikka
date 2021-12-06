package com.obn.kidscafe.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderVO {
	private String rsv_id;
	private String tc_id;
	
	private int count;
	
}
