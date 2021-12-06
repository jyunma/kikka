package com.obn.kidscafe.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserVO {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_postal_code;
	private String user_new_address;
	private String user_phone;
	private int user_rv_count;
	
	private String user_level;
	
}
