package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class Class_List {
	
	public int classListNo;
	public int clientNo;
	public int classNo;
	public int classPerson;
	public int classCheck; //클래스 취소 신청 여부 0이 기본 
	public String classPayment;   //결제일

}
