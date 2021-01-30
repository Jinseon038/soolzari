package com.soolzari.shop.seller.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FundingListPage {
	private ArrayList<FundingList> fndList;
	private String fndPage;
}
