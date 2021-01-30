package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class Class {
	private int classNo;
	private String className;
	private int selNo;
	private String classDetail;
	private String classDetailBr;
	private int classPrice;
	private String classEnroll;//클래스 하는 날짜
	private String classStartTime;
	private int status;//0이 승인중, 1이 승인, 2가 반려
	private int classPerson;
	private String classDate;//클래스 승인 신청 날짜
	private int classNow;
}

