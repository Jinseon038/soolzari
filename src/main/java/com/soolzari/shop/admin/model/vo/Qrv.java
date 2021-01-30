package com.soolzari.shop.admin.model.vo;

import lombok.Data;

@Data
public class Qrv {
	private int qrvNo;//답변 번호
	private int qnaNo;
	private String qrvWriter;
	private String qrvContent;
	private String qrvEnroll;
}
