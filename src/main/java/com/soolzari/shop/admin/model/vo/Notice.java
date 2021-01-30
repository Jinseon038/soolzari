package com.soolzari.shop.admin.model.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String noticeEnroll;
	private int noticeCount;
}
