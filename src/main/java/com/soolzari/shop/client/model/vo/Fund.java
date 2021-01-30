
package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class Fund {
	
	private int fundNo;
	private String fundName;
	private int fundMoney; //목표금액
	private int fundChk; //성공여부
	private String fundDet; //펀딩 설명
	private int status; //관리자 승인
	private String fundDate; //관리가한테 신청한 날짜
	private int selNo; //판매자번호
	private String fundEnrollDate; //등록날짜
	private String fundEndDate; //끝나는날짜
	private String imagePath;
	private int fundMoneyNow;  //펀딩후원액
	private int fundPrice;

}
