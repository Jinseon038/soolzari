package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class GoodsSellerDetail {
	private int gdsNo;
	private String gdsName;
	private int gdsPri;
	private int gdsBcnt;
	private String goodsDate;
	private int selNo;
	private String selName;
	private String selTel;
	private String selAddr;
	private String imgType;//g면 기본이미지, gd면 상세이미지 정렬해서 가져오려고
	private String filepath;//img_db에 있는 이미지파일
	private String filename;//img_db에 있는 이미지파일
}
