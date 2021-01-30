package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

public class QnaPageData {
	private ArrayList<Qna> list;
	private String pageNavi;
	
	public QnaPageData(ArrayList<Qna> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public QnaPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Qna> getList() {
		return list;
	}

	public void setList(ArrayList<Qna> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
