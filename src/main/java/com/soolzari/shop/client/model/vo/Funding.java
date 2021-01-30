package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class Funding {
	private int fundNo;
	private String fundName;
	private int fundMoney;//목표금액
	private int fundChk;
	private String fundDet;
	private int status;
	private String fundDate;
	private int selNo;
	private String fundEnrolldate;
	private String fundEnddate;
	private int fundTotalMoney;
}
