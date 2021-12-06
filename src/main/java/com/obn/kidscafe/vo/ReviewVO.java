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
public class ReviewVO {
	private String rsv_id;
	
	private String rv_content;
	private Timestamp rv_create_time;
	private String rv_comment;
	private Timestamp rv_comment_create_time;
	private int rv_state;
	private String rv_photo;
	
	private String kc_id;

	public ReviewVO(String rsv_id, String rv_content, Timestamp rv_create_time, int rv_state, String rv_photo,
			String kc_id) {
		super();
		this.rsv_id = rsv_id;
		this.rv_content = rv_content;
		this.rv_create_time = rv_create_time;
		this.rv_state = rv_state;
		this.rv_photo = rv_photo;
		this.kc_id = kc_id;
	}
	public ReviewVO(String rsv_id, String rv_content, Timestamp rv_create_time, int rv_state, String kc_id) {
		super();
		this.rsv_id = rsv_id;
		this.rv_content = rv_content;
		this.rv_create_time = rv_create_time;
		this.rv_state = rv_state;
		this.kc_id = kc_id;
	}
	
}
