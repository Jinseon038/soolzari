package com.soolzari.shop.client.model.vo;

import lombok.Data;

@Data
public class FundDetailDB {
	private int fndDNo;
	private int fundNo;
	private int fndDCli;
	private int fndDPrice;
	private int fndGNo;
	private int fndDStatus;//0:예약
	private String fndDPaydate;//결제일
	private String fndDReserdate;//예약일
	private int fndDTotalp;//포인트사용후 총결제금액
	private String fndDCliaddr;//배송지
}
