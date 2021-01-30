package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class ClassList {
	private int clsLNo;
	private int clsCliNo;//예약한사용자번호
	private int clsClassNo;//예약한클래스번호
	private int classPerson;//예약한 인원수
	private int classCheck;//예약 :0 / 예약취소:0
}
