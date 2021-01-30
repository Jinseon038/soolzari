package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class Funding {
	private int fundNo;
	private String fundName;
	private int fundMoney;
	private int fundChk;//펀딩 성공 여부
	private String fundDet;
	private String cliId;
	private int status;
	private String fundDate;//펀딩 승인날짜 sysdate
	private String fundEnrollDate;//펀딩  시작날짜
	private String fundEndDate;//펀딩 종료일
	private int selNo;
}
