<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
    <%@page import="com.human.java.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    String admin = null;
    String student = null;
    String company = null;
    String educator = null;
    
    String userId = null;
    String userNick = null;
    
    if (session.getAttribute("admin") != null 
    		|| session.getAttribute("student") != null 
    		|| session.getAttribute("company") != null 
    		|| session.getAttribute("educator") != null) 
    		
    		{

    			admin = (String) session.getAttribute("admin"); 
    			student = (String) session.getAttribute("student"); 
    			company = (String) session.getAttribute("company"); 
    			educator = (String) session.getAttribute("educator");
    	  	  
    	    } else if ( session.getAttribute("userId") != null) {
    	    	userId = (String) session.getAttribute("userId"); 
    	    	
    	    } else if (session.getAttribute("userNick") != null) {
    	    	userNick = (String) session.getAttribute("userNick");
    	    }

    %> 
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	
	
  <title>Soupie - 공지사항</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
	
	
  <!-- Favicons -->
  <link href="../resources/img/soupie.png" rel="icon">
  <link href="../resources/img/soupie.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
  <!-- =======================================================
  * Template Name: Arsha - v4.3.0
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="main.do">Soupie</a></h1>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="main.do">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li class="dropdown"><a class="nav-link scrollto" href="#announcements"><span>Announcements</span><i class="bi bi-chevron-down"></i></a>
           <ul>
              <li><a href="adminBoard.do">공지사항</a></li>
              <li><a href="faqsBoard">FAQs</a></li>
            </ul>
          </li>
<!--           <li><a class="nav-link   scrollto" href="#portfolio">Portfolio</a></li> -->
<!--           <li><a class="nav-link scrollto" href="#team">Team</a></li> -->
<!--           <li><a class="nav-link scrollto" href="#contact">Contact</a></li> -->
           <%
    	if (userId == null) {
    	
    		%>
          <li class="dropdown"><a href="#"><span>Get online</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="login">로그인</a></li>
              <li><a href="join">회원가입</a></li>
            </ul>
          </li>
        <% } else {  if (admin.equals("admin") ) { %>
          <li class="dropdown"><a href="#"><span>Get online</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="badComment">신고글 관리페이지</a></li>
              <li><a href="logoutAction">로그아웃</a></li>
            </ul>
          </li>
          <% } else {// else안에 if %>
          <li class="dropdown"><a href="#"><span>Get online</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="myPage"><%=userNick%> 페이지</a></li>
              <li><a href="logoutAction">로그아웃</a></li>
            </ul>
          </li>
          <%} %>
          <%} %>
<!--           <li><a class="getstarted scrollto" href="#about">Get Started</a></li> -->
        </ul>
<!--         <i class="bi bi-list mobile-nav-toggle"></i> -->
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="main">Home</a></li>
          <li>Announcements</li>
        </ol>
        <h2>공지 사항</h2>

      </div>
    </section><!-- End Breadcrumbs -->

   <%
    	if (userId == null) {  // >>>> 로그인 안한상태
    	
    %>
    
<div class="board_wrap">
		
		<div class="board_view_wrap">
			<div class="board_view">
			<c:forEach items="${list}" var="post">
				<div class="title">
					${post.postTitle}
				</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd id="boardPostId">${post.postId}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>관리자</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${post.postDate}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${post.postCnt}</dd>
					</dl>
				</div>
				<div class="cont">
					${post.postContent}
				</div>
				 </c:forEach> 
			</div>
		</div>
		
	<div class="bt_wrap">
		<button type="button" class="boardList" id="listBtn">목록</button>
		</div>
	</div>

		
<% } else { if(admin.equals("admin") ) {  // >>>>> 관리자로 로그인 %>

<div class="board_wrap">
		
		
		<div class="board_view_wrap">
			<div class="board_view">
		<form id="adminBoardForm" class="adminBoardForm" method="post" >
				<c:forEach items="${list}" var="post">
				<div class="title">
					${post.postTitle}
					<input type="hidden" id="adminBoardFormId" name="postTitle" value="${post.postTitle}">
				</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd id="boardPostId">${post.postId}</dd>
						<input type="hidden" id="adminBoardFormId" name="postId" value="${post.postId}">
						<input type="hidden" id="adminBoardFormId" name="postPass" value="${post.postPass}">
						
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>관리자</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${post.postDate}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${post.postCnt}</dd>
					</dl>
				</div>
				<div class="cont">
					${post.postContent}
					<input type="hidden" id="adminBoardFormId" name="postContent" value="${post.postContent}">
				</div>
				 </c:forEach> 
		</form>	
				
			</div>
		</div>
		
						
		<div class="bt_wrap">
			<button type="button" class="boardList" id="listBtn">목록</button>
			<button type="button" class="editPost" id="editBtn">수정</button>
			<button type="button" class="deletePost" id="deleteBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
		</div>
		
		<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">공지사항</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        	게시물을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="deletePost" id="modalDeleteBtn">삭제하기</button>
			        <button type="button" class="cancleModal" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
		
	<!-- Comments Form -->
	<form name="comment-form" id="commentForm" method="post">
		<input type="hidden" id="formcommentId" name="commentId" value="">
		<input type="hidden" id="formpostId"name="postId" value="">
		<input type="hidden" id="formcontent"name="content" value="">
	<h3 id="com">Comments :</h3>
	<hr id="hr"/>
	</form>
	<div class="card my-4" id="commentBox">
		<h5 class="card-header" style="font-size: 15px; padding: 15px;">댓글을 남겨주세요 </h5>
		<div class="card-body">
			<form name="comment-form" id="frm" action="commentAction" method="post" autocomplete="off" >
				<div class="form-group">
				<div id="inputBox">
				<div id="inputBoxL">
					<input type="hidden" name="postId" id="hiddenPostId" value="${list.get(0).postId}">
					<label class="control-label" for="id" id="writerTop">작성자</label>
            		<input class="form-control" type="text" name="writer" id="writerBot" value="<%=userId%>"/>					
				</div>
				<div class="form-check form-switch" id="inputBoxR">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  					<label class="form-check-label" for="flexSwitchCheckChecked">비밀댓글</label>
            		<input type="hidden" name="secretCheck" id=switchCheck>
            	</div>
            	</div>
					<textarea name="content" class="form-control" rows="3" id="commentText" maxlength="500" style="margin-top: 15px;"></textarea>
				</div><br>
				<button type="button" class="submitComment" id="leavecomment">댓글등록</button>
			</form>
		</div>
	</div>
		
		
	</div>

	
<%} else {// else안에 if >>>> 회원이여서 로그인 한후 %> 
    	

<div class="board_wrap">
	
		
		<div class="board_view_wrap">
			<div class="board_view">
				<form action="reportAction" method="post" id="reportPost"  enctype="multipart/form-data">
				<c:forEach items="${list}" var="post">
				<div class="title" style="display: flex; justify-content: space-between; align-items: center;">
					<div id="posttitle" style="display: inline-block;">
					${post.postTitle}
					<input type="hidden" name="badTitle" id="badTitle" value="${post.postTitle}">
					</div>
					<div id=reportBtn style="display: inline-block; cursor: pointer;" 
					data-bs-toggle="modal" data-bs-target="#exampleModal" >
					<img style="width: 26px;" src="resources/img/ding.png" data-bs-toggle="tooltip" data-bs-placement="top"
			        data-bs-custom-class="custom-tooltip"
			        data-bs-title="게시글 신고하기">
					</div>
		
					<!-- Report Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">게시글 신고</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        	<div class="reportBoard_wrap">
			<div class="reportBoard">
				<table class="reportModalTable">
					<thead id="reportModalThead">
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<tr>
							<td>:</td>
							<td>:</td>
						</tr>
							
						<tr>
							<td>${post.postTitle}</td>
							<td>관리자</td>
						</tr>
					</thead>
					<tbody id="reportModalTbody">
						<tr>
							<th>신고사유 :</th>
							<input type="hidden" id="reportReason" name="reason" value="">
						</tr>
						<tr>
							<td><input type="text" id="noticeText" placeholder="여러사유에 해당될 경우, 대표적 사유 1개를 선택해 주세요." size="50" style="border:none; font-size: 12px;" disabled ></td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault1" value="불법광고">
  							<label class="form-check-label" for="flexRadioDefault1">
    						불법광고
							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault2" value="욕설/인신공격">
  							<label class="form-check-label" for="flexRadioDefault2">
    						욕설/인신공격
							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault3" value="도배성글/댓글반복">
  							<label class="form-check-label" for="flexRadioDefault3">
  							도배성글/댓글반복
  							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault4" value="개인정보노출/사생활침해">
  							<label class="form-check-label" for="flexRadioDefault4">
  							개인정보노출/사생활침해
  							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault5" value="음란성/선정성">
  							<label class="form-check-label" for="flexRadioDefault5">
  							음란성/선정성
  							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault6" value="영리목적">
  							<label class="form-check-label" for="flexRadioDefault6">
  							영리목적
  							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault7" value="악성코드/스파이웨어">
  							<label class="form-check-label" for="flexRadioDefault7">
  							악성코드/스파이웨어
  							</label>
							</td>
							<td>
							<input class="form-check-input" type="radio" name="reportReason" id="flexRadioDefault8" value="기타">
  							<label class="form-check-label" for="flexRadioDefault8">
  							기타
  							</label>
							</td>
						</tr>
						
					</tbody>
					<tfoot>
						<tr>
							<th>신고내용 :</th>
						</tr>
						<tr>
							<td><textarea name="reasonContent" class="reasonContent" rows="3" id="reasonContentText" maxlength="300"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일 :</th>
						</tr>
						<tr>
							<td><input type="file" name="file" maxlength="60" size="40"/></td>
						</tr>
					</tfoot>
								
				</table>
						</div>
							</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="deletePost" id="modalReportBtn">신고하기</button>
					        <button type="button" class="cancleModal" data-bs-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
								
					
				</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd id="boardPostId">${post.postId}</dd>
						<input type="hidden" name="badBoard" id="badBoard" value="공지사항">
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>관리자</dd>
						<input type="hidden" name="badWriter" id="badWriter" value="글쓴이">
						<input type="hidden" name="reporter" id="reporter" value="<%=userId%>">
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${post.postDate}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${post.postCnt}</dd>
					</dl>
				</div>
				<div class="cont">
					${post.postContent}
					<input type="hidden" name="badContent" id="badContent" value="${post.postContent}">
				</div>
				 </c:forEach> 
				</form>
			</div>
		</div>
		
		<div class="bt_wrap">
			<button type="button" class="boardList" id="listBtn">목록</button>
		</div>
		
		
	<!-- Comments Form -->
	<form name="comment-form" id="commentForm" method="post">
		<input type="hidden" id="formcommentId" name="commentId" value="">
		<input type="hidden" id="formpostId"name="postId" value="">
		<input type="hidden" id="formcontent"name="content" value="">
	<h3 id="com">Comments :</h3>
	<hr id="hr"/>
	</form>	
	<div class="card my-4" id="commentBox">
		<h5 class="card-header" style="font-size: 15px; padding: 15px;">댓글을 남겨주세요 </h5>
		<div class="card-body">
			<form name="comment-form" id="frm" action="commentAction" method="post" autocomplete="off" >
				<div class="form-group">
				<div id="inputBox">
				<div id="inputBoxL">
					<input type="hidden" name="postId" id="hiddenPostId" value="${list.get(0).postId}">
					<label class="control-label" for="writerBot" id="writerTop">작성자</label>
            		<input class="form-control" type="text" name="writer" id="writerBot" value="<%=userNick%>"/>					
				</div>
				<div class="form-check form-switch" id="inputBoxR">
					<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  					<label class="form-check-label" for="flexSwitchCheckChecked">비밀댓글</label>
            		<input type="hidden" name="secretCheck" id=switchCheck>
            	</div>
            	</div>
					<textarea name="content" class="form-control" rows="3" id="commentText" maxlength="500" style="margin-top: 15px;"></textarea>
				</div><br>
				<button type="button" class="submitComment" id="leavecomment" >댓글등록</button>
			</form>
		</div>
	</div>
		
		
	</div>


    
    <%} // else%>
    
<%} // else%>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

<!--     <div class="footer-top"> -->
<!--       <div class="container"> -->
<!--         <div class="row"> -->

<!--           <div class="col-lg-3 col-md-6 footer-contact"> -->
<!--             <h3>Arsha</h3> -->
<!--             <p> -->
<!--               A108 Adam Street <br> -->
<!--               New York, NY 535022<br> -->
<!--               United States <br><br> -->
<!--               <strong>Phone:</strong> +1 5589 55488 55<br> -->
<!--               <strong>Email:</strong> info@example.com<br> -->
<!--             </p> -->
<!--           </div> -->

<!--           <div class="col-lg-3 col-md-6 footer-links"> -->
<!--             <h4>Useful Links</h4> -->
<!--             <ul> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li> -->
<!--             </ul> -->
<!--           </div> -->

<!--           <div class="col-lg-3 col-md-6 footer-links"> -->
<!--             <h4>Our Services</h4> -->
<!--             <ul> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li> -->
<!--               <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li> -->
<!--             </ul> -->
<!--           </div> -->

<!--           <div class="col-lg-3 col-md-6 footer-links"> -->
<!--             <h4>Our Social Networks</h4> -->
<!--             <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p> -->
<!--             <div class="social-links mt-3"> -->
<!--               <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> -->
<!--               <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a> -->
<!--               <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a> -->
<!--               <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a> -->
<!--               <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a> -->
<!--             </div> -->
<!--           </div> -->

<!--         </div> -->
<!--       </div> -->
<!--     </div> -->

<!--     <div class="container footer-bottom clearfix"> -->
<!--       <div class="copyright"> -->
<!--         &copy; Copyright <strong><span>Arsha</span></strong>. All Rights Reserved -->
<!--       </div> -->
<!--       <div class="credits"> -->
<!--         All the links in the footer should remain intact. -->
<!--         You can delete the links only if you purchased the pro version. -->
<!--         Licensing information: https://bootstrapmade.com/license/ -->
<!--         Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/ -->
<!--         Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
<!--       </div> -->

    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/vendor/aos/aos.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/vendor/php-email-form/validate.js"></script>
  <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))


$(document).ready(function() {
	getCommentList();
	
})

function getCommentList() {
	
	$.ajax({
		url: "getCommentList",
		type : "get",
		dataType: "json",
		success : function(data){
			
			var commentList = data.commentList;
			
			var commentname = $('#writerBot').val()
			var hiddenPostId = $('#hiddenPostId').val()
			
						
			let htmlTag ='';
														
			for (let idx in commentList) {
				
				
				if (hiddenPostId == commentList[idx].postId) {
					
					if (commentname == 'coco') {
						
						htmlTag += '<thead><tr id="comTableTop">' +
						'<th id="writertd">작성자</th>' +
						'<th>내용</th>' +
						'<th id="dateTd">날짜</th>' + 
						'<th id="dateTd"></th></tr></thead>' + 
						'<tr id="comTable">' +
						'<td id="writertd">'+commentList[idx].writer+'</td>' +
						'<td>'+commentList[idx].content+'</td>' +
						'<td id="dateTd">'+commentList[idx].regDate+'</td>' +
						'<td><button type="button" class="deletePost" id="commentDeleteBtn">삭제</button></td></tr>' +
						'<input type="hidden" name="commentId" value="'+commentList[idx].commentId+'">' +
						'<input type="hidden" name="postId" id="hiddenPostId" value="'+commentList[idx].postId+'">'
						
					} else if (commentname == commentList[idx].writer)  {
											
						htmlTag += '<thead><tr id="comTableTop">' +
						'<th id="writertd">작성자</th>' +
						'<th>내용</th>' +
						'<th id="dateTd">날짜</th>' + 
						'<th id="dateTd"></th>' + 
						'<th id="dateTd"></th></tr></thead>' +  
						'<tr id="comTable">' +
						'<td id="writertd">'+commentList[idx].writer+'</td>' +
						'<td>'+commentList[idx].content+'</td>' +
						'<td id="dateTd">'+commentList[idx].regDate+'</td>' +
						'<td id="editTd"><button type="button" class="editComment" id="commentEditBtn">수정</button></td>'+ 
						'<td><button type="button" class="deletePost" id="commentDeleteBtn">삭제</button></td></tr>'+ 
						'<input type="hidden" name="commentId" value="'+commentList[idx].commentId+'">' +
						'<input type="hidden" name="postId" value="'+commentList[idx].postId+'">' 
				
					} else {
						
						if (commentList[idx].secretCheck =='N') {
							
							htmlTag += '<thead><tr id="comTableTop">' +
							'<th id="writertd">작성자</th>' +
							'<th>내용</th>' +
							'<th id="dateTd">날짜</th></tr></thead>' + 
							'<tr id="comTable">' +
							'<td id="writertd">'+commentList[idx].writer+'</td>' +
							'<td>'+commentList[idx].content+'</td>' +
							'<td id="dateTd">'+commentList[idx].regDate+'</td></tr>'
							
						} else if (commentList[idx].secretCheck =='Y') {
							
							htmlTag += '<thead><tr id="comTableTop">' +
							'<th id="writertd">작성자</th>' +
							'<th>내용</th>' +
							'<th id="dateTd">날짜</th></tr></thead>' + 
							'<tr id="comTable">' +
							'<td id="writertd">'+commentList[idx].writer+'</td>' +
							'<td>비밀댓글은 작성자와 관리자만 볼 수 있습니다.</td>' +
							'<td id="dateTd">'+commentList[idx].regDate+'</td></tr>'
							
						}
					}
					
				} 
										
								
			 } // for 문
						
			$('#com').next().after('<div id="commentAdded"><table id="commentAddedTable">'+htmlTag+'</table></div>')
			
		}, // success function
		error : function(err){
			console.log(err);
		}				
		
	}) //ajax
}


$(function () {
	
		  		  		  	
	$('#leavecomment').click(function() {
	  				
		var text = $('#commentText').val()

	  	if (text == '') {
			alert('댓글을 입력해주세요.')
		
		} else {
			var checked = $('#flexSwitchCheckChecked').is(':checked');
			
			if(checked) {
				$('#switchCheck').attr("value", "Y")
			} else {
				$('#switchCheck').attr("value", "N")
			}
			
			var checkVal = $('#switchCheck').val()
		  	
		$('#frm').submit();
				
			}
			
		})
		
	})
	
	$('#listBtn').click(function() {
		location.href='adminBoard.do';
	})
	
	$('#editBtn').click(function() {
		$('#adminBoardForm').attr("action", "adminBoardEdit")	
		$('#adminBoardForm').submit();
	})
	
	$('#modalDeleteBtn').click(function() {
		$('#adminBoardForm').attr("action", "adminBoardDelete")			
		
		$('#adminBoardForm').submit();
	})
	
	

	
	$('#modalReportBtn').click(function() {
		
		var reason = $('input[name=reportReason]:checked').val();
		if(reason == '기타') {
			var content = $('#reasonContentText').val()
			if (content == '') {
				alert('신고내용을 적어주세요.')
			} else {
					$('#reportReason').val(reason);

					Swal.fire({
					  title: 'Success!',
					  text: '신고 접수가 되었습니다.',
					  icon: 'success',
					  confirmButtonText: '확인',
					}).then((result) => {
						  if (result.isConfirmed) {
		 						$('#reportPost').submit();
							  }
							})
					
					
			}
			
			
		} else {
				$('#reportReason').val(reason);

				Swal.fire({
					  title: 'Success!',
					  text: '신고 접수가 되었습니다.',
					  icon: 'success',
					  confirmButtonText: '확인',
					}).then((result) => {
						  if (result.isConfirmed) {
		 						$('#reportPost').submit();
							  }
							})
				
					
		}
		
	})
	
	$('#commentForm').on('click', '.deletePost', function() {
		$('#commentForm').attr("action", "commentDelete")
		
		$('#formcommentId').val($(this).parent().parent().next().val());
		$('#formpostId').val($(this).parent().parent().next().next().val());
		
		
		$('#commentForm').submit();
	})
	
	
	

	$('#commentForm').on('click', '.editComment', function() {
		let selectTag = $(this).parent().prev().prev()
		let selectTagText = selectTag.text();
		selectTag.html("<input name='' id='saveComment' type='text' size='60' value='"+selectTagText+"'>");
		$(this).attr("class", "saveComment")
		$(this).text("저장")

		
		$('.saveComment').click(function(){
			
			$('#commentForm').attr("action", "commentEdit")
			
			$('#formcommentId').val($(this).parent().parent().next().val());
			$('#formpostId').val($(this).parent().parent().next().next().val());
			$('#formcontent').val($('#saveComment').val());
			
	 		$('#commentForm').submit();
		});
		
		
	})
	
	






</script>
</html>