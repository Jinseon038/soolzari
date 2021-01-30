package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReviewPageData {
	private ArrayList<FundReview> rList;
	private String pageNavi;
	
	public ReviewPageData(ArrayList<FundReview> rList, String pageNavi) {
		super();
		this.rList = rList;
		this.pageNavi = pageNavi;
	}
}
