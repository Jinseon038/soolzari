package com.soolzari.shop.client.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.JsonObject;
import com.soolzari.shop.client.model.service.ClientService2;
import com.soolzari.shop.client.model.vo.Basket;
import com.soolzari.shop.client.model.vo.BasketList;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Client2;
import com.soolzari.shop.client.model.vo.ExperiencePageData;
import com.soolzari.shop.client.model.vo.FundDetail;
import com.soolzari.shop.client.model.vo.FundDetailDB;

import com.soolzari.shop.client.model.vo.FundReview;

import com.soolzari.shop.client.model.vo.FundingListData;
import com.soolzari.shop.client.model.vo.FundingPageData;

import com.soolzari.shop.client.model.vo.Goods2;
import com.soolzari.shop.client.model.vo.GoodsList;
import com.soolzari.shop.client.model.vo.GoodsSellerDetail;
import com.soolzari.shop.client.model.vo.OrderPageData;
import com.soolzari.shop.client.model.vo.Purchase;
import com.soolzari.shop.client.model.vo.Qna;
import com.soolzari.shop.client.model.vo.QnaPageData;
import com.soolzari.shop.client.model.vo.ReviewPageData;
import com.soolzari.shop.client.model.vo.Subscribe;

@Controller
@RequestMapping("/client")
public class ClientController2 {
	@Autowired
	private ClientService2 service;
	
	//임시로그인
	/*
	@RequestMapping("/login.sool")
	public String login(HttpSession session) {
		Client2 client = new Client2();
		client.setCliAddr("경기도");
		client.setCliAge("19960308");
		client.setCliEmail("aaa@naver.com");
		client.setCliEnroll("2020-01-07");
		client.setCliId("user01");
		client.setCliName("김진선");
		client.setCliNo(22);
		client.setCliPoint(3000);
		client.setCliPw("1234");
		client.setCliRank(0);
		client.setCliTel("010-1111-1111");
		session.setAttribute("sessionId", client.getCliId());
		session.setAttribute("sessionNo", client.getCliNo());
		session.setAttribute("sessionClient", client);
		return "redirect:/";
	}
	*/
	
	//장바구니 담기
	@RequestMapping("/basketInsert.sool")
	public String basketInsert(int gdsNo, int basCnt, String gdsRate, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient != null) {
			int result = service.basketInsert(sessionClient.getClientNo(),gdsNo,basCnt);
			if(result>0) {
				model.addAttribute("msg","장바구니에 담겼습니다");
				model.addAttribute("loc","/client/oGoodsDetail.sool?gdsNo="+gdsNo+"&gdsRate="+gdsRate);
			}else {
				model.addAttribute("msg","장바구니 오류");
				model.addAttribute("loc","/");
			}
			return "common/msg";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
		
	}
	
	//장바구니 리스트 상품정보(basket_db전체)
	@RequestMapping("/basketList.sool")
	public String basketList(Model model, HttpSession session, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient != null) {
			ArrayList<BasketList> list = service.basketAllSelect(sessionClient.getClientNo());
			model.addAttribute("list",list);
			return "client/oBasket";
		}else {
			model.addAttribute("msg","장바구니를 불러오는데 실패했습니다");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}
	
	//장바구니 플러스마이너스 버튼
	@ResponseBody
	@RequestMapping("/basketPlusMinusUpdate.sool")
	public String basketPlusMinusUpdate(int basNo, int chk, Model model) {
		int result = service.basketPlusMinusUpdate(basNo, chk);
		if(result>0 && chk==0) {
			return "0";
		}else if(result>0 && chk==1) {
			return "1";
		}else {
			model.addAttribute("msg","수량수정에 실패했습니다");
			return "common/msg";
		}
	}
	
	
	//장바구니 선택삭제버튼
	@RequestMapping("/basketDelete.sool")
	public String basketDelete(String basNoStr, Model model) {
		//basNoStr은 선택한 상품을 전부가져오기때문에 basNo을 ,를 기준으로 나눠진 String한문장으로 들어옴
		basNoStr = basNoStr.substring(0,basNoStr.length()-1);//맨뒤에 ,제외시킴
		
		StringTokenizer st = new StringTokenizer(basNoStr,",");
		ArrayList<Integer> basNoList = new ArrayList<Integer>();
		while(st.hasMoreTokens()) {//basNo을 다시 int타입으로 ArrayList에 저장
			basNoList.add(Integer.parseInt(st.nextToken()));
		}
		
		
		//int result = service.basketDelete(basNoList);
		int result = service.basketDelete(basNoList);
		
		if(result>0) {
			model.addAttribute("msg","선택하신 상품을 삭제하였습니다");
		}else {
			model.addAttribute("msg","선택하신 상품 삭제에 실패하였습니다");
		}
		model.addAttribute("loc","/client/basketList.sool");
		return "common/msg";
	}
	
	//주문/결제 페이지 이동
	@RequestMapping("/paymentShow.sool")
	public String paymentShow(String basNoStr, GoodsList goodsList, Model model, @SessionAttribute(required=false) Client sessionClient) {
		System.out.println(basNoStr);
		System.out.println(goodsList.getGdsLCnt());
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Client2 client = new Client2();
			client = service.paymentShow(sessionClient.getClientNo());
			if(client != null) {//client정보 전체 호출하고
				ArrayList<BasketList> list = new ArrayList<BasketList>();
				if(basNoStr!=null) {
					
					StringTokenizer st = new StringTokenizer(basNoStr,",");
					ArrayList<Integer> basNoList = new ArrayList<Integer>();
				
				
					while(st.hasMoreTokens()) {//gdsNo을 다시 int타입으로 ArrayList에 저장
						basNoList.add(Integer.parseInt(st.nextToken()));
					}
					list = service.paymentAllSelect(basNoList);//장바구니리스트 불러옴
					model.addAttribute("list",list);
					model.addAttribute("client",client);
					return "client/oPayment";
				}else {
					list = service.paymentAllSelect(goodsList);//장바구니리스트 불러옴
					model.addAttribute("list",list);
					model.addAttribute("client",client);
					return "client/oPayment";
				}
				
			}else {
				model.addAttribute("msg","사용자정보 로드에 실패했습니다");
				model.addAttribute("loc","/");
				return "common/msg";
			}
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//주문/결제 페이지 주소 수정
	@ResponseBody
	@RequestMapping("/ClientAddrUpdate.sool")
	public int clientAddrUpdate(Client2 client) {
		int result = service.clientAddrUpdate(client);
		if(result>0) {
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
		return result;
	}
	
	//결제완료페이지 이동
	@RequestMapping("/oComplete.sool")
	public String oCompleteShow(Model model, int totalPrice, Client2 client, String gdsNoStr, String gdsLCntStr, String purDate, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {
			System.out.println("controller");
			client.setCliNo(sessionClient.getClientNo());
			Purchase pur = new Purchase();	//purchase디비에 insert할 값3개
			pur.setPurTtp(totalPrice);
			pur.setPurGet(client.getCliAddr());
			pur.setCliNo(client.getCliNo());
			pur.setPurDate(purDate);
			System.out.println("purDate : "+purDate);
			int result = service.paymentInsert(client,gdsNoStr,gdsLCntStr,pur);//purchase디비에 insert, point감소처리, goods디비에 상품구매횟수 증가
			if(result>0) {
				client = service.paymentShow(client.getCliNo()); //client정보가져오기(주문완료페이지에 뿌려줄)
				sessionClient.setClientPoint(client.getCliPoint());
				model.addAttribute("client",client);//client정보
				model.addAttribute("pur",pur);//purchase정보
				return "client/oSuccess";
			}else {
				model.addAttribute("msg","결제완료페이지 요청에 실패했습니다");
				model.addAttribute("loc","/client/basketList.sool");
				return "common/msg";
			}
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	
	//마이페이지 - 내정보수정페이지 이동전에 비밀번호확인 페이지
	@RequestMapping("/mchkPw.sool")
	public String mchkPw(Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//일반회원일경우
			return "client/mchkPw";
		}else if(sessionClient!=null && sessionClient.getClientPw()=="sns") {//sns로 로그인한 회원일경우
			return "redirect:/client/mInfo.sool";
		}else {//로그인을 안한경우
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//마이페이지 - 내정보수정 페이지 이동 시 비밀번호 확인로직
	@RequestMapping("/mInfoCheckPw.sool")
	public String mInfoCheckPw(Model model, Client2 client) {
		Client2 c = service.checkPwMInfo(client);
		if(c!=null) {
			return "redirect:/client/mInfo.sool";
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다");
			model.addAttribute("loc","/client/mchkPw.sool");
			return "common/msg";
		}
	}
	 
	
	//마이페이지-내정보수정페이지 이동
	@RequestMapping("/mInfo.sool")
	public String mInfo(Model model, @SessionAttribute(required=false) Client sessionClient) {
		Client2 client = new Client2();
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			client = service.paymentShow(sessionClient.getClientNo());
			model.addAttribute("client",client);
			return "client/mInfo";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	
	//마이페이지-내정보수정하기Update
	@RequestMapping("/mInfoUpdate.sool")
	public String mInfoUpdate(Client2 client, Model model, HttpSession session) {
		System.out.println(client);
		int result = service.updateMInfo(client);
		if(result>0) {
			Client c = (Client) session.getAttribute("sessionClient");//세션에도 바꾸기
			c.setClientName(client.getCliName());
			session.setAttribute("sessionClient", c);
			model.addAttribute("msg","정보 수정이 완료되었습니다");
		}else {
			model.addAttribute("msg","정보 수정에 실패하였습니다");
		}
		model.addAttribute("loc","/client/mInfo.sool");
		return "common/msg";
	}
	
	//마이페이지-주문내역 이동
	@RequestMapping("/mOrderList.sool")
	public String mOrderList(int reqPage, int period, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Subscribe sub = service.subscribeSelect(sessionClient.getClientRank());//구독랭크 정보가져오기
			OrderPageData opd = service.mOrderListPaging(reqPage,period,sessionClient.getClientNo());
			model.addAttribute("pList",opd.getPList());
			model.addAttribute("olDataList",opd.getOlDataList());
			model.addAttribute("pageNavi",opd.getPageNavi());
			model.addAttribute("period",period);
			model.addAttribute("reqPage",reqPage);
			model.addAttribute("sub",sub);
			return "client/mOrderList";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//마이페이지 - 주문내역 배송관리(취소신청/수취확인)
	@RequestMapping("/orderDeliveryStatus.sool")
	public String orderDeliveryStatus(int purNo, int gdsLNo, int deliveryStatus, int reqPage, int period, Model model) {
		int result = 0;
		if(deliveryStatus==2) {//취소신청일 경우
			result = service.purCancelUpdate(purNo);//purchase_db에 pur_cancel을 0->1로 전환
			if(result>0) {
				result = service.orderDeliveryCancelStatus(purNo,deliveryStatus);
				if(result>0) {
					model.addAttribute("msg","취소신청이 완료되었습니다");
				}else {
					model.addAttribute("msg","취소신청에 실패하였습니다");
				}
			}else {
				model.addAttribute("msg","취소신청에 실패하였습니다");
			}
		}else {//수취확인일 경우
			result = service.orderDeliveryStatus(gdsLNo,deliveryStatus);
			if(result>0) {
				model.addAttribute("msg","수취확인이 완료되었습니다");
			}else {
				model.addAttribute("msg","수취확인에 실패하였습니다");
			}
		}
		model.addAttribute("loc","/client/mOrderList.sool?reqPage="+reqPage+"&period="+period);
		return "common/msg";
	}
	
	//마이페이지 - 클래스예약현황
	@RequestMapping("/mExperience.sool")
	public String mExperience(int reqPage, int period, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Subscribe sub = service.subscribeSelect(sessionClient.getClientRank());//구독랭크 정보가져오기
			ExperiencePageData epd = service.mExperiencePaging(reqPage,period,sessionClient.getClientNo());
			model.addAttribute("eList",epd.getEList());
			model.addAttribute("pageNavi",epd.getPageNavi());
			model.addAttribute("period",period);
			model.addAttribute("reqPage",reqPage);
			model.addAttribute("sub",sub);
			return "client/mExperience";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//마이페이지 - 클래스취소신청(class_list_db에 classCheck컬럼을 update -> 0:결제완료,1:취소신청중,2:취소완료)
	@RequestMapping("/classCancel.sool")
	public String classCancel(int clsLNo,int reqPage, int period, Model model) {
		int result = service.classCancel(clsLNo);
		if(result>0) {
			model.addAttribute("msg","취소신청이 완료되었습니다");
		}else {
			model.addAttribute("msg","취소신청에 실패하였습니다");
		}
		model.addAttribute("loc","/client/mExperience.sool?reqPage="+reqPage+"&period="+period);
		return "common/msg";
	}
	
	
	//마이페이지 - 문의하기 (문의글쓰기insert)
	@RequestMapping("/mQuestionInsert.sool")
	public String mQuestionInsert(Qna question, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			question.setQnaWriter(sessionClient.getClientNo());
			int result = service.questionInsert(question);
			if(result>0) {
				model.addAttribute("msg","문의사항 작성이 완료되었습니다");
			}else {
				model.addAttribute("msg","문의사항 작성에 실패하였습니다");
			}
			model.addAttribute("loc","/client/mQuestion.sool?reqPage=1&period=1");//마이페이지 - 문의사항페이지로 이동시켜줘야함
			return "common/msg";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//마이페이지 - 문의하기 페이지
	@RequestMapping("/mQuestion.sool")
	public String mQuestion (int reqPage, int period, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Subscribe sub = service.subscribeSelect(sessionClient.getClientRank());//구독랭크 정보가져오기
			QnaPageData qpd = service.mQuestionPaging(reqPage,period,sessionClient.getClientNo());
			model.addAttribute("list",qpd.getList());
			model.addAttribute("pageNavi",qpd.getPageNavi());
			model.addAttribute("period",period);
			model.addAttribute("reqPage",reqPage);
			model.addAttribute("sub",sub);
			return "client/mQuestion";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//상품상세페이지
	@RequestMapping("/oGoodsDetail.sool")
	public String oGoodsDetail (int gdsNo, Model model){
		ArrayList<GoodsSellerDetail> gsd = service.oGoodsDetail(gdsNo);
		if(gsd!=null) {//상품이 있을 경우
			model.addAttribute("gsd",gsd.get(0));//상품정보 전달(기본이미지를 포함하고있음)
			model.addAttribute("gsdGD",gsd.get(1));//상품정보 전달(상세이미지를 포함하고있음)
			ArrayList<FundReview> reviewList= service.reviewList1(gdsNo);
			model.addAttribute("reviewList",reviewList);
			
			model.addAttribute("goodNo",gdsNo);
			System.out.println(gdsNo);
			System.out.println(reviewList);
			return "client/oGoodsDetail";
		}else {
			model.addAttribute("msg","상품을 불러오는데 실패했습니다");
			model.addAttribute("loc","/");//상품리스트 경로수정
			return "common/msg";
		}
	}
	//상품상세페이지
	@RequestMapping("/oGoodsDetail1.sool")
	public String oGoodsDetail1 (int gdsNo, Model model){
		ArrayList<GoodsSellerDetail> gsd = service.oGoodsDetail(gdsNo);
		if(gsd!=null) {//상품이 있을 경우
			model.addAttribute("gsd",gsd.get(0));//상품정보 전달(기본이미지를 포함하고있음)
			model.addAttribute("gsdGD",gsd.get(1));//상품정보 전달(상세이미지를 포함하고있음)
			ArrayList<FundReview> reviewList= service.reviewList1(gdsNo);
			model.addAttribute("reviewList",reviewList);
			
			model.addAttribute("goodNo",gdsNo);
			System.out.println(gdsNo);
			System.out.println(reviewList);
			return "client/oGoodsDetail1";
		}else {
			model.addAttribute("msg","상품을 불러오는데 실패했습니다");
			model.addAttribute("loc","/");//상품리스트 경로수정
			return "common/msg";
		}
	}
	//펀딩상세페이지
	@RequestMapping("/oFundingDetail.sool")
	public String oFundingDetail (int fundNo, Model model){
		FundDetail fd = service.oFundingDetail(fundNo);
		if(fd!=null) {//펀딩이 있을 경우
			model.addAttribute("fund",fd.getFund().get(0));//펀딩정보와 기본이미지
			model.addAttribute("fundFD",fd.getFund().get(1));//펀딩정보와 상세이미지
			model.addAttribute("fundGoodsList",fd.getFundGoodsList());//펀딩상품정보
			
			ArrayList<FundReview> reviewList= service.reviewList(fundNo);
			System.out.println("reviewList:"+reviewList);
			model.addAttribute("reviewList",reviewList);
			//System.out.println("fund:"+fd.getFund());
		
			//System.out.println("fundGoodsList:"+fd.getFundGoodsList());
			return "client/oFundingDetail";
		}else {
			model.addAttribute("msg","상품을 불러오는데 실패했습니다");
			model.addAttribute("loc","/");//상품리스트 경로수정
			return "common/msg";
		}
	}
	
	
	@RequestMapping("/oFundingDetail1.sool")
	public String oFundingDetail1 (int fundNo, Model model){
		FundDetail fd = service.oFundingDetail(fundNo);
		if(fd!=null) {//펀딩이 있을 경우
			model.addAttribute("fund",fd.getFund().get(0));//펀딩정보와 기본이미지
			model.addAttribute("fundFD",fd.getFund().get(1));//펀딩정보와 상세이미지
			model.addAttribute("fundGoodsList",fd.getFundGoodsList());//펀딩상품정보
			
			ArrayList<FundReview> reviewList= service.reviewList(fundNo);
			System.out.println("reviewList:"+reviewList);
			model.addAttribute("reviewList",reviewList);
			//System.out.println("fund:"+fd.getFund());
		
			//System.out.println("fundGoodsList:"+fd.getFundGoodsList());
			return "client/oFundingDetail1";
		}else {
			model.addAttribute("msg","상품을 불러오는데 실패했습니다");
			model.addAttribute("loc","/");//상품리스트 경로수정
			return "common/msg";
		}
	}
	
	//펀딩상세페이지 - 같은펀딩을 후원했는지 안했는지 확인
	@ResponseBody
	@RequestMapping("/fundDetOverlapChk.sool")
	public String fundDetOverlapChk (int fundNo, int cliNo, Model model){
		int result = service.fundDetOverlapChk(fundNo,cliNo);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	//펀딩후원(예약)하기 - fnd_det_db에 insert / 목표달성시 fund_chk도 1로 업데이트
	@RequestMapping("/fundReservationInsert.sool")
	public String fundReservationInsert(int fundNo, int fndDPrice, int fndGNo, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			FundDetailDB fd = new FundDetailDB();
			fd.setFundNo(fundNo);
			fd.setFndDPrice(fndDPrice);
			fd.setFndGNo(fndGNo);
			fd.setFndDCli(sessionClient.getClientNo());
			System.out.println("펀딩후원insert");
			int result = service.fundReservationInsert(fd);
			System.out.println(result);
			if(result>0) {
				model.addAttribute("msg","후원이 완료되었습니다!!\\n펀딩종료일에 메일로 결제안내를 드립니다\\n확인하시고 결제 부탁드립니다");
			}else {
				model.addAttribute("msg","후원하기에 실패하였습니다");
			}
			model.addAttribute("loc","/client/oFundingDetail.sool?fundNo="+fd.getFundNo());
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
		}
		return "common/msg";
	}
	
	//마이페이지 - 펀딩
	@RequestMapping("mFunding.sool")
	public String mFunding (int reqPage, int period, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Subscribe sub = service.subscribeSelect(sessionClient.getClientRank());//구독랭크 정보가져오기
			FundingPageData fpd = service.mFundingPaging(reqPage,period,sessionClient.getClientNo());
			model.addAttribute("list",fpd.getList());
			model.addAttribute("pageNavi",fpd.getPageNavi());
			model.addAttribute("period",period);
			model.addAttribute("reqPage",reqPage);
			model.addAttribute("sub",sub);
			return "client/mFunding";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	
	//펀딩 주문/결제 페이지 이동
	@RequestMapping("/paymentFundingShow.sool")
	public String paymentFundingShow(int fndDNo, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Client2 client = new Client2();
			client = service.paymentShow(sessionClient.getClientNo());//사용자정보가져오기
			if(client != null) {//client정보 전체 호출하고
				FundingListData fd = service.paymentFundingSelect(fndDNo);//펀딩정보가져오기
				if(fd!=null) {
					model.addAttribute("fd",fd);
					model.addAttribute("client",client);
					return "client/oPaymentFunding";
				}else {
					model.addAttribute("msg","펀딩결제페이지 로드에 실패하였습니다");
					model.addAttribute("loc","/");
					return "common/msg";
				}
			}else {
				model.addAttribute("msg","사용자정보 로드에 실패했습니다");
				model.addAttribute("loc","/");
				return "common/msg";
			}
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//펀딩 - 결제완료페이지 이동
	@RequestMapping("/oCompleteFunding.sool")
	public String oCompleteFunding(Model model, int fndDTotalp, int fndDNo, String fndDPaydate, int cliPoint, String fndDCliaddr, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {
			System.out.println("결제정보");
			System.out.println(fndDPaydate);
			FundDetailDB fd = new FundDetailDB();
			fd.setFndDCli(sessionClient.getClientNo());
			fd.setFndDCliaddr(fndDCliaddr);
			fd.setFndDTotalp(fndDTotalp);
			fd.setFndDNo(fndDNo);
			fd.setFndDPaydate(fndDPaydate);
			
			int result = service.fundingPayUpdate(fd,sessionClient.getClientNo(),cliPoint);//fnd_det_db에 결제정보들 업뎃하고 사용자포인트 사용한것 빼기
			
			if(result>0) {
				Client2 client = service.paymentShow(sessionClient.getClientNo()); //client정보가져오기
				FundingListData fd2 = service.paymentFundingSelect(fndDNo);//펀딩정보가져오기
				
				model.addAttribute("client",client);//client정보
				model.addAttribute("fd",fd2);//fundinglistdata정보
				return "client/oSuccess";
			}else {
				model.addAttribute("msg","결제완료페이지 요청에 실패했습니다");
				model.addAttribute("loc","/client/basketList.sool");
				return "common/msg";
			}
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}	
	
	//마이페이지 - 펀딩 배송관리(수취확인)
	@RequestMapping("/fundDeliveryStatus.sool")
	public String fundDeliveryStatus(int fndDNo, int reqPage, int period, Model model) {
		int result = service.fundDeliveryStatus(fndDNo);
		if(result>0) {
			model.addAttribute("msg","수취확인이 완료되었습니다");
		}else {
			model.addAttribute("msg","수취확인에 실패하였습니다");
		}
		model.addAttribute("loc","/client/mFunding.sool?reqPage="+reqPage+"&period="+period);
		return "common/msg";
	}
	
	//마이페이지 - 내가 쓴 리뷰
	@RequestMapping("/mReview.sool")
	public String mReview(int reqPage, int period, Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			Subscribe sub = service.subscribeSelect(sessionClient.getClientRank());//구독랭크 정보가져오기
			ReviewPageData rpd = service.mReviewPaging(reqPage,period,sessionClient.getClientNo());
			model.addAttribute("rList",rpd.getRList());
			model.addAttribute("pageNavi",rpd.getPageNavi());
			model.addAttribute("period",period);
			model.addAttribute("reqPage",reqPage);
			model.addAttribute("sub",sub);
			return "client/mReview";
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
			return "common/msg";
		}
	}
	
	//마이페이지 - 구독취소하기
	@RequestMapping("/subscribeUpdate.sool")
	public String subscribeUpdate (Model model, @SessionAttribute(required=false) Client sessionClient) {
		if(sessionClient!=null) {//로그인된사용자만 접근가능하게
			int result = service.subscribeUpdate(sessionClient.getClientNo());
			if(result>0) {
				sessionClient.setClientRank(0);//세션도 업데이트해줘야함
				model.addAttribute("msg","구독이 취소되었습니다!\\n새로운 구독상품을 확인해보세요");
				model.addAttribute("loc","/subscribe.sool");
			}else {
				model.addAttribute("msg","구독 취소에 실패하였습니다\\n 관리자에게 문의해주세요");
				model.addAttribute("loc","/client/mOrderList.sool?reqPage=1&period=1");
			}
		}else {
			model.addAttribute("msg","로그인 후 이용해주세요");
			model.addAttribute("loc","/login.sool");
		}
		return "common/msg";
		
	}
		
}