package com.soolzari.shop.admin.model.vo;

import lombok.Data;

@Data
public class User {
	private int userNo;
	private String userId;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userAddr;
	private String userEnroll;
	private int status;
}
