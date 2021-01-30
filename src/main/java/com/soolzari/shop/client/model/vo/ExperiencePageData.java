package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ExperiencePageData {
	private ArrayList<ExperienceListData> eList;
	private String pageNavi;
	
	public ExperiencePageData(ArrayList<ExperienceListData> eList, String pageNavi) {
		super();
		this.eList = eList;
		this.pageNavi = pageNavi;
	}
}
