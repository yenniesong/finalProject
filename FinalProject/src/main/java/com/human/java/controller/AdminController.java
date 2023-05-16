package com.human.java.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.java.*;
import com.human.java.dao.AdminDaoImpl;
import com.human.java.domain.*;
import com.human.java.service.AdminService;
import com.human.java.service.AdminServiceImpl;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/{url}")
	public String viewPage(@PathVariable String url) {

		return url;
	}
	
	
	@RequestMapping("main.do")
	public String mainList(AdminVO vo, Model model) {
		
		List<AdminVO> bList = adminService.getBoardList(vo);
	
		model.addAttribute("list", bList);
		
		return "main";
		
	}
	
	
	@RequestMapping("saveBoard")
	public String saveBoard(AdminVO vo) {
		
		adminService.saveBoard(vo);
		
		return "redirect:/adminBoard.do";
		
	}
	
	@RequestMapping("updateCnt")
	public String updateCnt(AdminVO vo, Model model) {
		
				
		List<AdminVO> aList = adminService.updateCnt(vo);
		model.addAttribute("list", aList);
		
		return "adminBoardView";
		
	}
	

	@RequestMapping("adminBoard.do")
	public String getBoardList(AdminVO vo, Model model
			, @RequestParam(value = "pageNum", defaultValue = "1")int pageNum
			, @RequestParam(value = "groupNum", defaultValue = "1")int groupNum
			) {
		
		
		// 게시물 총 갯수
		int totalRecCount = adminService.getTotalPage();
		// vo 변수에 넣어주기
		vo.setTotalRecCount(totalRecCount);
		
		// 총 갯수에 따른 페이지 총 갯수 (전체 게시물 / 10) -> 10씩 보여지게
		vo.setPageTotalCount(totalRecCount / vo.getCountPerPage());
		
		if(totalRecCount%vo.getCountPerPage() > 0 ) { 
			// 나눴을때 나머지가 있으면 페이지 한개 더 만들어서 10개가 다 없어도 게시물 나오게 +1 해줌
			vo.setCountPerPage(vo.getCountPerPage()+1);
		}
		
		// 전체 레코드를 검색해 온다면
		// 현재 페이지 번호에 의한 레코드를 검색
		// 한페이지에 표현할 게시글 수를 13로 잡았을 경우
		// 1번 : 1~ 13 행
		// 2번 : 14 ~ 26 행
		// 3번 : 26 ~ 39 행
			
		// 맨 처음 번호 (보여줄 게시글수 countPerPage)
		int firstRow = (pageNum-1) * vo.getCountPerPage()+1; 
		// 맨 마지막 번호
		int endRow = pageNum * vo.getCountPerPage();
		
		vo.setFirstRow(firstRow);
		vo.setEndRow(endRow);
		
		List<AdminVO> aList = adminService.getListPage(vo);
		
		// 페이지갯수 = 전체 데이터의 갯수 / 보여줄갯수
		// pageTotalCount = 전체 데이터의 갯수 / 페이지별 보여줄 갯수
		// pageTotalCount = totalRecCount /countPerPage
		// 데이터베이스 담긴 적체 레코드 갯수
		int totalCountGroup = vo.getPageTotalCount() / vo.getTotalCountPageGroup();
		
		vo.setTotalCountGroup(totalCountGroup);
		
		if( ( vo.getPageTotalCount() % vo.getTotalCountPageGroup() ) > 0) {
			vo.setTotalCountGroup(vo.getTotalCountGroup()+1);
			// 100 / 13 = 7.xx 
			// 99 / 13 = 7.xx
			// 98 / 13 = 7.xx
			// 97 / 13 = 7.xx
			// 90 / 13 = 6.xx
		}
				
		model.addAttribute("list", aList);
		model.addAttribute("totalCountGroup",vo.getTotalCountGroup());
		
		int firstPageNo = (groupNum-1) * vo.getTotalCountPageGroup() + 1;
		int endPageNo = groupNum * vo.getTotalCountPageGroup();
		
		if( endPageNo >= vo.getPageTotalCount() ) endPageNo = vo.getPageTotalCount() ;
		   
		model.addAttribute("startPageNum" , firstPageNo);
		model.addAttribute("endPageNum" , endPageNo);
		
		
		model.addAttribute("startGroupNum", groupNum-1);
		
		model.addAttribute("endGroupNum", groupNum+1);
		if( groupNum == vo.getTotalCountGroup() ) {
			model.addAttribute("endGroupNum", 0);
		}
		
		return "adminBoard";
	
	}
	
	@RequestMapping("commentAction")
	public String insertComment(AdminVO vo, Model model) {
		
		adminService.insertComment(vo);
		model.addAttribute("postId",vo.getPostId());

		return "redirect:/adminBoardView";
		
	}
	
	@RequestMapping("getCommentList")
	@ResponseBody
	public HashMap<String, List<AdminVO>> getCommentList(AdminVO vo) {
		List<AdminVO> cList = adminService.getCommentList(vo);
	
	HashMap<String, List<AdminVO>> map = new HashMap<String, List<AdminVO>>();
	 map.put("commentList", cList);
	
	return map;
	
	}
		
	@RequestMapping("commentDelete")
	public String commentDelete(AdminVO vo, Model model) {
		adminService.commentDelete(vo);
		model.addAttribute("postId",vo.getPostId());
		return "redirect:/adminBoardView";
		
	}
	
	@RequestMapping("commentEdit")
	public String commentEdit(AdminVO vo, Model model) {
		adminService.commentEdit(vo);
		model.addAttribute("postId",vo.getPostId());
		return "redirect:/adminBoardView";
		
	}
	
	@RequestMapping("adminBoardView")
	public String adminBoardView(AdminVO vo, Model model) {
		
		
		List<AdminVO> aList = adminService.adminBoardView(vo);
		model.addAttribute("list", aList);
		
		
		return "adminBoardView";
		
	}
	
	@RequestMapping("badComment")
	public String badCommentList(AdminVO vo, Model model
			, @RequestParam(value = "pageNum", defaultValue = "1")int pageNum
			, @RequestParam(value = "groupNum", defaultValue = "1")int groupNum) {
	
				vo.setCountPerPage(5);
		
				int totalRecCount = adminService.getTotalReportPage();
				vo.setTotalRecCount(totalRecCount);
				
				vo.setPageTotalCount(totalRecCount / vo.getCountPerPage());
				
				if(totalRecCount%vo.getCountPerPage() > 0 ) { 
					vo.setCountPerPage(vo.getCountPerPage()+1);
				}
				
				
				int firstRow = (pageNum-1) * vo.getCountPerPage()+1; 
				int endRow = pageNum * vo.getCountPerPage();
				
				vo.setFirstRow(firstRow);
				vo.setEndRow(endRow);
				
				List<AdminVO> cList = adminService.badCommentList(vo);
					
				model.addAttribute("list", cList);
				
				
				int totalCountGroup = vo.getPageTotalCount() / vo.getTotalCountPageGroup();
				
				vo.setTotalCountGroup(totalCountGroup);
				
				if( ( vo.getPageTotalCount() % vo.getTotalCountPageGroup() ) > 0) {
					vo.setTotalCountGroup(vo.getTotalCountGroup()+1);
				}
						
				model.addAttribute("totalCountGroup",vo.getTotalCountGroup());
				
				int firstPageNo = (groupNum-1) * vo.getTotalCountPageGroup() + 1;
				int endPageNo = groupNum * vo.getTotalCountPageGroup();
				
				if( endPageNo >= vo.getPageTotalCount() ) endPageNo = vo.getPageTotalCount() ;
				   
				model.addAttribute("startPageNum" , firstPageNo);
				model.addAttribute("endPageNum" , endPageNo);
				
				
				model.addAttribute("startGroupNum", groupNum-1);
				
				model.addAttribute("endGroupNum", groupNum+1);
				if( groupNum == vo.getTotalCountGroup() ) {
					model.addAttribute("endGroupNum", 0);
				}
			
		return "badComment";
	
	}
	
	@RequestMapping("adminBoardDelete")
	public String adminBoardDelete(AdminVO vo, Model model) {
		adminService.deleteBoard(vo);
		
		model.addAttribute("postId",vo.getPostId());
		return "redirect:/adminBoard.do";
		
	}
	
	@RequestMapping("newBoardSave")
		public String newBoardSave(AdminVO vo, Model model) {
		adminService.updateBoard(vo);
		
		model.addAttribute("postId",vo.getPostId());
		return "redirect:/adminBoardView";
		
	}
	
	@RequestMapping("reportAction")
	public String saveReport(AdminVO vo) {
		adminService.saveReport(vo);
		
		return "redirect:/adminBoard.do";
		
	}
	
	@RequestMapping("reportRemove")
	public String reportRemove(AdminVO vo, Model model) {
		adminService.reportRemove(vo);
		
		model.addAttribute("badId",vo.getBadId());
		return "redirect:/badComment";
		
	}
	
	
	
}
