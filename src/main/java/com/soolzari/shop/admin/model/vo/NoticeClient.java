package com.soolzari.shop.admin.model.vo;

import lombok.Data;

@Data
public class NoticeClient {
	private int noticeNo;
	private String noticeTitle;
	private int prevNo;
	private String prevTitle;
	private int nextNo;
	private String nextTitle;
}
