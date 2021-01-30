package com.soolzari.shop.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.admin.model.vo.Accept;
import com.soolzari.shop.client.model.vo.FundingGoods;

@Repository
public class AcceptDao {
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Accept> selectAllGoods(HashMap<String, Integer> map) {
		List<Accept> list = session.selectList("admin.selectAllGoods", map);
		return (ArrayList<Accept>)list;
	}

	public int totalGoods() {
		return session.selectOne("admin.totalGoods");
	}

	public ArrayList<Accept> selectAllFunding(HashMap<String, Integer> map) {
		List<Accept> list = session.selectList("admin.selectAllFunding", map);
		return (ArrayList<Accept>)list;
	}

	public int totalFunding() {
		return session.selectOne("admin.totalFunding");
	}

	public ArrayList<Accept> selectAllClass(HashMap<String, Integer> map) {
		List<Accept> list = session.selectList("admin.selectAllClass", map);
		return (ArrayList<Accept>)list;
	}

	public int totalClass() {
		return session.selectOne("admin.totalClass");
	}

	public int accept(HashMap<String, Integer> map) {
		return session.update("admin.accept", map);
	}

	public int reject(HashMap<String, Integer> map) {
		return session.update("admin.reject", map);
	}

	public ArrayList<Accept> searchGoods(HashMap<String, Object> map) {
		List<Accept> list = session.selectList("admin.searchGoods", map);
		return (ArrayList<Accept>)list;
	}

	public ArrayList<Accept> searchFunding(HashMap<String, Object> map) {
		List<Accept> list = session.selectList("admin.searchFunding", map);
		return (ArrayList<Accept>)list;
	}

	public ArrayList<Accept> searchClass(HashMap<String, Object> map) {
		List<Accept> list = session.selectList("admin.searchClass", map);
		return (ArrayList<Accept>)list;
	}

	public int searchTotal(HashMap<String, Object> map) {
		return session.selectOne("admin.searchTotal", map);
	}

	public ArrayList<FundingGoods> fundingGoods() {
		List<FundingGoods> list = session.selectList("admin.selectFundingGoods");
		return (ArrayList<FundingGoods>)list;
	}

}
