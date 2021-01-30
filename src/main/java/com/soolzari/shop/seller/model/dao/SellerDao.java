package com.soolzari.shop.seller.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.Funding;
import com.soolzari.shop.seller.model.vo.FundingGoods;
import com.soolzari.shop.seller.model.vo.FundingList;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.GoodsList;
import com.soolzari.shop.seller.model.vo.Image;
import com.soolzari.shop.seller.model.vo.Score;
import com.soolzari.shop.seller.model.vo.Seller;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertSeller(Seller s) {
		return sqlSession.insert("seller.insertSeller",s);
	}

	public Seller selectOneSeller(Seller s) {
		return sqlSession.selectOne("seller.selectOneSeller",s);
	}


	public ArrayList<Class> selectAllClass(HashMap<String, Integer> pageNo) {
		List<Class> list = sqlSession.selectList("seller.selectAllClass", pageNo);
		return (ArrayList<Class>)list;
	}
	
	public int classTotalCount(int selNo) {
		return sqlSession.selectOne("seller.classTotalCount", selNo);
	}
	
	public int goodsTotalCount(int selNo) {
		return sqlSession.selectOne("seller.goodsTotalCount", selNo);
	}

	public ArrayList<Goods> selectAllGoods(HashMap<String, Integer> pageNo) {
		List<Goods> list = sqlSession.selectList("seller.selectAllGoods", pageNo);
		return (ArrayList<Goods>)list;
	}

	public int insertGoods(Goods g) {
		return sqlSession.insert("seller.insertGoods",g);
	}
	
	public int insertImage(Image i) {
		return sqlSession.insert("seller.insertImage",i);
	}

	public int searchLastGoods() {
		return sqlSession.selectOne("seller.searchLastGoods");
	}

	public Goods selectOneGoods(int gdsNo) {
		return sqlSession.selectOne("seller.selectOneGoods",gdsNo);
	}

	public Image selectOneImage(int No, int num) {
		System.out.println("image Dao:"+No);
		if(num==1) {
			return sqlSession.selectOne("seller.selectOneImageGoodsOne",No);
		}else if(num==2) {
			return sqlSession.selectOne("seller.selectOneImageGoodsTwo",No);
		}else if(num==3) {
			return sqlSession.selectOne("seller.selectOneImageFundingOne",No);
		}else if(num==4) {
			return sqlSession.selectOne("seller.selectOneImageFundingTwo",No);
		}
		return null;
	}

	public Score selectOneScore(int gdsNo) {
		return sqlSession.selectOne("seller.selectOneScore",gdsNo);
	}

	public int addClass(Class cls) {
		System.out.println("classDao: "+cls);;
		return sqlSession.insert("seller.insertClass",cls);
	}

	public int modifyGoods(Goods g) {
		return sqlSession.update("seller.updateGoods",g);
	}

	public int deleteGoods(int temp) {
		System.out.println("dao temp:"+temp);
		return sqlSession.delete("seller.deleteGoods",temp);
	}

	public Class getClassInfo(int classNo) {
	
		System.out.println("dao classNo : "+classNo);
		return sqlSession.selectOne("seller.getClassInfo",classNo);
		
	}
	//마이페이지 - 판매자 정보 수정
	public int mypageUpdateSeller(Seller seller) {
		return sqlSession.update("seller.mypageSellerUpdate",seller);
	}

	public int deleteClass(int value) {
		System.out.println(value);
		return sqlSession.delete("seller.deleteClass",value);
	}

	public int modifyClass(Class c) {
		return sqlSession.update("seller.updateClass",c);
	}
	public ArrayList<Funding> selectAllFunding(HashMap<String, Integer> pageNo) {
		List<Funding> list = sqlSession.selectList("seller.selectAllFunding", pageNo);
		System.out.println(list.size());
		return (ArrayList<Funding>)list;
	}

	public int FundingTotalCount(int selNo) {
		return sqlSession.selectOne("seller.fundingTotalCount", selNo);
	}

	public Funding selectOneFunding(int fundNo) {
		return sqlSession.selectOne("seller.selectOneFunding",fundNo);
	}

	public ArrayList<FundingGoods> selectAllFundingGoods(int fundNo) {
		List<FundingGoods> list = sqlSession.selectList("seller.selectAllFundingGoods", fundNo);
		return (ArrayList<FundingGoods>)list;
	}

	public int insertFunding(Funding f) {
		return sqlSession.insert("seller.insertFunding",f);
	}

	public int searchLastFunding() {
		return sqlSession.selectOne("seller.selectLastFunding");
	}

	public int deleteFunding(int fundNo) {
		return sqlSession.delete("seller.deleteFunding",fundNo);
	}

	public int insertFundingGoods(FundingGoods fg) {
		return sqlSession.insert("seller.insertFundingGoods",fg);
	}

	public int updateGdsDStatus(HashMap<String, Integer> gdsInfo) {
		return sqlSession.update("seller.updateGdsDStatus",gdsInfo);
	}

	public int updatePurchaseStatus(int purNo) {
		return sqlSession.update("seller.updatePurchaseStatus",purNo);
	}

	public int selectPurNo(int gdsLNo) {
		return sqlSession.selectOne("seller.selectPurNo",gdsLNo);
	}

	public ArrayList<GoodsList> selectAllGoodsList(HashMap<String, Integer> pageNo) {
		List<GoodsList> gdsList = sqlSession.selectList("seller.selectAllGoodsList",pageNo);
		return (ArrayList<GoodsList>)gdsList;
	}

	public int goodsListTotalCount(int selNo) {
		return sqlSession.selectOne("seller.goodsListTotalCount",selNo);
	}

	public ArrayList<FundingList> selectAllFundingList(HashMap<String, Integer> pageNo) {
		List<FundingList> fndList = sqlSession.selectList("seller.selectAllFundingList",pageNo);
		return (ArrayList<FundingList>)fndList;
	}

	public int fundingListTotalCount(int selNo) {
		return sqlSession.selectOne("seller.fundingListTotalCount", selNo);
	}

	public int updateFndDStatus(HashMap<String, Integer> fndInfo) {
		return sqlSession.update("seller.updateFndDStatus",fndInfo);
	}

	public Seller checkId(Seller s) {
		return sqlSession.selectOne("seller.checkId",s);
	}
	public int selectSellerGoods(int selNo) {
		return sqlSession.selectOne("admin.selectSellerGoods", selNo);
	}

	public int selectSellerSales(int selNo) {
		return sqlSession.selectOne("admin.selectSellerSales", selNo);
	}
	
	
}
