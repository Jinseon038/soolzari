package com.soolzari.shop.seller.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticePage;
import com.soolzari.shop.seller.model.dao.SellerDao;
import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.ClassPage;
import com.soolzari.shop.seller.model.vo.Funding;
import com.soolzari.shop.seller.model.vo.FundingGoods;
import com.soolzari.shop.seller.model.vo.FundingList;
import com.soolzari.shop.seller.model.vo.FundingListPage;
import com.soolzari.shop.seller.model.vo.FundingPage;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.GoodsList;
import com.soolzari.shop.seller.model.vo.GoodsListPage;
import com.soolzari.shop.seller.model.vo.GoodsPage;
import com.soolzari.shop.seller.model.vo.Image;
import com.soolzari.shop.seller.model.vo.Score;
import com.soolzari.shop.seller.model.vo.Seller;

@Service
public class SellerService {
	
	@Autowired
	SellerDao dao;
	
	@Transactional
	public int insertSeller(Seller s) {
		return dao.insertSeller(s);
	}
	
	public Seller selectOneSeller(Seller s) {
		return dao.selectOneSeller(s);
	}


	public ClassPage selectAllClass(int reqPage, int selNo) {
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
		pageNo.put("start", start);
		pageNo.put("end", end);
		pageNo.put("selNo", selNo);
		ArrayList<Class> list = dao.selectAllClass(pageNo);
		ClassPage cp = new ClassPage();
		cp.setList(list);
		int totalCount = dao.classTotalCount(selNo);//총 게시물 수
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageStart = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		if(pageStart>1) {
			page += "<a href='/seller/ClassList.sool?reqPage=1&selNo="+selNo+"'>처음</a>";
			page += "<a href='/seller/ClassList.sool?reqPage="+(pageStart-1)+"&selNo="+selNo+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageStart) {
				page += "<a href='/seller/ClassList.sool?reqPage="+pageStart+"&selNo="+selNo+"' class='num'>"+pageStart+"</a>";
			}else {
				page += "<span class='sel'>"+pageStart+"</span>";
			}
			pageStart++;
			if(pageStart>totalPage) {
				break;
			}
		}
		if(pageStart<=totalPage) {
			page += "<a href='/seller/ClassList.sool?reqPage="+pageStart+"&selNo="+selNo+"'>></a>";
			page += "<a href='/seller/ClassList.sool?reqPage="+totalPage+"&selNo="+selNo+"'>마지막</a>";
		}
		cp.setPage(page);
		return cp;
	}

public GoodsPage selectAllGoods(int reqPage, int selNo) {
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo", selNo);
	ArrayList<Goods> list = dao.selectAllGoods(pageNo);
	GoodsPage gp = new GoodsPage();
	gp.setList(list);
	int totalCount = dao.goodsTotalCount(selNo);//총 게시물 수
	int totalPage = 0;
	if(totalCount%numPerPage==0) {
		totalPage = totalCount/numPerPage;
	}else {
		totalPage = (totalCount/numPerPage)+1;
	}
	int pageNaviSize = 5;
	String page = "";
	int pageStart = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
	if(pageStart>1) {
		page += "<a href='/seller/goodsList.sool?reqPage=1&selNo="+selNo+"'>처음</a>";
		page += "<a href='/seller/goodsList.sool?reqPage="+(pageStart-1)+"&selNo="+selNo+"'><</a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/goodsList.sool?reqPage="+pageStart+"&selNo="+selNo+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/goodsList.sool?reqPage="+pageStart+"&selNo="+selNo+"'>></a>";
		page += "<a href='/seller/goodsList.sool?reqPage="+totalPage+"&selNo="+selNo+"'>마지막</a>";
	}
	gp.setPage(page);
	return gp;
}

@Transactional
public int insertGoods(Goods g) {
	return dao.insertGoods(g);
}	

public int searchLastGoods() {
	return dao.searchLastGoods();
}

@Transactional
public int insertImage(Image i) {
	return dao.insertImage(i);
}

public Goods selectOneGoods(int gdsNo) {
	return dao.selectOneGoods(gdsNo);
}

public Funding selectOneFunding(int fundNo) {
	return dao.selectOneFunding(fundNo);
}

public Image selectOneImage(int No,int num) {
	return dao.selectOneImage(No, num);
}

public Score selectOneScore(int gdsNo) {
	return dao.selectOneScore(gdsNo);
}

@Transactional
public int addClass(Class cls) {
	return dao.addClass(cls);
}

@Transactional
public int modifyGoods(Goods g) {
	return dao.modifyGoods(g);
}

@Transactional
public int deleteGoods(int temp) {
	return dao.deleteGoods(temp);
}

public Class getClassInfo(int classNo) {
	return dao.getClassInfo(classNo);
}

//마이페이지 - 판매자 정보 수정
@Transactional
public int mypageUpdateSeller(Seller seller) {
	return dao.mypageUpdateSeller(seller);
}

@Transactional
public int deleteClass(int value) {
	
	return dao.deleteClass(value);
}

@Transactional
public int modifyClass(Class c) {
	return dao.modifyClass(c);
}


public FundingPage selectAllFunding(int reqPage, int selNo) {
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo", selNo);
	System.out.println(start);
	System.out.println(end);
	ArrayList<Funding> list = dao.selectAllFunding(pageNo);
	FundingPage fp = new FundingPage();
	fp.setList(list);
	int totalCount = dao.FundingTotalCount(selNo);//총 게시물 수
	int totalPage = 0;
	if(totalCount%numPerPage==0) {
		totalPage = totalCount/numPerPage;
	}else {
		totalPage = (totalCount/numPerPage)+1;
	}
	int pageNaviSize = 5;
	String page = "";
	int pageStart = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
	if(pageStart>1) {
		page += "<a href='/seller/fundingList.sool?reqPage=1&selNo="+selNo+"'>처음</a>";
		page += "<a href='/seller/fundingList.sool?reqPage="+(pageStart-1)+"&selNo="+selNo+"'><</a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/fundingList.sool?reqPage="+pageStart+"&selNo="+selNo+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/fundingList.sool?reqPage="+pageStart+"&selNo="+selNo+"'>></a>";
		page += "<a href='/seller/fundingList.sool?reqPage="+totalPage+"&selNo="+selNo+"'>머지막</a>";
	}
	fp.setPage(page);
	return fp;
}

public ArrayList<FundingGoods> selectAllFundingGoods(int fundNo) {
	return dao.selectAllFundingGoods(fundNo);
}

@Transactional
public int insertFunding(Funding f) {
	return dao.insertFunding(f);
}

public int searchLastFunding() {
	return dao.searchLastFunding();
}

@Transactional
public int deleteFunding(String[] tokens) {
	int result = 1;
	for(int i=0;i<tokens.length;i++) {
		int rt = dao.deleteFunding(Integer.parseInt(tokens[i]));
		if(rt>0) {
			result = 1;
		}else {
			result = 0;
		}
	}
	return result;
}

@Transactional
public int insertFundingGoods(FundingGoods fg) {
	return dao.insertFundingGoods(fg);
}

@Transactional
public int updateGdsDStatus(int gdsLNo, int gdsDStatus) {
	HashMap<String, Integer> gdsInfo = new HashMap<String, Integer>();
	gdsInfo.put("gdsLNo", gdsLNo);
	gdsInfo.put("gdsDStatus", gdsDStatus);
	int result1 = dao.updateGdsDStatus(gdsInfo);
	int purNo = 0;
	int result2 = 1;
	if(gdsDStatus==2) {
		purNo = dao.selectPurNo(gdsLNo);
		result2 = dao.updatePurchaseStatus(purNo);
	}
	return result1+result2;
}

public GoodsListPage selectAllGoodsList(int reqPage, int selNo) {
	GoodsListPage glp = new GoodsListPage();
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo",selNo);
	ArrayList<GoodsList> gdsList = dao.selectAllGoodsList(pageNo);
	glp.setGdsList(gdsList);
	int totalCount = dao.goodsListTotalCount(selNo);//총 게시물 수
	int totalPage = 0;
	if(totalCount%numPerPage==0) {
		totalPage = totalCount/numPerPage;
	}else {
		totalPage = (totalCount/numPerPage)+1;
	}
	int pageNaviSize = 5;
	String page = "";
	int pageStart = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
	if(pageStart>1) {
		page += "<a href='/seller/mypage2.sool?reqPage=1&selNo="+selNo+"'>처음</a>";
		page += "<a href='/seller/mypage2.sool?reqPage="+(pageStart-1)+"&selNo"+selNo+"'><</a>";
	}
	System.out.println(totalCount);
	System.out.println(totalPage);
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/mypage2.sool?reqPage="+pageStart+"&selNo="+selNo+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/mypage2.sool?reqPage="+pageStart+"&selNo="+selNo+"'>></a>";
		page += "<a href='/seller/mypage2.sool?reqPage="+totalPage+"&selNo="+selNo+"'>마지막</a>";
	}
	glp.setGdsPage(page);
	return glp;
}

public FundingListPage selectAllFundingList(int reqPage, int selNo) {
	FundingListPage flp = new FundingListPage();
	int numPerPage = 10;
	int start = (reqPage-1)*numPerPage+1;
	int end = reqPage*numPerPage;
	HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
	pageNo.put("start", start);
	pageNo.put("end", end);
	pageNo.put("selNo",selNo);
	ArrayList<FundingList> fndList = dao.selectAllFundingList(pageNo);
	System.out.println(fndList);
	flp.setFndList(fndList);
	int totalCount = dao.fundingListTotalCount(selNo);//총 게시물 수
	int totalPage = 0;
	if(totalCount%numPerPage==0) {
		totalPage = totalCount/numPerPage;
	}else {
		totalPage = (totalCount/numPerPage)+1;
	}
	int pageNaviSize = 5;
	String page = "";
	int pageStart = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
	if(pageStart>1) {
		page += "<a href='/seller/mypage3.sool?reqPage=1&selNo="+selNo+"'>처음</a>";
		page += "<a href='/seller/mypage3.sool?reqPage="+(pageStart-1)+"&selNo="+selNo+"'><</a>";
	}
	for(int i=0;i<pageNaviSize;i++) {
		if(reqPage != pageStart) {
			page += "<a href='/seller/mypage3.sool?reqPage="+pageStart+"&selNo="+selNo+"' class='num'>"+pageStart+"</a>";
		}else {
			page += "<span class='sel'>"+pageStart+"</span>";
		}
		pageStart++;
		if(pageStart>totalPage) {
			break;
		}
	}
	if(pageStart<=totalPage) {
		page += "<a href='/seller/mypage3.sool?reqPage="+pageStart+"&selNo="+selNo+"'>></a>";
		page += "<a href='/seller/mypage3.sool?reqPage="+totalPage+"&selNo="+selNo+"'>마지막</a>";
	}
	flp.setFndPage(page);
	return flp;
}

@Transactional
public int updateFndDStatus(int fndDNo, int fndDStatus) {
	HashMap<String, Integer> fndInfo = new HashMap<String, Integer>();
	fndInfo.put("fndDNo", fndDNo);
	fndInfo.put("fndDStatus", fndDStatus);
	int result = dao.updateFndDStatus(fndInfo);
	return result;
}

public Seller checkId(Seller s) {
	return dao.checkId(s);
}
public int selectSellerGoods(int selNo) {
	return dao.selectSellerGoods(selNo);
}

public int selectSellerSales(int selNo) {
	return dao.selectSellerSales(selNo);
}









}
