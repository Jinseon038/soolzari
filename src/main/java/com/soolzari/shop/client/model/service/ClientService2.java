package com.soolzari.shop.client.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soolzari.shop.client.model.dao.ClientDao2;
import com.soolzari.shop.client.model.vo.Basket;
import com.soolzari.shop.client.model.vo.BasketList;
import com.soolzari.shop.client.model.vo.Client2;
import com.soolzari.shop.client.model.vo.ExperienceListData;
import com.soolzari.shop.client.model.vo.ExperiencePageData;
import com.soolzari.shop.client.model.vo.FundDetail;
import com.soolzari.shop.client.model.vo.FundDetailDB;
import com.soolzari.shop.client.model.vo.FundReview;
import com.soolzari.shop.client.model.vo.Funding;
import com.soolzari.shop.client.model.vo.FundingGoods;
import com.soolzari.shop.client.model.vo.FundingImg;
import com.soolzari.shop.client.model.vo.FundingListData;
import com.soolzari.shop.client.model.vo.FundingPageData;
import com.soolzari.shop.client.model.vo.Goods2;
import com.soolzari.shop.client.model.vo.GoodsList;
import com.soolzari.shop.client.model.vo.GoodsSellerDetail;
import com.soolzari.shop.client.model.vo.OrderListData;
import com.soolzari.shop.client.model.vo.OrderPageData;
import com.soolzari.shop.client.model.vo.Purchase;
import com.soolzari.shop.client.model.vo.Qna;
import com.soolzari.shop.client.model.vo.QnaPageData;
import com.soolzari.shop.client.model.vo.ReviewPageData;
import com.soolzari.shop.client.model.vo.Subscribe;
import com.soolzari.shop.common.EmailSender;

@Service
public class ClientService2 {
	@Autowired
	private ClientDao2 dao;
	

	@Transactional
	public int basketInsert(int cliNo, int gdsNo, int basCnt) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("gdsNo",gdsNo);
		map.put("basCnt", basCnt);
		
		int result = 0;
		if(dao.basketSelect(map)>0) {	//장바구니에 같은 상품이 있으면 개수만 update
			result = dao.basketUpdate(map);
		}else {							//장바구니에 같은상품이 없으면 insert
			result = dao.basketInsert(map);
		}
		return result;
	}
	
	//장바구니에 출력할 값(basket,goods gds_no을 기준으로 묶어서 가져옴)
	public ArrayList<BasketList> basketAllSelect(int cliNo) {
		ArrayList<Basket> basketList = dao.basketAllSelect(cliNo);
		Goods2 goods = null;
		//HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		ArrayList<BasketList> list = new ArrayList<BasketList>();
		
		for(Basket b : basketList) {
			goods = dao.goodsBasketSelect(b.getGdsNo());
			BasketList bl = new BasketList();
			bl.setGoods(goods);
			bl.setBasket(b);
			list.add(bl);
		}
		return list;
	}

	/*
	 * @Transactional public int basketMinusUpdate(int basNo) { return
	 * dao.basketMinusUpdate(basNo); }
	 */
	@Transactional
	public int basketPlusMinusUpdate(int basNo, int chk) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("chk", chk);	//0이면 마이너스 1이면 플러스
		map.put("basNo", basNo);
		return dao.basketPlusMinusUpdate(map);
	}
	
	@Transactional
	public int basketDelete(ArrayList<Integer> basNoList) {
		return dao.basketDelete(basNoList);
	}
	
	//주문/결제 페이지출력
	public Client2 paymentShow(int cliNo) {
		return dao.memberInfoSelect(cliNo);//사용자정보가져오기
	}
	
	
	//주문/결제 페이지 주소 수정(update)
	@Transactional
	public int clientAddrUpdate(Client2 client) {
		return dao.clientAddrUpdate(client);
	}
	
	
	//주문/결제에 출력할 상품(basket,goods gds_no을 기준으로 묶어서 가져옴)
	public ArrayList<BasketList> paymentAllSelect(ArrayList<Integer> basNoList) {
		Goods2 goods = new Goods2();
		Basket basket = new Basket();
		ArrayList<BasketList> list = new ArrayList<BasketList>();
			
		for(int basNo : basNoList) {
			basket = dao.paymentBasketSelect(basNo);
			goods = dao.goodsBasketSelect(basket.getGdsNo());
			BasketList bl = new BasketList();
			bl.setGoods(goods);
			bl.setBasket(basket);
			list.add(bl);
		}
		return list;
	}
	
	//구매하기버튼으로 주문/결제로 바로 감
	public ArrayList<BasketList> paymentAllSelect(GoodsList goodsList) {
		Goods2 goods = new Goods2();
		Basket basket = new Basket();
		
		ArrayList<BasketList> list = new ArrayList<BasketList>();
		
		goods = dao.goodsBasketSelect(goodsList.getGdsNo());
		basket.setBasCnt(goodsList.getGdsLCnt());
		
		BasketList bl = new BasketList();
		bl.setGoods(goods);
		bl.setBasket(basket);
		list.add(bl);
		
		return list;
	}
	
	@Transactional
	public int updateMInfo(Client2 client) {
		return dao.mInfoUpdate(client);
	}
	
	//마이페이지 내정보수정-비밀번호 확인하기
	public Client2 checkPwMInfo(Client2 client) {
		return dao.mInfoCheckPw(client);
	}
	
	//결제insert
	@Transactional
	public int paymentInsert(Client2 client, String gdsNoStr, String gdsLCntStr, Purchase pur) {
		System.out.println("service");
		//purchase테이블에 insert
		int result = dao.purchaseInsert(pur);
		if(result>0) {
			
			//위에서 insert한 purchase테이블에서 해당사용자의 가장최근 purNo을 조회
			int purNo = dao.purchaseNoSelect(pur.getCliNo());
			System.out.println("purNo : "+purNo);
			StringTokenizer st = new StringTokenizer(gdsNoStr,","); 
			StringTokenizer st2 = new StringTokenizer(gdsLCntStr,","); 
			ArrayList<Integer> gdsNoList = new ArrayList<Integer>(); 
			ArrayList<Integer> gdsLCntList = new ArrayList<Integer>();
			
			while(st.hasMoreTokens()) {//gdsNo을 다시 int타입으로 ArrayList에 저장 
				gdsNoList.add(Integer.parseInt(st.nextToken()));
			}
			while(st2.hasMoreTokens()) {//gdsLCnt을 다시 int타입으로 ArrayList에 저장 
				gdsLCntList.add(Integer.parseInt(st2.nextToken()));
			}
			//결제한 상품의 basket정보(개수)와 goods정보를 가져옴
			//ArrayList<BasketList> basketList = paymentAllSelect(basNoList);//위에서 사용한 메소드 재활용
			
			ArrayList<BasketList> basketList = new ArrayList<BasketList>();
			int i = 0;
			for(int gdsNo : gdsNoList) {
				Goods2 goods = new Goods2();
				Basket basket = new Basket();
				basket.setBasCnt(gdsLCntList.get(i));
				goods = dao.goodsBasketSelect(gdsNo);
				BasketList bl = new BasketList();
				bl.setGoods(goods);
				bl.setBasket(basket);
				basketList.add(bl);
				i++;
			}
			//ArrayList<GoodsList> goodsList = new ArrayList<GoodsList>();
			for(BasketList bl : basketList) {//주문번호 하나당 상품여러개가능하니까(purchase한레코드당 여러개의 goodsList레코드 존재)
				GoodsList gl = new GoodsList();
				gl.setGdsLCnt(bl.getBasket().getBasCnt());	//상품개수
				gl.setGdsNo(bl.getGoods().getGdsNo());		//상품번호
				gl.setGdsLPrice(bl.getGoods().getGdsPri());	//상품가격
				gl.setPurNo(purNo);							//주문번호
				//goodsList.add(gl);
				result = dao.goodsListInsert(gl);
			}
			if(result>0) {
				//point감소
				result = dao.pointUpdate(client);
				if(result>0) {
					//장바구니에서 구매한 상품 삭제
					result = dao.basketGoodsDelete(client,gdsNoList);
					System.out.println("gdsNoList.size() : "+gdsNoList.size());
					System.out.println("gdsLCntList.size() : "+gdsLCntList.size());
					//상품 카운트 증가
					for(int j=0;j<gdsNoList.size();j++) {
						result = dao.gdsBcntUpdate(gdsNoList.get(j),gdsLCntList.get(j));
					}
					
				}else {
					result = 0;
				}
			}else {
				result = 0;
			}
			
			
			
			
		}
		return result;
	}

	//주문내역 페이징
	public OrderPageData mOrderListPaging(int reqPage, int period, int cliNo) {//period(조회기간/1,3,6,12개월)
		int totalPage = dao.totalCountPage(cliNo, period); //총개수(purchase에서 저장된)
		int per = 5;	//한페이지에 보여줄 주문개수
		if(totalPage%per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		
		//ArrayList<OrderListData> list = dao.orderListSelect(start,end,cliNo);
		ArrayList<Purchase> pList = dao.purchasePageSelect(start,end,cliNo,period);	//purchase디비정보
		if(pList.isEmpty()) {
			return new OrderPageData();
		}
		ArrayList<OrderListData> olDataList = dao.orderListDataSelect(pList); 	//purchase의 purNo과 같은 애들중에 goods,goodslistdb 정보들
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(pageIdx>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mOrderList.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mOrderList.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mOrderList.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		OrderPageData opd = new OrderPageData(pList, olDataList, pageNavi);
		return opd;
	}
	
	//주문내역 배송관리(취소신청/수취확인)
	@Transactional
	public int orderDeliveryStatus(int gdsLNo,int deliveryStatus) {
		return dao.orderDeliveryStatus(gdsLNo,deliveryStatus);
	}
	
	//클래스 예약 내역 페이징
	public ExperiencePageData mExperiencePaging(int reqPage, int period, int cliNo) {
		int totalPage = dao.totalCountExperience(cliNo, period); //총개수(예약된 클래스(class_list_db)에서 저장된)
		int per = 10;	//한페이지에 보여줄 주문개수
		if(totalPage%per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		
		ArrayList<ExperienceListData> eList = dao.experienceListDataPageSelect(start,end,cliNo,period);	//experienceListData디비정보(서브쿼리로조합해서)
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(pageIdx>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mExperience.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mExperience.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mExperience.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		ExperiencePageData epd = new ExperiencePageData(eList, pageNavi);
		return epd;
	}
	
	//클래스 취소신청하기
	@Transactional
	public int classCancel(int clsLNo) {
		return dao.classCancel(clsLNo);
	}
	
	//문의하기 페이징
	public QnaPageData mQuestionPaging(int reqPage, int period, int cliNo) {
		int totalPage = dao.totalCountQuestion(cliNo, period); //총개수(예약된 클래스(class_list_db)에서 저장된)
		int per = 10;	//한페이지에 보여줄 주문개수
		if(totalPage%per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		System.out.println("totalPage"+totalPage);
		System.out.println("start"+start);
		System.out.println("end"+end);
		
		ArrayList<Qna> list = dao.qnaDataPageSelect(start,end,cliNo,period);	//experienceListData디비정보(서브쿼리로조합해서)
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(pageIdx>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mQuestion.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mQuestion.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mQuestion.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		QnaPageData qpd = new QnaPageData(list, pageNavi);
		return qpd;
	}
	
	@Transactional
	public int questionInsert(Qna question) {
		return dao.questionInsert(question);
	}
	
	//클래스체험다음날0시가 되면 체험완료로 변경(스케줄러/scheduler)
	@Transactional
	public void classCheckUpdate() {
		System.out.println("스케줄러!!!");
		dao.classCheckUpdate();
	}
	
	//상품상세페이지
	public ArrayList<GoodsSellerDetail> oGoodsDetail(int gdsNo) {
		return dao.oGoodsDetail(gdsNo);
	}
	
	//펀딩상세페이지
	public FundDetail oFundingDetail(int fundNo) {
		//Funding fund = dao.fundingSelect(fundNo);
		ArrayList<FundingImg> fund = dao.fundingSelect(fundNo);//펀딩정보 및 이미지(2개) 가져오기
		ArrayList<FundingGoods> fundGoodsList = dao.fundingGoodsSelect(fundNo);//펀딩상품정보 가져오기
		FundDetail fd = new FundDetail(fund, fundGoodsList);
		return fd;
	}
	
	//같은펀딩을 후원했는지 안했는지 확인
	public int fundDetOverlapChk(int fundNo, int cliNo) {
		return dao.fundDetOverlapChk(fundNo,cliNo);
	}
	
	//펀딩후원(예약)하기 - fnd_det_db에 insert
	@Transactional
	public int fundReservationInsert(FundDetailDB fd) {
		int result = dao.fundReservationInsert(fd);
		if(result>0) {//예약완료 후 목표달성률을 넘긴 펀딩이면 chk를 1로 업데이트
			result += dao.fundChkUpdate(fd.getFundNo());
		}
		return result;//0:예약실패, 1:예약성공 목표달성도 체크
	}

	//마이페이지 - 펀딩(페이징)
	public FundingPageData mFundingPaging(int reqPage, int period, int cliNo) {
		int totalPage = dao.totalCountFunding(cliNo, period); //총개수(예약(후원)한 펀딩(fnd_det_db)에서 저장된)
		int per = 10;	//한페이지에 보여줄 주문개수
		if(totalPage%per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		System.out.println("totalPage"+totalPage);
		System.out.println("start"+start);
		System.out.println("end"+end);
		
		ArrayList<FundingListData> list = dao.FundingDataPageSelect(start,end,cliNo,period);	//experienceListData디비정보(서브쿼리로조합해서)
		
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(pageIdx>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mFunding.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
		
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mFunding.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mFunding.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		FundingPageData fpd = new FundingPageData(list, pageNavi);
		return fpd;
	}

	//펀딩 주문/결제 페이지 이동
	public FundingListData paymentFundingSelect(int fndDNo) {
		return dao.paymentFundingSelect(fndDNo);
	}

	//펀딩 - 결제완료페이지 이동
	@Transactional
	public int fundingPayUpdate(FundDetailDB fd, int cliNo, int cliPoint) {
		Client2 client = new Client2();
		client.setCliNo(cliNo);
		client.setCliPoint(cliPoint);
		//fnd_det_db결제정보 업데이트하기
		int result = dao.fundDetailUpdate(fd);
		if(result>0) {//사용한포인트 업뎃하기
			result = dao.pointUpdate(client);
		}
		return result;
	}

	//마이페이지 - 펀딩 배송관리(수취확인)
	@Transactional
	public int fundDeliveryStatus(int fndDNo) {
		return dao.fundDeliveryStatus(fndDNo);
	}
	
	
	//펀딩 종료일에 목표달성이 됐으면 fnd_d_status를 1로 update(결제하라는 버튼표시) + 결제알림 메일전송필요...
	//펀딩 종료일에 목표미달성이 됐으면 fnd_d_status를 7로 update(미결제취소 표시)
	@Transactional
	public HashMap<String, ArrayList<Client2>> fndDStatusUpdate() {
		System.out.println("달성");
		dao.fndDStatusYUpdate();//달성 fnd_d_status를 1
		System.out.println("미달성");
		dao.fndDStatusNUpdate();//미달성 fnd_d_status를 7
		dao.fundChkNUpdate();//미달성 fund_db테이블의 fundChk를 -1로
		
		ArrayList<Client2> clientYList = new ArrayList<Client2>();
		clientYList = dao.emailSelect(1);//1:달성한 펀딩//사용자이메일 조회
		System.out.println(clientYList.size());
		ArrayList<Client2> clientNList = new ArrayList<Client2>();
		clientNList = dao.emailSelect(0);//0:미달성한 펀딩//사용자이메일 조회
		System.out.println(clientNList.size());
		
		HashMap<String, ArrayList<Client2>> map = new HashMap<String, ArrayList<Client2>>();
		map.put("clientYList", clientYList);
		map.put("clientNList", clientNList);
		
		return map;
	}

	//구독랭크 정보가져오기
	public Subscribe subscribeSelect(int clientRank) {
		return dao.subscribeSelect(clientRank);
	}

	//댓글(최효길님)
	public ArrayList<FundReview> reviewList(int fundNo) {
		
		return dao.reviewList(fundNo);
	}

	//댓글(최효길님)
	public ArrayList<FundReview> reviewList1(int gdsNo) {
		return dao.reviewList1(gdsNo);
	}

	//리뷰 페이징
	public ReviewPageData mReviewPaging(int reqPage, int period, int cliNo) {
		int totalPage = dao.totalCountReview(cliNo, period); //총개수(리뷰(review_db)에서 저장된)
		int per = 10;	//한페이지에 보여줄 주문개수
		if(totalPage%per==0) {//총페이지수
			totalPage = totalPage/per;
		}else {
			totalPage = totalPage/per+1;
		}
		int end = reqPage*per;
		int start = end-per+1;
		System.out.println("totalPage"+totalPage);
		System.out.println("start"+start);
		System.out.println("end"+end);
			
		ArrayList<FundReview> list = dao.reviewDataPageSelect(start,end,cliNo,period);	//experienceListData디비정보(서브쿼리로조합해서)
			
		int pageAllIdx = 5;
		int pageIdx = (reqPage-1)/pageAllIdx*pageAllIdx+1;
		System.out.println(reqPage);
		String pageNavi = "";
		if(pageIdx>1) {//이전버튼
			pageNavi += "<a id='prev1' href='/client/mReview.sool?reqPage="+(pageIdx-1)+"&period="+period+"'><</a>";
		}
			
		for(int i = 0;i<pageAllIdx;i++) {
			if(pageIdx!=reqPage) {//a태그잇게
				pageNavi += "<a class='pageA' href='/client/mReview.sool?reqPage="+pageIdx+"&period="+period+"'>"+pageIdx+"</a>";
			}else {//a태그없게
				pageNavi += "<span class='selectedPage'>"+pageIdx+"</span>";
			}
			pageIdx++;
			if(pageIdx>totalPage) {
				break;
			}
		}
		if(pageIdx<=totalPage) {//다음버튼
			pageNavi += "<a id='next1' href='/client/mReview.sool?reqPage="+pageIdx+"&period="+period+"'>></a>";
		}
		ReviewPageData rpd = new ReviewPageData(list, pageNavi);
		return rpd;
	}

	//마이페이지 - 구독취소하기
	@Transactional
	public int subscribeUpdate(int cliNo) {
		return dao.subscribeUpdate(cliNo);
	}
	
	//상품주문취소시 purchase_db에 pur_cancel을 0->1로 전환
	@Transactional
	public int purCancelUpdate(int purNo) {
		return dao.purCancelUpdate(purNo);
	}

	
	//상품취소신청 버튼
	@Transactional
	public int orderDeliveryCancelStatus(int purNo, int deliveryStatus) {
		return dao.orderDeliveryCancelStatus(purNo,deliveryStatus);
	}
	

	
}
