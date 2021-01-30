package com.soolzari.shop.admin.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class NoticePage {
	private ArrayList<Notice> list;
	private String page;
}
