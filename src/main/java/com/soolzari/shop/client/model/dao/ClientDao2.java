package com.soolzari.shop.client.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.client.model.vo.Basket;
import com.soolzari.shop.client.model.vo.BasketDel;
import com.soolzari.shop.client.model.vo.Client2;
import com.soolzari.shop.client.model.vo.ExperienceListData;
import com.soolzari.shop.client.model.vo.Fund;
import com.soolzari.shop.client.model.vo.FundDetailDB;
import com.soolzari.shop.client.model.vo.FundReview;
import com.soolzari.shop.client.model.vo.Funding;
import com.soolzari.shop.client.model.vo.FundingGoods;
import com.soolzari.shop.client.model.vo.FundingImg;
import com.soolzari.shop.client.model.vo.FundingListData;
import com.soolzari.shop.client.model.vo.Goods2;
import com.soolzari.shop.client.model.vo.GoodsList;
import com.soolzari.shop.client.model.vo.GoodsSellerDetail;
import com.soolzari.shop.client.model.vo.OrderListData;
import com.soolzari.shop.client.model.vo.Purchase;
import com.soolzari.shop.client.model.vo.Qna;
import com.soolzari.shop.client.model.vo.Subscribe;

@Repository
public class ClientDao2 {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int basketSelect(HashMap<String, Integer> map) {
		return sqlSession.selectOne("order.basketSelect", map);
	}
	
	public int basketUpdate(HashMap<String, Integer> map) {
		return sqlSession.update("order.basketUpdate", map);
	}
	
	public int basketInsert(HashMap<String, Integer> map) {
		return sqlSession.insert("order.basketInsert", map);
	}

	public ArrayList<Basket> basketAllSelect(int cliNo) {
		List<Basket> list = sqlSession.selectList("order.basketAllSelect", cliNo);
		return (ArrayList<Basket>) list;
	}

	public Goods2 goodsBasketSelect(int gdsNo) {
		return sqlSession.selectOne("order.goodsBasketSelect",gdsNo);
	}

	/*
	 * public int basketMinusUpdate(int basNo) { return
	 * sqlSession.update("order.basketMinusUpdate",basNo); }
	 */

	public int basketPlusMinusUpdate(HashMap<String, Integer> map) {
		return sqlSession.update("order.basketPlusMinusUpdate",map);
	}

	public int basketDelete(ArrayList<Integer> basNoList) {
		return sqlSession.delete("order.basketDelete",basNoList);
	}

	public Client2 memberInfoSelect(int cliNo) {
		return sqlSession.selectOne("order.memberInfoSelect",cliNo);
	}

	public int clientAddrUpdate(Client2 client) {
		return sqlSession.update("order.clientAddrUpdate",client);
	}

	public Basket paymentBasketSelect(int basNo) {
		return sqlSession.selectOne("order.paymentBasketSelect",basNo);
	}

	public int mInfoUpdate(Client2 client) {
		return sqlSession.update("mypage.mInfoUpdate",client);
	}

	public Client2 mInfoCheckPw(Client2 client) {
		return sqlSession.selectOne("mypage.mInfoCheckPw",client);
	}

	public int purchaseInsert(Purchase pur) {
		return sqlSession.insert("order.purchaseInsert",pur);
	}

	public int purchaseNoSelect(int cliNo) {
		return sqlSession.selectOne("order.purchaseNoSelect",cliNo);
	}

	public int goodsListInsert(GoodsList gl) {
		return sqlSession.insert("order.goodsListInsert",gl);
	}

	public int pointUpdate(Client2 client) {
		return sqlSession.update("order.pointUpdate",client);
	}

	public int totalCountPage(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountPage",map);
	}

	public ArrayList<OrderListData> orderListSelect(int start, int end, int cliNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		List<OrderListData> list =  sqlSession.selectList("mypage.orderListSelect",map);
		return (ArrayList<OrderListData>)list;
	}
	public ArrayList<Purchase> purchasePageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<Purchase> list =  sqlSession.selectList("mypage.purchasePageSelect",map);
		return (ArrayList<Purchase>)list;
	}

	public ArrayList<OrderListData> orderListDataSelect(ArrayList<Purchase> pList) {
		List<OrderListData> list =  sqlSession.selectList("mypage.orderListDataSelect",pList);
		return (ArrayList<OrderListData>)list;
	}
	
	//주문내역 배송관리(취소신청/수취확인)
	public int orderDeliveryStatus(int gdsLNo, int deliveryStatus) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("gdsLNo", gdsLNo);
		map.put("deliveryStatus", deliveryStatus);
		return sqlSession.update("mypage.orderDeliveryStatus",map);
	}
	
	//마이페이지 - 클래스 예약현황-------------------------------

	public int totalCountExperience(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountExperience",map);
	}

	public ArrayList<ExperienceListData> experienceListDataPageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<ExperienceListData> list =  sqlSession.selectList("mypage.experienceListDataPageSelect",map);
		return (ArrayList<ExperienceListData>)list;
	}

	//클래스 취소신청하기
	public int classCancel(int clsLNo) {
		return sqlSession.update("mypage.classCancel",clsLNo);
	}
	
	//마이페이지 - 문의하기-------------------------------
	public int questionInsert(Qna question) {
		return sqlSession.insert("mypage.questionInsert",question);
	}

	public int totalCountQuestion(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountQuestion",map);
	}

	public ArrayList<Qna> qnaDataPageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<Qna> list =  sqlSession.selectList("mypage.qnaDataPageSelect",map);
		return (ArrayList<Qna>)list;
	}

	//구매완료 시 장바구니에서 상품삭제
	public int basketGoodsDelete(Client2 client, ArrayList<Integer> gdsNoList) {
		BasketDel bd = new BasketDel(gdsNoList,client.getCliNo());
		return sqlSession.delete("order.basketGoodsDelete",bd);
	}

	//클래스체험다음날0시가 되면 체험완료로 변경(스케줄러/scheduler)
	public void classCheckUpdate() {
		sqlSession.update("mypage.classCheckUpdate");
	}

	
	//상품상세페이지
	public ArrayList<GoodsSellerDetail> oGoodsDetail(int gdsNo) {
		List<GoodsSellerDetail> list = sqlSession.selectList("order.oGoodsDetail",gdsNo);
		return (ArrayList<GoodsSellerDetail>) list;
	}
	
	//펀딩상세페이지 - 펀딩정보
	public ArrayList<FundingImg> fundingSelect(int fundNo) {
		List<FundingImg> list = sqlSession.selectList("order.fundingSelect",fundNo);
		return (ArrayList<FundingImg>) list;
	}
	
	//펀딩상세페이지 - 펀딩상품정보
	public ArrayList<FundingGoods> fundingGoodsSelect(int fundNo) {
		List<FundingGoods> fundGoodsList =  sqlSession.selectList("order.fundingGoodsSelect",fundNo);
		return (ArrayList<FundingGoods>)fundGoodsList;
	}
	
	//같은펀딩을 후원했는지 안했는지 확인
	public int fundDetOverlapChk(int fundNo, int cliNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("fundNo", fundNo);
		map.put("cliNo", cliNo);
		return sqlSession.selectOne("order.fundDetOverlapChk",map);
	}

	//펀딩후원(예약)하기 - fnd_det_db에 insert
	public int fundReservationInsert(FundDetailDB fd) {
		return sqlSession.insert("order.fundReservationInsert",fd);
	}
	//예약완료 후 목표달성률을 넘긴 펀딩이면 chk를 1로 업데이트
	public int fundChkUpdate(int fundNo) {
		return sqlSession.update("order.fundChkUpdate",fundNo);
	}

	//마이페이지 - 펀딩(총레코드수구하기)
	public int totalCountFunding(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountFunding",map);
	}
	//마이페이지 - 펀딩리스트
	public ArrayList<FundingListData> FundingDataPageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<FundingListData> list =  sqlSession.selectList("mypage.FundingDataPageSelect",map);
		return (ArrayList<FundingListData>)list;
	}

	//펀딩 주문/결제 페이지 이동
	public FundingListData paymentFundingSelect(int fndDNo) {
		return sqlSession.selectOne("mypage.paymentFundingSelect",fndDNo);
	}

	//펀딩 - 결제완료페이지 이동(결제정보업뎃)
	public int fundDetailUpdate(FundDetailDB fd) {
		return sqlSession.update("mypage.fundDetailUpdate",fd);
	}

	
	//매일 자정 종료일인 펀딩 중 달성된 펀딩일경우 fnd_det_db의 fnd_d_status를 1로 변경(결제버튼생성됨)
	public void fndDStatusYUpdate() {
		sqlSession.update("mypage.fndDStatusYUpdate");
	}
	//매일 자정 종료일인 펀딩 중 미달성된 펀딩일경우 fnd_det_db의 fnd_d_status를 7로 변경(목표미달성이라는 문구 출력)
	public void fndDStatusNUpdate() {
		sqlSession.update("mypage.fndDStatusNUpdate");
	}
	//매일 자정 종료일인 펀딩 중 미달성된 펀딩일 경우funding_db의 fund_chk를 2로 변경
	public void fundChkNUpdate() {
		sqlSession.update("mypage.fundChkNUpdate");
	}

	//마이페이지 - 펀딩 배송관리(수취확인)
	public int fundDeliveryStatus(int fndDNo) {
		return sqlSession.update("mypage.fundDeliveryStatus",fndDNo);
	}
	
	//달성한 펀딩 결제메일보내기
	//미달성한 펀딩 결제메일보내기
	public ArrayList<Client2> emailSelect(int fundChk) {
		List<Client2> list =  sqlSession.selectList("mypage.emailSelect",fundChk);
		return (ArrayList<Client2>)list;
	}

	//구독랭크 정보가져오기
	public Subscribe subscribeSelect(int clientRank) {
		return sqlSession.selectOne("mypage.subscribeSelect",clientRank);
	}

	//상품 구매시 카운트 증가goods테이블 (gds_bcnt컬럼)
	public int gdsBcntUpdate(int gdsNo, int gdsLCnt) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("gdsNo", gdsNo);
		map.put("gdsLCnt", gdsLCnt);
		return sqlSession.update("order.gdsBcntUpdate",map);
	}

	

	
	//댓글(최효길님)
	public ArrayList<FundReview> reviewList(int fundNo) {
		
		List<FundReview> list =sqlSession.selectList("client.getReview",fundNo);
		return (ArrayList<FundReview>)list;
	}
	//댓글(최효길님)
	public ArrayList<FundReview> reviewList1(int gdsNo) {
		List<FundReview> list =sqlSession.selectList("client.getReview1",gdsNo);
		return (ArrayList<FundReview>)list;
	}

	//마이페이지 - 내가쓰리뷰 페이징
	public int totalCountReview(int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cliNo", cliNo);
		map.put("period", period);
		return sqlSession.selectOne("mypage.totalCountReview",map);
	}

	public ArrayList<FundReview> reviewDataPageSelect(int start, int end, int cliNo, int period) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("cliNo", cliNo);
		map.put("period", period);
		List<FundReview> list =  sqlSession.selectList("mypage.reviewDataPageSelect",map);
		return (ArrayList<FundReview>)list;
	}

	//마이페이지 - 구독취소하기
	public int subscribeUpdate(int cliNo) {
		return sqlSession.update("mypage.subScribeUpdate",cliNo);
	}

	//상품주문취소시 purchase_db에 pur_cancel을 0->1로 전환
	public int purCancelUpdate(int purNo) {
		return sqlSession.update("mypage.purCancelUpdate",purNo);
	}

	public int orderDeliveryCancelStatus(int purNo, int deliveryStatus) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("purNo", purNo);
		map.put("deliveryStatus", deliveryStatus);
		return sqlSession.update("mypage.orderDeliveryCancelStatus",map);
	}

	//구독중인 고객들만 뽑아서 매달 1일에 메일전송
	public ArrayList<String> subscribePayMail() {
		List<String> cliEmailList = sqlSession.selectList("mypage.subscribePayMail");
		return (ArrayList<String>) cliEmailList;
	}

	


	

	
}
