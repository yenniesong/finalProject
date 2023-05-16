package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.human.java.domain.AdminVO;


public interface AdminDAO {


	public int saveBoard(AdminVO vo);
	
	List<AdminVO> getBoard(AdminVO vo);
	
	void updateBoard(AdminVO vo);
 
	void deleteBoard(AdminVO vo);
   
   
	public List<AdminVO> getBoardList();
	   
	public int insertComment(AdminVO vo);

	public List<AdminVO> getCommentList();


	public int updateCnt(AdminVO vo);

	public List<AdminVO> getAllList();

	public void commentDelete(AdminVO vo);

	public void commentEdit(AdminVO vo);


	public void secretMode(AdminVO vo);

	public int getTotalPage();

	public List<AdminVO> getListPage(AdminVO vo);

	public List<AdminVO> badCommentList(AdminVO vo);

	public int saveReport(AdminVO vo);

	public void reportRemove(AdminVO vo);

	public int getTotalReportPage();





	

	
	
}
