package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class FundingDetail {
	private int fundNo;
	private String fundName;
	private int fundMoney;
	private int fundChk;
	private String fundDet;
	private int status;
	private String fundEnrollDate;
	private String fundEndDate;
	public String filepath1;
	public String filename1;
	public String imgType1;
	public int typeNo1;
	public String filepath2;
	public String filename2;
	public String imgType2;
	public int typeNo2;
	public int selNo;
	public double fundPercent;
	public int fundTotal;
}
