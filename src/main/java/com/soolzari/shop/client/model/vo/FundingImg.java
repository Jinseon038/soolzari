package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class FundingImg {
	private int fundNo;
	private String fundName;
	private int fundMoney;
	private int fundChk;
	private String fundDet;
	private int status;
	private String fundDate;
	private int selNo;
	private String fundEnrolldate;
	private String fundEnddate;
	private int fundTotalMoney;
	private String imgType;//g면 기본이미지, gd면 상세이미지 정렬해서 가져오려고
	private String filepath;//img_db에 있는 이미지파일
	private String filename;//img_db에 있는 이미지파일
}
