package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class FundDetail {
	private ArrayList<FundingImg> fund;
	private ArrayList<FundingGoods> fundGoodsList;

	public FundDetail(ArrayList<FundingImg> fund, ArrayList<FundingGoods> fundGoodsList) {
		super();
		this.fund = fund;
		this.fundGoodsList = fundGoodsList;
	}
}
