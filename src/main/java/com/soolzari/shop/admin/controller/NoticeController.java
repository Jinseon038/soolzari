package com.soolzari.shop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.soolzari.shop.admin.model.service.NoticeService;
import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticeClient;
import com.soolzari.shop.admin.model.vo.NoticePage;


@RequestMapping("/notice")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/list.sool")
	public String noticeList(int reqPage, Model model) {
		NoticePage np = service.selectAllNotice(reqPage);
		Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(date);
		model.addAttribute("list", np.getList());
		model.addAttribute("page", np.getPage());
		model.addAttribute("today", today);
		return "admin/noticeList";
	}
	
	@RequestMapping("/listClient.sool")
	public String noticeListClient(int reqPage, Model model) {
		NoticePage np = service.selectAllNotice(reqPage);
		Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(date);
		model.addAttribute("list", np.getList());
		model.addAttribute("page", np.getPage());
		model.addAttribute("today", today);
		return "client/noticeListC";
	}
	
	@RequestMapping("/form.sool")
	public String noticeFrm(HttpSession session, @SessionAttribute(required=false) String sessionId, Model model) {
		if(sessionId != null && sessionId.equals("admin")) {
			return "admin/noticeFrm";
		}else {
			model.addAttribute("msg", "관리자만 접근 가능합니다");
			model.addAttribute("loc", "/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/find.sool")
	public String findNotice(String date, String type, String search, Model model, int reqPage) {
		NoticePage np = service.findNotice(date, type, search, reqPage);
		Date d = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(d);
		model.addAttribute("list", np.getList());
		model.addAttribute("page", np.getPage());
		model.addAttribute("today", today);
		return "admin/noticeList";
	}
	

	@RequestMapping("/findC.sool")
	public String findNoticeClient(String date, String type, String search, Model model, int reqPage) {
		NoticePage np = service.findNotice(date, type, search, reqPage);
		Date d = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String today = sdf.format(d);
		model.addAttribute("list", np.getList());
		model.addAttribute("page", np.getPage());
		model.addAttribute("today", today);
		return "client/noticeListC";
	}
	
	@RequestMapping("/delete.sool")
	public String deleteNotice(String noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "공지사항 삭제 성공");
		}else {
			model.addAttribute("msg", "공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("/deleteNo.sool")//이미지 지워줘야함
	public String deleteNotice(int noticeNo, Model model) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "공지사항 삭제 성공");
		}else {
			model.addAttribute("msg", "공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}
	
	
	@RequestMapping("/insert.sool")
	public String insertNotice(Notice n, Model model) {
		int result = service.insertNotice(n);
		if(result>0) {
			model.addAttribute("msg", "공지사항 등록 성공");
		}else {
			model.addAttribute("msg", "공지사항 등록 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload.sool")
	public void insertImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			String root = request.getSession().getServletContext().getRealPath("/");
			String path = root+"resources/upload/";
			UUID uuid = UUID.randomUUID();
			String filename = file.getOriginalFilename();
			String extension = filename.substring(filename.lastIndexOf("."));
			String filepath = uuid+extension;
			File f = new File(path+filepath);
			if (!f.exists()) {
				f.mkdirs();
			}
			file.transferTo(f);
			out.println("/resources/upload/"+filepath);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/view.sool")
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "admin/noticeView";
	}
	
	@RequestMapping("/viewClient.sool")//3개 가져와야됨
	public String noticeClient(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		n.setNoticeCount(service.updateCount(noticeNo));
		NoticeClient nc = service.selectNoticeClient(noticeNo);
		model.addAttribute("n", n);
		model.addAttribute("nc", nc);
		return "client/noticeViewC";
	}
	
	@RequestMapping("/update.sool")
	public String updateNotice(Notice n, Model model) {
		int result = service.updateNotice(n);
		if(result>0) {
			model.addAttribute("msg", "공지사항 수정 성공");
		}else {
			model.addAttribute("msg", "공지사항 수정 실패");
		}
		model.addAttribute("loc", "/notice/list.sool?reqPage=1");
		return "common/msg";
	}

}
