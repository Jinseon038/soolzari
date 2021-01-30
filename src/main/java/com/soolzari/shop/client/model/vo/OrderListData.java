package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class OrderListData {
	private int purNo;
	private int gdsLNo;
	private int gdsNo;
	private String gdsName;
	private int gdsLPrice;
	private int gdsLCnt;
	private int gdsDStatus;
}
