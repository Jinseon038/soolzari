package com.soolzari.shop.client.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.client.model.dao.ClientDao;
import com.soolzari.shop.client.model.vo.Class_List;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Fund;
import com.soolzari.shop.client.model.vo.FundReview;
import com.soolzari.shop.client.model.vo.Goods;
import com.soolzari.shop.client.model.vo.Reservation;
import com.soolzari.shop.client.model.vo.Subscribe;
import com.soolzari.shop.seller.model.vo.Seller;

@Service
public class ClientService {

	@Autowired
	ClientDao dao;
	public int insertClient(Client c) {
		return dao.insertClient(c);
	}
	public Client selectOneClient(Client c) {
		return dao.selectOneClient(c);
	}
	public Client checkId(Client c) {
		return dao.checkId(c);
	}
	public int reservation(Reservation r) {
		
		return dao.reservation(r);
	}
	public ArrayList<Reservation> getClassInfo() {
		return dao.getClassInfo();
	}

	public ArrayList<Goods> getGoods(String searchWord) {
		return dao.getGoods(searchWord);
	}
	
	public ArrayList<Subscribe> setSubscribe(Subscribe sub) {
		return dao.setSubscribe(sub);
	}
	public int setUsergrade(String id, int grade) {
	return dao.setUsergrade(id,grade);
	}
	public ArrayList<Class_List> checkUser(int session, int classNo) {
		
		return dao.checkUser(session,classNo);
	}
	public int setClassList(Class_List c) {
		// TODO Auto-generated method stub
		return dao.setClassList(c);
	}
	public String findSeller(int selNo) {
		return dao.findSeller(selNo);
	}

	public int getClassNo(String title, String date) {
		
		return dao.getClassNo(title,date);
	}
	public int sumPerson(int classNo) {
		
		return dao.sumPerson(classNo);
	}
	public String getEnrollClass(int classNo) {
		
		return dao.getEnrollClass(classNo);
	}
	public ArrayList<Goods> getTakju() {
		return dao.getTakju();
	}
	public ArrayList<Goods> getChoengju() {
		return dao.getChoengju();
	}
	public ArrayList<Goods> getSpirits() {
		// TODO Auto-generated method stub
		return dao.getSpirits();
	}
	public ArrayList<Goods> getWine() {
		// TODO Auto-generated method stub
		return dao.getWine();
	}
	public ArrayList<Goods> getFruit() {
		// TODO Auto-generated method stub
		return dao.getFruit();
	}
	public int checkUsergrade(String id) {
		
		return dao.checkUsergrade(id);
	}
	public String searchId(String name, String email) {
		return dao.searchId(name,email);
	}
	public String searchPw(String userId, String useremail) {
		return dao.searchPw(userId,useremail);
	}
	public ArrayList<Fund> getFund() {
		
		return dao.getFund();
	}
	
	public int updateClient(Client c) {
		return dao.updateClient(c);
	}
	public int insertComment(FundReview f) {
		
		return dao.insertComment(f);
	}
	public int modifyComment(FundReview f) {
		
		return dao.modifyComment(f);
	}
	public int deleteComment(FundReview f) {
		
		return dao.deleteComment(f);
	}
	public int insertComment1(FundReview f) {
		return dao.insertComment1(f);
	}
	public ArrayList<Goods> getNewProduct() {
	
		return dao.getNewProduct();
	}

	
	
	
}