package com.soolzari.shop.admin.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class UserPage {
	private ArrayList<User> list;
	private String page;
}
