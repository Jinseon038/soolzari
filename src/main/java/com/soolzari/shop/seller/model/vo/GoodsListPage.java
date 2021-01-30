package com.soolzari.shop.seller.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class GoodsListPage {
	private ArrayList<GoodsList> gdsList;
	private String gdsPage;
}
