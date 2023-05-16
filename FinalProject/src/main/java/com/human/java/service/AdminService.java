package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.AdminDAO;
import com.human.java.domain.AdminVO;


public interface AdminService {
	
		public int saveBoard(AdminVO vo);

		void updateBoard(AdminVO vo);

		void deleteBoard(AdminVO vo);

		List<AdminVO> getBoard(AdminVO vo);

		public List<AdminVO> getAllList();

		public List<AdminVO> getBoardList(AdminVO vo);

		int insertComment(AdminVO vo);

		public List<AdminVO> getCommentList(AdminVO vo);

		public List<AdminVO> updateCnt(AdminVO vo);

		public void commentDelete(AdminVO vo);

		public void commentEdit(AdminVO vo);

		public List<AdminVO> adminBoardView(AdminVO vo);

		public int getTotalPage();

		List<AdminVO> getListPage(AdminVO vo);

		public List<AdminVO> badCommentList(AdminVO vo);

		public int saveReport(AdminVO vo);

		public void reportRemove(AdminVO vo);

		public int getTotalReportPage();




		



	
	
}

