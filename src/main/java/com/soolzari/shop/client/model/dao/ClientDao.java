package com.soolzari.shop.client.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.client.model.vo.Class_List;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Fund;
import com.soolzari.shop.client.model.vo.FundReview;
import com.soolzari.shop.client.model.vo.Goods;
import com.soolzari.shop.client.model.vo.Reservation;
import com.soolzari.shop.client.model.vo.Subscribe;
import com.soolzari.shop.seller.model.vo.Seller;

@Repository
public class ClientDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertClient(Client c) {
		
		return sqlSession.insert("client.insertClient",c);
	}

	public Client selectOneClient(Client c) {
		System.out.println("loginDAO");
		System.out.println("DAO C : "+c);
		System.out.println(c.getClientId());
		System.out.println(c.getClientPw());
		return sqlSession.selectOne("client.selectOneClient",c);
	}

	public Client checkId(Client c) {
	
		return sqlSession.selectOne("client.checkId",c);
	}

	public int reservation(Reservation r) {
		
		return sqlSession.insert("client.reservationClass",r);
	}

	public ArrayList<Reservation> getClassInfo() {
		
		List<Reservation> list =sqlSession.selectList("client.getClassInfo");
		return (ArrayList<Reservation>)list;
	}





	public ArrayList<Goods> getGoods(String searchWord) {
		System.out.println("searchdAO" +searchWord);
		List<Goods> list =sqlSession.selectList("client.getGoods",searchWord);
		return (ArrayList<Goods>)list;
	}

	

	public ArrayList<Subscribe> setSubscribe(Subscribe sub) {
		List<Subscribe> list =sqlSession.selectList("client.setSubscribe",sub);
		return (ArrayList<Subscribe>)list;
	}

	public int setUsergrade(String id, int grade) {
		HashMap<String, Object> map=new HashMap<String,Object>();
		map.put("id",id);
		map.put("grade",grade);
		return sqlSession.update("client.setUsergrade",map);
	}

	public ArrayList<Class_List> checkUser(int session, int classNo) {
		HashMap <String, Integer> map = new HashMap<String,Integer>();
		map.put("clientNo", session);
		map.put("classNo", classNo);
		
		System.out.println("dao");
	
		System.out.println(session);
		System.out.println(classNo);
		List<Class_List> list=  sqlSession.selectList("client.checkUser",map);
		return (ArrayList<Class_List>)list;
	}

	public int setClassList(Class_List c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("client.setClass_list",c);
	}

	public String findSeller(int selNo) {
		
		return sqlSession.selectOne("client.findSeller",selNo);
	}



	public int getClassNo(String title, String date) {
		HashMap <String, String> map = new HashMap<String,String>();
		map.put("title", title);
		map.put("date", date);
		
		int person= sqlSession.selectOne("client.getClassNo",map);
		return person;
	}

	public int sumPerson(int classNo) {
		System.out.println("sumPersonDao : "+classNo);
		
		return sqlSession.selectOne("client.sumPerson",classNo);
	}

	public String getEnrollClass(int classNo) {
		
		return sqlSession.selectOne("client.getEnroll",classNo);
	}

	public ArrayList<Goods> getTakju() {
		List<Goods> list =sqlSession.selectList("client.getTakju");
		return (ArrayList<Goods>)list;
	}

	public ArrayList<Goods> getChoengju() {
		List<Goods> list =sqlSession.selectList("client.getCheongju");
		return (ArrayList<Goods>)list;
	}

	public ArrayList<Goods> getSpirits() {
		List<Goods> list =sqlSession.selectList("client.getSpirits");
		return (ArrayList<Goods>)list;
	}

	public ArrayList<Goods> getWine() {
		List<Goods> list =sqlSession.selectList("client.getWine");
		return (ArrayList<Goods>)list;
	}

	public ArrayList<Goods> getFruit() {
		List<Goods> list =sqlSession.selectList("client.getFruit");
		return (ArrayList<Goods>)list;
	}

	public int checkUsergrade(String id) {
		
		return sqlSession.selectOne("client.checkUsergrade",id);
	}

	public String searchId(String name, String email) {
			HashMap<String,Object> map=new HashMap<String ,Object>();
			map.put("name",name);
			map.put("email",email);
		String id= sqlSession.selectOne("client.searchId",map);
		return id;
	}

	public String searchPw(String userId, String useremail) {
		HashMap<String,Object> map=new HashMap<String ,Object>();
		map.put("id",userId);
		map.put("email",useremail);
	String pw= sqlSession.selectOne("client.searchPw",map);
	return pw;
	}

	public ArrayList<Fund> getFund() {
		List<Fund> list =sqlSession.selectList("client.getFund");
		return (ArrayList<Fund>)list;
	}



	public int updateClient(Client c) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("id",c.getClientId());
		map.put("pw",c.getClientPw());
		int result=sqlSession.update("client.setPw",map);
		return result;
	}
	
	public int insertComment(FundReview f) {
		

		System.out.println(f.getCommentWriter());
		System.out.println(f.getFundNo());
		int result=sqlSession.insert("client.insertComment",f);
		return result;
		
	}

	public int modifyComment(FundReview f) {
		
		int result=sqlSession.update("client.modifyComment",f);
		return result;
	}

	public int deleteComment(FundReview f) {
		
		int result=sqlSession.delete("client.deleteCommnet",f);
		return result;
	}

	public int insertComment1(FundReview f) {
		int result=sqlSession.insert("client.insertComment1",f);
		return result;
	}

	public ArrayList<Goods> getNewProduct() {
		List<Goods> list =sqlSession.selectList("client.getNewProduct");
		return (ArrayList<Goods>)list;
	
	}

}
