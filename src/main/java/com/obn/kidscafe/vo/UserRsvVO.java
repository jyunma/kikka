package com.obn.kidscafe.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRsvVO {
	private String rsv_id;
	private int rsv_state;
	private Date rsv_time;
	private String user_id;
	private String kc_id;
	private String rv_content;
	private String kc_name;
	
	
}
