package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.AdminVO;

// DB와 직접 연결하는 클래스 + mybatis를 통해서 데이터 베이스 쿼리문을 관리
@Repository("adminDao")
public class AdminDaoImpl implements AdminDAO{

	// mybatis를 쓰기전에는 해당 클래스에 문자열의 형태인 sql문장을 만들어야한다
	// String sql="";
	// mybatis를 사용하면 xml 파일을 통해서 DB연결 관리를 도움받는다
	// config.xml(설정) & mapper.xml(쿼리) 이 필요하다
	// mybatis를 스프링에 등록하기 위해서는 pom.xml을 통해서 외부의 라이브러리를 추가해야함
	// bean이라는 객체로 설정 및 xml 파일을 추가 >> root-context.xml 에서 설정
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public int saveBoard(AdminVO vo) {
		
		return mybatis.insert("adminDao.insertPost",vo);
		
	}

	@Override
	public List<AdminVO> getBoard(AdminVO vo) {
		
		List<AdminVO> aList = mybatis.selectList("adminDao.getViewList", vo);
		return aList;
	}
	

	@Override
	public void updateBoard(AdminVO vo) {
		mybatis.update("adminDao.newBoardSave",vo);
		
	}



	@Override
	public void deleteBoard(AdminVO vo) {
		mybatis.delete("adminDao.adminBoardDelete",vo);
		
	}

	@Override
	public List<AdminVO> getBoardList() {
		List<AdminVO> bList = mybatis.selectList("adminDao.getBoardList");
		return bList;
	}

	
	@Override
	public int insertComment(AdminVO vo) {
		return mybatis.insert("adminDao.insertComment",vo);
	}

	@Override
	public List<AdminVO> getCommentList() {
		List<AdminVO> cList = mybatis.selectList("adminDao.getCommentList");
		return cList;
	}

	@Override
	public int updateCnt(AdminVO vo) {
		
		return mybatis.update("adminDao.updateCnt",vo);
		
	}

	@Override
	public void commentDelete(AdminVO vo) {
		mybatis.delete("adminDao.commentDelete",vo);
		
	}

	@Override
	public void commentEdit(AdminVO vo) {
		mybatis.update("adminDao.commentEdit",vo);
		
	}

	@Override
	public void secretMode(AdminVO vo) {
		mybatis.update("adminDao.secretMode",vo);
		
	}

	@Override
	public int getTotalPage() {
		
		AdminVO vo = mybatis.selectOne("adminDao.getTotalPage");
		 return vo.getTotalRecCount();		 
	}

	@Override
	public List<AdminVO> getListPage(AdminVO vo) {
		List<AdminVO> pList = mybatis.selectList("adminDao.getListPage", vo);
		return pList;
	}

	@Override
	public List<AdminVO> badCommentList(AdminVO vo) {
		List<AdminVO> cList = mybatis.selectList("adminDao.badCommentList",vo);
		return cList;
	}

	@Override
	public int saveReport(AdminVO vo) {
		return mybatis.insert("adminDao.saveReport",vo);
	}

	@Override
	public void reportRemove(AdminVO vo) {
		mybatis.delete("adminDao.reportRemove",vo);
		
	}

	@Override
	public int getTotalReportPage() {
		AdminVO vo = mybatis.selectOne("adminDao.getTotalReportPage");
		 return vo.getTotalRecCount();	
	}

	@Override
	public List<AdminVO> getAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	
	

	
	
}
