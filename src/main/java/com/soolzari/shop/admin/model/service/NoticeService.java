package com.soolzari.shop.admin.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soolzari.shop.admin.model.dao.NoticeDao;
import com.soolzari.shop.admin.model.vo.Notice;
import com.soolzari.shop.admin.model.vo.NoticeClient;
import com.soolzari.shop.admin.model.vo.NoticePage;


@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public NoticePage selectAllNotice(int reqPage) {		
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		HashMap<String, Integer> pageNo = new HashMap<String, Integer>();
		pageNo.put("start", start);
		pageNo.put("end", end);
		ArrayList<Notice> list = dao.selectAllNotice(pageNo);
		NoticePage np = new NoticePage();
		np.setList(list);
		int totalCount = dao.totalCount();//총 게시물 수
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
			page += "<a href='/notice/list.sool?reqPage=1'><<</a>";
			page += "<a href='/notice/list.sool?reqPage="+(pageStart-1)+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageStart) {
				page += "<a href='/notice/list.sool?reqPage="+pageStart+"' class='num'>"+pageStart+"</a>";
			}else {
				page += "<span class='sel'>"+pageStart+"</span>";
			}
			pageStart++;
			if(pageStart>totalPage) {
				break;
			}
		}
		if(pageStart<=totalPage) {
			page += "<a href='/notice/list.sool?reqPage="+pageStart+"'>></a>";
			page += "<a href='/notice/list.sool?reqPage="+totalPage+"'>>></a>";
		}
		np.setPage(page);
		return np;
	}
	
	@Transactional
	public int insertNotice(Notice n) {
		return dao.insertNotice(n);
	}
	
	@Transactional
	public int deleteNotice(String noticeNo) {
		StringTokenizer st = new StringTokenizer(noticeNo, "/");
		int result = 0;
		while(st.hasMoreTokens()) {
			int notNo = Integer.parseInt(st.nextToken());
			result = dao.deleteNotice(notNo);
			if(result == 0) {
				break;
			}
		}
		return result;
	}
	
	@Transactional
	public int deleteNotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}

	public NoticePage findNotice(String date, String type, String search, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Date d = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(d);
    	if(date.equals("week")) {
        	cal.add(Calendar.DATE, -7);
        	String week = sdf.format(cal.getTime());
        	map.put("week", week);
    	}else if(date.equals("month")) {
    		cal.add(Calendar.MONTH, -1);
        	String month = sdf.format(cal.getTime());
        	map.put("month", month);
    	}
		map.put("type", type);//title, content, writer
		map.put("search", search);
		int numPerPage = 10;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.findNotice(map);
		NoticePage np = new NoticePage();
		np.setList(list);
		int totalCount = dao.totalNoticeSearch(map);//총 게시물 수
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
			page += "<a href='/notice/find.sool?reqPage=1&date="+date+"&type="+type+"&search"+search+"'><<</a>";
			page += "<a href='/notice/find.sool?reqPage="+(pageStart-1)+"&date="+date+"&type="+type+"&search"+search+"'><</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(reqPage != pageStart) {
				page += "<a href='/notice/find.sool?reqPage="+pageStart+"&date="+date+"&type="+type+"&search"+search+"' class='num'>"+pageStart+"</a>";
			}else {
				page += "<span class='sel'>"+pageStart+"</span>";
			}
			pageStart++;
			if(pageStart>totalPage) {
				break;
			}
		}
		if(pageStart<=totalPage) {
			page += "<a href='/notice/find.sool?reqPage="+pageStart+"&date="+date+"&type="+type+"&search"+search+"'>></a>";
			page += "<a href='/notice/find.sool?reqPage="+totalPage+"&date="+date+"&type="+type+"&search"+search+"'>>></a>";
		}
		np.setPage(page);
		return np;
	}

	public Notice selectOneNotice(int noticeNo) {
		return dao.selectOneNotice(noticeNo);
	}
	
	@Transactional
	public int updateNotice(Notice n) {
		return dao.updateNotice(n);
	}

	@Transactional
	public int updateCount(int noticeNo) {
		return dao.updateCount(noticeNo);
	}

	public NoticeClient selectNoticeClient(int noticeNo) {
		return dao.selectNoticeClient(noticeNo);
	}
}
