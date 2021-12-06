package com.obn.kidscafe.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReserveChkVO {
	private String rsv_id;
	private String rsv_comment;
	private String user_name;
	private String s_time;
	private int count;
	private int rsv_state;
}
