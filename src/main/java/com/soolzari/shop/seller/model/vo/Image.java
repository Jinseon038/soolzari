package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class Image {
	private int imgNo;
	public String filepath;
	public String filename;
	public String imgType;
	public int typeNo;
}
