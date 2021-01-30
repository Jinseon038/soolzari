package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class Goods {
	private int gdsNo;
	private String gdsName;
	private int gdsPri;
	private int gdsBcnt;
	private int selNo;
	private int status;
	private String goodsDate;
	private String goodsType;
}
