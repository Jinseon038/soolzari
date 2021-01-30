package com.soolzari.shop.seller.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class GoodsPage {
	private ArrayList<Goods> list;
	private String page;
}
