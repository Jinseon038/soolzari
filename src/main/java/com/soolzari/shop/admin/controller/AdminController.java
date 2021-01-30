package com.soolzari.shop.admin.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.soolzari.shop.admin.model.service.AdminService;
import com.soolzari.shop.admin.model.vo.Goods;
import com.soolzari.shop.admin.model.vo.Qrv;
import com.soolzari.shop.admin.model.vo.Sool;
import com.soolzari.shop.admin.model.vo.UserPage;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Funding;
import com.soolzari.shop.client.model.vo.Qna;
import com.soolzari.shop.client.model.vo.QnaPageData;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("/faq.sool")
	public String faq() {
		return "admin/faq";
	}
	
	@RequestMapping("/faqClient.sool")
	public String faqClient() {
		return "client/faq";
	}
	
	@RequestMapping("/admin.sool")
	public String admin(Model model, HttpSession session, @SessionAttribute(required=false) String sessionId) {
		if(sessionId != null && sessionId.equals("admin")) {
			HashMap<String, Integer> user = service.selectUserChart();
			model.addAttribute("user", user);
			
	    	HashMap<String, Integer> classes = service.selectClass();
	    	model.addAttribute("classes", classes);
	    	Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("M");
			String now = sdf.format(date);//1월
			Calendar cal = Calendar.getInstance();
	    	cal.setTime(date);
	    	cal.add(Calendar.MONTH, -1);
	    	String prev = sdf.format(cal.getTime());//12월
	    	cal.setTime(date);
	    	cal.add(Calendar.MONTH, -2);
	    	String pprev = sdf.format(cal.getTime());//11월
	    	cal.setTime(date);
	    	cal.add(Calendar.MONTH, +1);
	    	String next = sdf.format(cal.getTime());//2월
	    	cal.setTime(date);
	    	cal.add(Calendar.MONTH, +2);
	    	String nnext = sdf.format(cal.getTime());//3월
	    	model.addAttribute("now", now);
	    	model.addAttribute("prev", prev);
	    	model.addAttribute("pprev", pprev);
	    	model.addAttribute("next", next);
	    	model.addAttribute("nnext", nnext);
	    	
	    	HashMap<String, Integer> funding = service.selectFunding();
	    	model.addAttribute("funding", funding);
	    	
	    	Funding bestFunding = service.selectBestFunding();
	    	DecimalFormat formatter = new DecimalFormat("###,###");
	    	if(bestFunding != null) {
	    		String fundTotalMoney = formatter.format(bestFunding.getFundTotalMoney());
	    		model.addAttribute("fundTotalMoney", fundTotalMoney);
	    	}
	    	model.addAttribute("bestFunding", bestFunding);
	    	
	    	HashMap<String, Object> goods = service.selectGoods();
	    	model.addAttribute("goods", goods);
	    	
	    	Goods bestGoods = service.bestGoods();
	    	model.addAttribute("bestGoods", bestGoods);
	    	System.out.println(bestGoods);
	    	System.out.println(bestFunding);
			return "admin/admin";
		}
		else {
			model.addAttribute("msg", "관리자만 접근 가능합니다");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectSool.sool", produces = "application/json;charset=utf-8")
	public String selectSool() {
		ArrayList<Sool> list = service.selectSool();//매달 술 종류 판매량
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/user.sool")
	public String user(int type, int reqPage, int order, Model model) {//1=고객, 2=판매자
		UserPage up = service.selectAllUser(type, reqPage, order);
		model.addAttribute("list", up.getList());
		model.addAttribute("page", up.getPage());
		model.addAttribute("type", type);
		return "admin/user";
	}
	
	@RequestMapping("/changeOne.sool")
	public String changeOne(int type, int userNo, int grade, Model model) {
		int result = service.changeOne(userNo, grade);
		if(result>0) {
			model.addAttribute("msg", "구독 등급 변경 성공");
		}else {
			model.addAttribute("msg", "구독 등급 변경 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1&order=1");
		return "common/msg";
	}
	
	@RequestMapping("/changeAll.sool")
	public String changeAll(int type, String userNo, String grade, Model model) {
		int result = service.changeAll(type, userNo, grade);
		if(result>0) {
			model.addAttribute("msg", "구독 등급 변경 성공");
		}else {
			model.addAttribute("msg", "구독 등급 변경 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1&order=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteOne.sool")
	public String deleteOne(int type, int userNo, Model model) {
		int result = service.deleteOne(type, userNo);
		if(result>0) {
			model.addAttribute("msg", "탈퇴 성공");
		}else {
			model.addAttribute("msg", "탈퇴 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1&order=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteAll.sool")
	public String deleteAll(int type, String userNo, Model model) {
		int result = service.deleteAll(type, userNo);
		if(result>0) {
			model.addAttribute("msg", "탈퇴 성공");
		}else {
			model.addAttribute("msg", "탈퇴 실패");
		}
		model.addAttribute("loc", "/user.sool?type="+type+"&reqPage=1&order=1");
		return "common/msg";
	}
	
	@RequestMapping("/searchUser.sool")
	public String searchUser(String startDate, String endDate, int type, int reqPage, String searchType, String search, Model model) {
		UserPage up = service.searchUser(startDate, endDate, type, searchType, search, reqPage);
		model.addAttribute("list", up.getList());
		model.addAttribute("page", up.getPage());
		model.addAttribute("type", type);
		model.addAttribute("search", search);
		model.addAttribute("searchType", searchType);
		return "admin/user";
	}
	
	@RequestMapping("/qna.sool")
	public String qna(int reqPage, Model model) {
		QnaPageData qpd = service.selectAllQna(reqPage);
		model.addAttribute("list", qpd.getList());
		model.addAttribute("page", qpd.getPageNavi());
		Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(date);
		model.addAttribute("today", today);
		return "admin/qna";
	}
	
	@RequestMapping("/qnaView.sool")
	public String qnaView(int qnaNo, int qnaAns, Model model) {
		Qna qna = service.selectOneQna(qnaNo);
		if(qnaAns == 1) {//답변 있는 상태
			Qrv qrv = service.selectOneQrv(qnaNo);
			model.addAttribute("qrv", qrv);
		}
		model.addAttribute("qna", qna);
		return "admin/qnaView";
	}
	
	@RequestMapping("/qnaViewClient.sool")
	public String qnaViewClient(int qnaNo, int qnaAns, Model model) {
		Qna qna = service.selectOneQna(qnaNo);
		if(qnaAns == 1) {//답변 있는 상태
			Qrv qrv = service.selectOneQrv(qnaNo);
			model.addAttribute("qrv", qrv);
		}
		model.addAttribute("qna", qna);
		return "client/qnaViewC";
	}
	
	@RequestMapping("/deleteQna.sool")
	public String deleteQna(String qnaNo, Model model) {
		int result = service.deleteQna(qnaNo);
		if(result>0) {
			model.addAttribute("msg", "문의사항 삭제 성공");
		}else {
			model.addAttribute("msg", "문의사항 삭제 실패");
		}
		model.addAttribute("loc", "/qna.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/searchQna.sool")
	public String searchQna(String date, String type, int reqPage, String search, Model model) {
		QnaPageData qpd = service.searchQna(date, type, search, reqPage);
		Date d = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(d);
		model.addAttribute("list", qpd.getList());
		model.addAttribute("page", qpd.getPageNavi());
		model.addAttribute("today", today);
		return "admin/qna";
	}
	
	@RequestMapping("/insertQrv.sool")
	public String insertQrv(Qrv qrv, Model model) {
		int result = service.insertQrv(qrv);
		if(result>0) {
			model.addAttribute("msg", "답변 등록 성공");
		}else {
			model.addAttribute("msg", "답변 등록 실패");
		}
		model.addAttribute("loc", "/qna.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/updateQrv.sool")
	public String updateQrv(Qrv qrv, Model model) {
		int result = service.updateQrv(qrv);
		if(result>0) {
			model.addAttribute("msg", "답변 수정 성공");
		}else {
			model.addAttribute("msg", "답변 수정 실패");
		}
		model.addAttribute("loc", "/qnaView.sool?qnaNo="+qrv.getQnaNo()+"&qnaAns=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteQrv.sool")
	public String deleteQrv(int qnaNo, int qrvNo, Model model) {
		int result = service.deleteQrv(qnaNo, qrvNo);
		if(result>0) {
			model.addAttribute("msg", "문의사항 삭제 성공");
		}else {
			model.addAttribute("msg", "문의사항 삭제 실패");
		}
		model.addAttribute("loc", "/qna.sool?reqPage=1");
		return "common/msg";
	}
}
