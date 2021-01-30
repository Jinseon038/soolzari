package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class OrderPageData {
	private ArrayList<Purchase> pList;
	private ArrayList<OrderListData> olDataList;
	private String pageNavi;
	
	public OrderPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderPageData(ArrayList<Purchase> pList, ArrayList<OrderListData> olDataList, String pageNavi) {
		super();
		this.pList = pList;
		this.olDataList = olDataList;
		this.pageNavi = pageNavi;
	}



	
}
