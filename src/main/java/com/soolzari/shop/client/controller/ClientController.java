package com.soolzari.shop.client.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.soolzari.shop.client.model.service.ClientService;
import com.soolzari.shop.client.model.vo.Class_List;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Fund;
import com.soolzari.shop.client.model.vo.FundReview;
import com.soolzari.shop.client.model.vo.Goods;
import com.soolzari.shop.client.model.vo.KakaoAccessToken;
import com.soolzari.shop.client.model.vo.KakaoUserInfo;
import com.soolzari.shop.client.model.vo.NaverLoginBO;
import com.soolzari.shop.client.model.vo.Reservation;
import com.soolzari.shop.client.model.vo.Subscribe;


@Controller
public class ClientController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	
	
	@Autowired
	ClientService service;
	
	
	
	@RequestMapping("/login.sool")
	public String login(Model model, HttpSession session) {
		
		System.out.println("로그인 컨트롤러");
		return "client/login";
	}
	@RequestMapping("/reservation.sool")
	public String reservation(Model model, HttpSession session) {
		
		System.out.println("예약페이지로 이동");
		return "client/reservation";
	}
	@RequestMapping("/reservation_intro.sool")
	public String reservationIntro(Model model, HttpSession session) {
		
		System.out.println("예약 안내 페이지로 이동");
		return "client/reservation_introduce";
	}
	
	
	@RequestMapping(value="/loginNaver.sool", method= {RequestMethod.GET, RequestMethod.POST})
	public void loginNaver(Model model, HttpSession session, HttpServletResponse httpServletResponse) throws IOException {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		/* 네이버 로그인 페이지로 이동*/
		httpServletResponse.sendRedirect(naverAuthUrl);  
	
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, Client c) throws IOException, ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	System.out.println(response_obj);
	//response의 nickname값 파싱
	String nickname = (String)response_obj.get("nickname");
	String name=(String)response_obj.get("name");
	String id=(String)response_obj.get("id");
	String mobile=(String)response_obj.get("mobile");
	String birthYear=(String)response_obj.get("birthyear");
	String birthday=(String)response_obj.get("birthday");
	String email=(String)response_obj.get("email");
	System.out.println("이름 : "+name);
	System.out.println(nickname);
	System.out.println(id);
	System.out.println(mobile);
	String birthday1=birthday.replace('-',' ').replaceAll(" ","");
	System.out.println(birthYear+birthday1);
	System.out.println(email);
	c.setClientAge(birthYear+birthday1);
	c.setClientName(name);
	c.setClientId(email);
	c.setClientEmail(email);
	c.setClientTel(mobile);

	//4.파싱 닉네임 세션으로 저장
	if(name!=null) {
		Calendar cal = Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		int adultYear=year-20;
		model.addAttribute("msg","네이버 로그인 성공");

		if(Integer.parseInt(birthYear)>adultYear) {
			model.addAttribute("msg","성인만 가입가능합니다.");
			model.addAttribute("loc","/");
		}else {
			int result = service.insertClient(c);
			session.setAttribute("sessionClient", c);
			session.setAttribute("sessionId", c);
			session.setAttribute("sessionName",name); //세션 생성
			model.addAttribute("result", apiResult);
			model.addAttribute("name",name);
			model.addAttribute("loc","/");
		}


	}else {
		model.addAttribute("msg","네이버 로그인 실패");
		model.addAttribute("loc","client/login");
	}
	
	
	return "common/msg";
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session,Model model)throws IOException {
	System.out.println("여기는 logout");
	session.invalidate();
	model.addAttribute("msg","로그아웃 성공");
	model.addAttribute("loc","/");
	return "common/msg";
	}
	
	
	@RequestMapping(value="/kakaologin", produces="application/json", method=RequestMethod.GET)
	  public String kakaologin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session, Model model,
			  HttpServletResponse response, Client c) throws IOException{
		
		System.out.println("kakao code: "+code);
		  JsonNode accessToken;
		  
	        // JsonNode트리형태로 토큰받아온다
	        JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
	        // 여러 json객체 중 access_token을 가져온다
	        accessToken = jsonToken.get("access_token");
	 
	        System.out.println("access_token : " + accessToken);

	        // access_token을 통해 사용자 정보 요청
	        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
	 
	        // Get id
	        String id = userInfo.path("id").asText();
	        String name = null;
	        String email = null;
	 System.out.println("userInfo : "+userInfo);
	        // 유저정보 카카오에서 가져오기 Get properties
	        JsonNode properties = userInfo.path("properties");
	        JsonNode kakao_account = userInfo.path("kakao_account");
	  
	        String age_range=kakao_account.path("age_range").asText();
	        name = properties.path("nickname").asText();
	        email = kakao_account.path("email").asText();
	        System.out.println("properties :"+properties);
	        System.out.println("kakao account:"+kakao_account);
	        System.out.println("id : " + id);
	        System.out.println(kakao_account.findPath("birthday").asText());
	        age_range=age_range.substring(0,2);
	        System.out.println(age_range);
	        c.setClientId(email);
	        c.setClientEmail(email);
	        c.setClientName(name);
	        c.setClientAge(age_range+"대");
	        System.out.println("name : " + name);
	        System.out.println("email : " + email);
	        System.out.println("age : "+age_range);
	        if(name!=null && email!=null) {
	        	  model.addAttribute("msg","카카오 로그인 성공");
	        	  if(Integer.parseInt(age_range)>=20) {
	        			int result = service.insertClient(c);
	        			model.addAttribute("loc","/");
	        			session.setAttribute("sessionId", c);
	        			session.setAttribute("sessionClient", c);
		        		session.setAttribute("sessionName",name); //세션 생성
	        	  }else {
	        		  model.addAttribute("msg","성인만 가입가능합니다.");
	        		  model.addAttribute("loc","/");
	        	  }
	        
	        		
	        }else {
	        	  model.addAttribute("msg","카카오 로그인 실패");
	        		model.addAttribute("loc","/");
	        }
	      

	        return "common/msg";
	}

	@RequestMapping("/register.sool")
	public String join(Client c , Model model) {
		System.out.println("register");
		System.out.println(c.getClientAge());
		c.setClientAddr(c.getClientAddr()+" "+c.getClientAddr1()+" "+c.getClientAddr2()+" "+c.getClientAddr3());
		int result = service.insertClient(c);
		
		if(result>0) {
			model.addAttribute("msg","회원가입 성공");
			model.addAttribute("msg","회원가입 기념 3000 포인트 지급");
		}else {
			model.addAttribute("msg","회원가입 실패");
			
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("/loginCheck.sool")
	public String loginCheck(Client c, HttpSession session, Model model) {
		
		System.out.println(c.getClientId());
		System.out.println(c.getClientPw());
		Client client=service.selectOneClient(c);

		System.out.println("Controller : "+client);
		if(client!=null) {
			session.setAttribute("sessionClient", client);
			session.setAttribute("sessionId", client.getClientId());
			session.setAttribute("sessionNo", client.getClientNo());
			session.setAttribute("sessionName", client.getClientName());
			session.setAttribute("sessionEmail", client.getClientEmail());
			session.setAttribute("sessionPhone", client.getClientTel());
			session.setAttribute("sessionAddr", client.getClientAddr());
			session.setAttribute("sessionPoint", client.getClientPoint());
			session.setAttribute("sessionSubscribe", client.getClientRank());
			session.setAttribute("sessionClient", client);
			System.out.println(client.getClientRank());
			if(client.getClientRank()==10) {
				return "redirect:/admin.sool";
			}
			model.addAttribute("msg","로그인 성공");
			model.addAttribute("loc","/");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요");
			model.addAttribute("loc","/login.sool");
		}

		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckId.sool")
	public int CheckId(Client c) {

		Client client=service.checkId(c);
	
		if(client!=null) {
			return 0;
		}else {
			return 1;
		}
		
	}

	@RequestMapping("/searchId.sool")
	public String searchId(Model model, String userName, String useremail) {
		
		System.out.println(userName);
		System.out.println(useremail);
		String id=service.searchId(userName,useremail);
		System.out.println(id);
		if(id!=null) {
			model.addAttribute("result",true);
		}else {
			model.addAttribute("result",false);
		}
		
		model.addAttribute("id",id);
		return "client/resultSearchId";
		
	}
	
	@RequestMapping("/searchPw.sool")
	public String searchPw(Model model, String userId, String useremail) {
		
		System.out.println(userId);
		System.out.println(useremail);
		String pw=service.searchPw(userId,useremail);
		
		System.out.println(pw);
		if(pw!=null) {
			
			model.addAttribute("result",true);
		}else {
			model.addAttribute("result",false);
		}
		model.addAttribute("id",userId);
	
		return "client/resultSearchPw";
		
	}
	
	@RequestMapping("/setPw.sool")
	public String setPw(Model model, String userPw, String userId, Client c) {
		
		System.out.println(userPw);
		System.out.println(userId);
		c.setClientPw(userPw);
		c.setClientId(userId);
		int result=service.updateClient(c);
		
		if(result>0) {
			model.addAttribute("msg","비밀번호 재설정 완료되었습니다.");
		}else {

			model.addAttribute("msg","비밀번호 재설정 실패했습니다.");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	
	/* 등록되어 있는 클래스들 가져옴*/
	@ResponseBody
	@RequestMapping("/getClassDB.sool")
	public ArrayList<Reservation> getClassInfo(Model model) {
		System.out.println("getClassDB");
		ArrayList<Reservation> list = service.getClassInfo();
		
		System.out.println("list:"+list);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/findSeller.sool" ,produces = "application/text; charset=UTF-8" )
	public String findSeller(int selNo){
		
		System.out.println("findSeller");
		System.out.println(selNo);
		String seller=service.findSeller(selNo);
		
		System.out.println("seller : "+seller);
		return seller;
		
	}
	
//	@ResponseBody
//	@RequestMapping(value="/checkPerson.sool" ,produces = "application/text; charset=UTF-8" )
//	public String checkPerson(int person){
//		
//		System.out.println("checkPerson");
//		System.out.println(person);
//		String seller=service.checkPerson(person);
//		
//		System.out.println("seller : "+seller);
//		return seller;
//		
//	}
	@RequestMapping("/basicSool.sool")
	public String basicSool(Model model, String searchWord) {
		
		
		
		System.out.println("hihi");
		System.out.println(searchWord);
		ArrayList<Goods> list=service.getGoods(searchWord);
		
		System.out.println("goodslist : "+list );
	

	
		model.addAttribute("list",list);
	
		return "client/takju";
		
	}
	
	@RequestMapping("/takju.sool")
	public String takju(Model model) {
		System.out.println("takju");
		
		ArrayList<Goods> list=service.getTakju();
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "client/takju";
	}
	@RequestMapping("/cheongju.sool")
	public String cheongju(Model model) {
		System.out.println("cheongju");
		ArrayList<Goods> list=service.getChoengju();
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "client/cheongju";
	}
	@RequestMapping("/spirits.sool")
	public String spirits(Model model) {
		System.out.println("spirits");
		ArrayList<Goods> list=service.getSpirits();
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "client/spirits";
	}
	@RequestMapping("/wine.sool")
	public String wine(Model model) {
		System.out.println("wine");
		ArrayList<Goods> list=service.getWine();
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "client/wine";
	}
	@RequestMapping("/fruit.sool")
	public String fruit(Model model) {
		System.out.println("fruit");
		ArrayList<Goods> list=service.getFruit();
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "client/fruit";
	}
	/* 이미 예약해서 예약불가능 한지 아니면 예약가능한지 판별*/
	@ResponseBody
	@RequestMapping(value="/checkUser.sool", produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public String checkUser(Model model, int classNo, int session) {
		System.out.println("checkuser");
		System.out.println("classNo : "+classNo);
		System.out.println("clientNo" +session);
	
		JsonObject obj = new JsonObject();
		ArrayList<Class_List> list=service.checkUser(session,classNo);
		System.out.println("list : "+list);
		
		if(list.size()!=0) {
			System.out.println("here");
			obj.addProperty("msg", "이미 예약하신 클래스입니다");
	
		}else {
			obj.addProperty("msg", "예약 가능합니다.");
		}
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPerson.sool",  produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public String checkPerson(Model model, int person,int sessionNo,String title,int classNo) {
		System.out.println("checkPerson");
		System.out.println(person);
		System.out.println(sessionNo);
		System.out.println(title);
		System.out.println(classNo);
		int classNo1=Integer.parseInt(String.valueOf(classNo));
		System.out.println(classNo1);
		JsonObject obj = new JsonObject();
		String date=service.getEnrollClass(classNo); // 해당클래스의 날짜를 가져온다
		int person1=service.getClassNo(title,date); //클래스 허용인원
		int result=service.sumPerson(classNo1); //클래스 예약한 인원
		int resultPerson=person+result;  //이미 클래스 등록한 사람수 + 예약하려고 하는 사람수
		int okPerson=person1-result;  //예약 가능한인원
		System.out.println(person1);
		System.out.println(result);
		System.out.println(okPerson);
		if(okPerson<0) {
			okPerson=okPerson*-1;
		}
		if(resultPerson>person1) {
			System.out.println("here");
			
			obj.addProperty("person", okPerson);
			obj.addProperty("msg", "가능 인원이 초과입니다.");
	
		}else {
			obj.addProperty("msg", "가능합니다.");
		}
		
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping("/setClassListDB.sool")
	public String setClassList(Model model, int eventDB, int session,int person, String today,Class_List c){
		System.out.println("setClassDB");

		c.setClassNo(eventDB);
		c.setClassPayment(today);
		c.setClassPerson(person);
		c.setClientNo(session);
		
			int result = service.setClassList(c);
			
			if(result>0) {
				model.addAttribute("msg","클래스 리스트 삽입 성공");
			
			}else {
				model.addAttribute("msg","클래스 리스트 삽입 실패");
				
			}
		
		

		return "common/msg";
	}
	
	@RequestMapping("/subscribe.sool")
	public String subscribe(Model model) {
		System.out.println("subscribe");
		return "client/subscribe";
	}
	
	@ResponseBody
	@RequestMapping(value="/getNewProduct.sool",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public ArrayList<Goods> getNewProduct(Model model) {
		System.out.println("getNew");
		ArrayList<Goods> newList=service.getNewProduct();
		System.out.println(newList);
		if(newList!=null) {
			model.addAttribute("list",newList);
			model.addAttribute("loc","/");
		}else {
			System.out.println("상품비었음");
		}
		return newList;
	}
	
	@RequestMapping("/fund.sool")
	public String fund(Model model) {
		
		

		ArrayList<Fund> list=service.getFund();
		
		System.out.println("fundlist : "+list );
		

		System.out.println(list.size());
		model.addAttribute("list",list);
	
		return "client/fund";
	}
	
	@RequestMapping("/setSubscribe.sool")
	public String setSubscribe(Model model, String name, int price, Subscribe sub) {
		System.out.println("setSubscribe");
		System.out.println("name:"+name);
	
		sub.setSubscribeName(name);
		sub.setSubscribePrice(price);
		
		if(name.equals("술자리 구독세트 A")) {
			sub.setSubscribeDept("4인이 적당");
		}else {
			sub.setSubscribeDept("8인이 적당");
		}
		ArrayList<Subscribe> list=service.setSubscribe(sub);
		
		model.addAttribute("list",list);
		return "client/subscribe";
	}
	@ResponseBody
	@RequestMapping(value="/checkUsergrade.sool",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public String checkUsergrade(String id) {
		JsonObject obj = new JsonObject();
		int result=service.checkUsergrade(id);
		
		System.out.println(result);
		if(result==1) {
			obj.addProperty("msg", "구독 A세트 신청중입니다. 취소하시고 다시 신청해주세요.");
		}else if(result==2){
			obj.addProperty("msg", "구독 B세트 신청중입니다. 취소하시고 다시 신청해주세요.");
		}else {
			obj.addProperty("msg", "신청가능합니다.");
		}
		return new Gson().toJson(obj);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/setUsergrade.sool",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public String setUsergrade(String id, Model model,String name) {
		JsonObject obj = new JsonObject();
		System.out.println("name : "+id);
		System.out.println("subsname:"+name);
		int grade=0;
		if(name.equals("술자리 구독세트 A")) {
			grade=1;
		}else {
			grade=2;
		}
		System.out.println(grade);
		
		int result=service.setUsergrade(id,grade);
		System.out.println(result);
		if(result>0) {
		
			obj.addProperty("msg", "구독 신청 완료되었습니다.");
		}else {
			obj.addProperty("msg","구독 신청 실패했습니다.");
		}
		return new Gson().toJson(obj);
		
		
	}
	
	//펀드리뷰
	@RequestMapping("/insertComment.sool")
	public String insertComment(Model model, int fundNo, int commentWriter, String commentContent, String commentWriterName,FundReview f) {
		
		System.out.println("insertComment");
		System.out.println(fundNo);
		System.out.println(commentWriter);

		System.out.println(commentContent);
		
		f.setCommentWriter(commentWriter);
		f.setCommentContent(commentContent);
		f.setFundNo(fundNo);
		f.setCommentWriterName(commentWriterName);

		int result=service.insertComment(f);
				if(result>0) {
					model.addAttribute("msg","댓글 삽입 성공");
					model.addAttribute("loc","/client/oFundingDetail.sool?fundNo="+fundNo);
				}else {
					model.addAttribute("msg","댓글 삽입 실패");
					model.addAttribute("loc","/client/oFundingDetail.sool?fundNo="+fundNo);
				}
			
			

			return "common/msg";		
		
	}
	//상품리뷰
	@RequestMapping("/insertComment1.sool")
	public String insertComment1(Model model, int goodNo, int commentWriter, @RequestParam(value="commentRate", defaultValue="null")int commentRate,String commentContent, String commentWriterName,FundReview f) {
		
		System.out.println("insertComment1");
		System.out.println(goodNo);
		System.out.println(commentWriter);
		System.out.println(commentRate);
		System.out.println(commentContent);
		
		f.setCommentWriter(commentWriter);
		f.setCommentContent(commentContent);
		f.setGoodNo(goodNo);
		f.setCommentWriterName(commentWriterName);
		f.setCommentRate(commentRate);
		int result=service.insertComment1(f);
				if(result>0) {
					model.addAttribute("msg","댓글 삽입 성공");
					model.addAttribute("loc","/client/oGoodsDetail.sool?gdsNo="+goodNo);
				}else {
					model.addAttribute("msg","댓글 삽입 실패");
					model.addAttribute("loc","/client/oGoodsDetail.sool?gdsNo="+goodNo);
				}
			
			

			return "common/msg";		
		
	}
	@ResponseBody
	@RequestMapping(value="/modifyComment.sool",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public String modifyComment(Model model, int reviewNo, String commentContent, FundReview f) {
		JsonObject obj = new JsonObject();
		System.out.println("modifyComment");
		System.out.println(reviewNo);

		System.out.println(commentContent);
		
		f.setReviewNo(reviewNo);
		f.setCommentContent(commentContent);

		int result=service.modifyComment(f);
		if(result>0) {
			
			obj.addProperty("msg", "댓글 수정 완료되었습니다.");
		}else {
			obj.addProperty("msg","댓글 수정 실패했습니다.");
		}
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteComment.sool" ,produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public String deleteComment(int reviewNo, String commentContent, FundReview f) {
		JsonObject obj = new JsonObject();
		System.out.println("modifyComment");
		System.out.println(reviewNo);

		System.out.println(commentContent);
		
		f.setReviewNo(reviewNo);
		f.setCommentContent(commentContent);
		int result=service.deleteComment(f);
		if(result>0) {
			
			obj.addProperty("msg", "댓글 삭제 완료되었습니다.");
		}else {
			obj.addProperty("msg","댓글 삭제 실패했습니다.");
		}
		return new Gson().toJson(obj);
	}
}

	
	
