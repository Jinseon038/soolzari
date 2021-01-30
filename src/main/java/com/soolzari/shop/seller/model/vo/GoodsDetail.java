package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class GoodsDetail {
	private int gdsNo;
	private String gdsName;
	private int gdsPri;
	private int gdsBcnt;
	private int selNo;
	private int status;
	private String goodsDate;
	private String goodsType;
	public String filepath1;
	public String filename1;
	public String imgType1;
	public int typeNo1;
	public String filepath2;
	public String filename2;
	public String imgType2;
	public int typeNo2;
	public double avgRevScore;
	public double countRevScore;
}
