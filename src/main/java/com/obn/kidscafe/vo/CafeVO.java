package com.obn.kidscafe.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CafeVO {
	private String kc_id;
	private String kc_password;
	private String kc_name;
	private String kc_new_address;
	private String kc_postal_code;
	private String kc_phone;
	private String kc_license_num;
	private int kc_wmax;
	private int kc_hmax;
	private String kc_business_hours;
	private String kc_holiday;
	private String kc_photo;	
	private String kc_introduction;
		
}
