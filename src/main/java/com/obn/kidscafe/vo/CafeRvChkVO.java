package com.obn.kidscafe.vo;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CafeRvChkVO {
	private String rsv_id;
	
	private String rv_content;
	private Timestamp rv_create_time;
	private String rv_comment;
	private Timestamp rv_comment_create_time;
	private int rv_state;
	private String rv_photo;
	
	private String kc_id;
	private String user_name;
	private String rsv_time;
	private String s_time;
	private String rsv_comment;
	private int count;
	
}
