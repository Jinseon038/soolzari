package com.soolzari.shop.seller.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FundingPage{
	private ArrayList<Funding> list;
	private String page;
}