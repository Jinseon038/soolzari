package com.soolzari.shop.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soolzari.shop.admin.model.dao.AcceptDao;
import com.soolzari.shop.admin.model.vo.Accept;
import com.soolzari.shop.admin.model.vo.AcceptPage;
import com.soolzari.shop.client.model.vo.FundingGoods;
import com.soolzari.shop.client.model.vo.Goods;

@Service
public class AcceptService {
	@Autowired
	private AcceptDao dao;

	public AcceptPage selectAll(int type, int reqPage) {
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Accept> list = new ArrayList<Accept>();
		int totalCount = 0;
		if(type == 1) {
			list = dao.selectAllGoods(map);
			totalCount = dao.totalGoods();
		}else if(type == 2) {
			list = dao.selectAllFunding(map);
			totalCount = dao.totalFunding();
		}else {
			list = dao.selectAllClass(map);
			totalCount = dao.totalClass();
		}
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo>1) {
			page += "<a href='/accept.sool?type="+type+"&reqPage=1'><<</a>";
			page += "<a href='/accept.sool?type="+type+"&reqPage="+(pageNo-1)+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageNo) {
				page += "<a href='/accept.sool?type="+type+"&reqPage="+pageNo+"' class='num'>"+pageNo+"</a>";
			}else {
				page += "<span class='sel'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			page += "<a href='/accept.sool?type="+type+"&reqPage="+pageNo+"'>></a>";
			page += "<a href='/accept.sool?type="+type+"&reqPage="+totalPage+"'>>></a>";
		}
		AcceptPage ap = new AcceptPage();
		ap.setList(list);
		ap.setPage(page);
		return ap;
	}

	@Transactional
	public int acceptAll(int type) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("type", type);
		return dao.accept(map);
	}
	
	@Transactional
	public int acceptPart(int type, String acceptNo) {
		StringTokenizer st = new StringTokenizer(acceptNo, "/");
		int result = 0;
		while(st.hasMoreTokens()) {
			int accNo = Integer.parseInt(st.nextToken());
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("type", type);
			map.put("acceptNo", accNo);
			result = dao.accept(map);
			if(result == 0) {
				break;
			}
		}
		return result;
	}

	@Transactional
	public int acceptOne(int type, int acceptNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("type", type);
		map.put("acceptNo", acceptNo);
		return dao.accept(map);
	}

	@Transactional
	public int rejectAll(int type) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("type", type);
		return dao.reject(map);
	}

	@Transactional
	public int rejectPart(int type, String acceptNo) {
		StringTokenizer st = new StringTokenizer(acceptNo, "/");
		int result = 0;
		while(st.hasMoreTokens()) {
			int accNo = Integer.parseInt(st.nextToken());
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("type", type);
			map.put("acceptNo", accNo);
			result = dao.reject(map);
			if(result == 0) {
				break;
			}
		}
		return result;
	}

	@Transactional
	public int rejectOne(int type, int acceptNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("type", type);
		map.put("acceptNo", acceptNo);
		return dao.reject(map);
	}

	public AcceptPage searchAccept(String startDate, String endDate, int type, String search, int reqPage) {
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("search", search);
		map.put("type", type);
		ArrayList<Accept> list = new ArrayList<Accept>();
		int totalCount = 0;
		if(type == 1) {
			list = dao.searchGoods(map);
			totalCount = dao.searchTotal(map);
		}else if(type == 2) {
			list = dao.searchFunding(map);
			totalCount = dao.searchTotal(map);
		}else {
			list = dao.searchClass(map);
			totalCount = dao.searchTotal(map);
		}
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;
		}
		int pageNaviSize = 5;
		String page = "";
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		if(pageNo>1) {
			page += "<a href='/searchAccept.sool?type="+type+"&reqPage=1&startDate="+startDate+"&endDate="+endDate+"&search="+search+"'><<</a>";
			page += "<a href='/searchAccept.sool?type="+type+"&reqPage="+(pageNo-1)+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageNo) {
				page += "<a href='/searchAccept.sool?type="+type+"&reqPage="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"' class='num'>"+pageNo+"</a>";
			}else {
				page += "<span class='sel'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			page += "<a href='/searchAccept.sool?type="+type+"&reqPage="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"'>></a>";
			page += "<a href='/searchAccept.sool?type="+type+"&reqPage="+totalPage+"&startDate="+startDate+"&endDate="+endDate+"&search="+search+"'>>></a>";
		}
		AcceptPage ap = new AcceptPage();
		ap.setList(list);
		ap.setPage(page);
		return ap;
	}

	public ArrayList<FundingGoods> fundingGoods() {
		return dao.fundingGoods();
	}
	
}
