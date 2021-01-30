package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BasketDel {
	private ArrayList<Integer> gdsNoList;
	private int cliNo;
	
	public BasketDel(ArrayList<Integer> gdsNoList, int cliNo) {
		super();
		this.gdsNoList = gdsNoList;
		this.cliNo = cliNo;
	}
}
