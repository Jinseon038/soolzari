package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class Goods {
	public int goodsNo;
	public String goodsName;
	public int goodsPrice;
	public int goodsCount;
	public int sellerNo;
	public String imagePath;
	public String searchWord;
	public double reviewScore;
	public int reviewCount;
}
