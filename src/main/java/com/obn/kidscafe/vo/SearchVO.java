package com.obn.kidscafe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchVO {
	private String date;
	private String location;
	private int count;
	private String max;
	
	
}
