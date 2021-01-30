package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class Reservation {
	private int classNo;
	private String className;
	private String classCreator;
	private String classDescription;
	private int classPrice;
	private int classPerson;
	private String classDate;
	private String classStartTime;
	
}
