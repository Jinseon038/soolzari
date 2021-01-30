package com.soolzari.shop.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soolzari.shop.admin.model.service.AcceptService;
import com.soolzari.shop.admin.model.vo.Accept;
import com.soolzari.shop.admin.model.vo.AcceptPage;
import com.soolzari.shop.client.model.vo.FundingGoods;
import com.soolzari.shop.client.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.Funding;

@Controller
public class AcceptController {
	@Autowired
	private AcceptService service;
	
	@RequestMapping("/accept.sool")
	public String accept(int type, int reqPage, Model model) {
		AcceptPage ap = service.selectAll(type, reqPage);
		if(type == 2) {//펀딩 상품 가져오기
			ArrayList<FundingGoods> fundingGoods = service.fundingGoods();			
			
			for(Accept f : ap.getList()) {
				ArrayList<FundingGoods> fglist = new ArrayList<FundingGoods>();
				for(FundingGoods fg : fundingGoods) {
					if(fg.getFundNo() == f.getAcceptNo()) {
						fglist.add(fg);				
					}	
					f.setFundingGoods(fglist);
				}
			}
		}
//		if(type == 1) {
//			ap = service.selectAllGoods(reqPage);
//		}else if(type == 2) {
//			ap = service.selectAllFunding(reqPage);
//		}else if(type == 3) {
//			ap = service.selectAllClass(reqPage);
//		}
		model.addAttribute("list", ap.getList());
		model.addAttribute("page", ap.getPage());
		model.addAttribute("type", type);
		return "admin/accept";
	}
	
	@RequestMapping("/acceptAll.sool")
	public String acceptAll(int type, Model model) {
		int result = service.acceptAll(type);
		if(result>0) {
			model.addAttribute("msg", "승인 성공");
		}else {
			model.addAttribute("msg", "승인 실패");
		}
		model.addAttribute("loc", "/accept.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/acceptPart.sool")
	public String acceptPart(int type, String acceptNo, Model model) {
		int result = service.acceptPart(type, acceptNo);
		if(result>0) {
			model.addAttribute("msg", "승인 성공");
		}else {
			model.addAttribute("msg", "승인 실패");
		}
		model.addAttribute("loc", "/accept.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/acceptOne.sool")
	public String acceptOne(int type, int acceptNo, Model model) {
		int result = service.acceptOne(type, acceptNo);
		if(result>0) {
			model.addAttribute("msg", "승인 성공");
		}else {
			model.addAttribute("msg", "승인 실패");
		}
		model.addAttribute("loc", "/accept.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/rejectAll.sool")
	public String rejectAll(int type, Model model) {
		int result = service.rejectAll(type);
		if(result>0) {
			model.addAttribute("msg", "거절 성공");
		}else {
			model.addAttribute("msg", "거절 실패");
		}
		model.addAttribute("loc", "/accept.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/rejectPart.sool")
	public String rejectPart(int type, String acceptNo, Model model) {
		int result = service.rejectPart(type, acceptNo);
		if(result>0) {
			model.addAttribute("msg", "거절 성공");
		}else {
			model.addAttribute("msg", "거절 실패");
		}
		model.addAttribute("loc", "/accept.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/rejectOne.sool")
	public String rejectOne(int type, int acceptNo, Model model) {
		int result = service.rejectOne(type, acceptNo);
		if(result>0) {
			model.addAttribute("msg", "거절 성공");
		}else {
			model.addAttribute("msg", "거절 실패");
		}
		model.addAttribute("loc", "/accept.sool?type="+type+"&reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/searchAccept.sool")
	public String searchAccept(String startDate, String endDate, int type, int reqPage, String search, Model model) {
		AcceptPage ap = service.searchAccept(startDate, endDate, type, search, reqPage);
		model.addAttribute("list", ap.getList());
		model.addAttribute("page", ap.getPage());
		model.addAttribute("type", type);
		return "admin/accept";
	}
}
