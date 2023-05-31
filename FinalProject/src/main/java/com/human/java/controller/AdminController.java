package com.human.java.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.java.domain.AdminVO;
import com.human.java.service.AdminService;

// java를 효율적이로 코딩하기 위해 필요한 구조가 mvc 디자인 패턴
// M odel : 자바를 이용해서 db에 연결하는 과정에 대한 파일들, 로직
// V iew : jsp, html, cssm js등 화면에 출력하고자 하는 파일, 페이지
// C ontroller : 화면과 로직에 대해서 연결해주는 파일, 연결점
@Controller
public class AdminController {
	
	// @Autowired : 스프링의 빈 컨테이너 안에 있는 객체를 탐색해주는 키워드
	// 빈 컨테이너 : servlet-context.xml 에서 만든 객체들에서 UserDao객체명을 가진 bean을 가져와서 쓴다
	@Autowired
	private AdminService adminService;
	
	// 우리가 매번 new를 통한 인스턴스 생성 혹은 싱글톤패턴을 만들 필요가 없어짐
	
	// controller : 화면과 로직에 대해서 연결해주는 파일
	// getBookList : 화면에서 요청할 이름, 키워드, 호출이름
	// return : 요청이 들어오면 보여줄 파일, 화면, 페이지
	
	// 로직없이 단순 화면 변경을 담당하는 맵핑 메소드
	@RequestMapping("/{url}")
	public String viewPage(@PathVariable String url) {

		return url;
	}

		
	// ======================================================================//
	
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
		
		
		int totalRecCount = adminService.getTotalPage();
		vo.setTotalRecCount(totalRecCount);
		
		vo.setPageTotalCount(totalRecCount / vo.getCountPerPage());
		
		if(totalRecCount%vo.getCountPerPage() > 0 ) { 
			vo.setPageTotalCount(vo.getPageTotalCount()+1);
		}
		
	
			
		int firstRow = (pageNum-1) * vo.getCountPerPage()+1; 
		int endRow = pageNum * vo.getCountPerPage();
		
		vo.setFirstRow(firstRow);
		vo.setEndRow(endRow);
		
		
		
		List<AdminVO> aList = adminService.getListPage(vo);
		int totalCountGroup = vo.getPageTotalCount() / vo.getTotalCountPageGroup();
		
		vo.setTotalCountGroup(totalCountGroup);
		
		if( ( vo.getPageTotalCount() % vo.getTotalCountPageGroup() ) > 0) {
			vo.setTotalCountGroup(vo.getTotalCountGroup()+1);
			
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
