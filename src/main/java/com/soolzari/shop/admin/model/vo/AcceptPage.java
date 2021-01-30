package com.soolzari.shop.admin.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class AcceptPage {
	private ArrayList<Accept> list;
	private String page;
}
