package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class FundReview {
	private int reviewNo;
	private int goodNo;
	private int fundNo;
	private String commentContent;
	private int commentRate;
	private String reviewDate;
	private int commentWriter;
	private String commentWriterName;
}
