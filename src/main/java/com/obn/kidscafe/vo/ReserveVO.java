package com.obn.kidscafe.vo;

import java.sql.Date;
import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReserveVO {
	private String rsv_id;
	private String rsv_comment;
	private int rsv_state;
	private Date rsv_time;
	private Timestamp rsv_create_time;
	
	private String user_id;
	private String s_id;
	private String kc_id;
	
}
