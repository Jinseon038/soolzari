package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FundingPageData {
	private ArrayList<FundingListData> list;
	private String pageNavi;
	
	public FundingPageData(ArrayList<FundingListData> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
}
