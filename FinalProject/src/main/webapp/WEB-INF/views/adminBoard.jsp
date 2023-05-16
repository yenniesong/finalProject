<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
    <%@page import="com.human.java.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%
    String id = null;
    String name = null;
    if(session.getAttribute("userid") != null) {
  	  id = (String) session.getAttribute("userid"); 
  	name = (String) session.getAttribute("username"); 
    }

    %> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <title>Soupie - 공지사항</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
	<link href="../resources/img/soupie.png" rel="icon">
  <link href="../resources/img/soupie.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">

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
          <li><a class="nav-link scrollto active" href="main">Home</a></li>
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
    	if (id == null) {
    	
    		%>
          <li class="dropdown"><a href="#"><span>Get online</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="login">로그인</a></li>
              <li><a href="join">회원가입</a></li>
            </ul>
          </li>
        <% } else {  if (name.equals("코코딩")) { %>
          <li class="dropdown"><a href="#"><span>Get online</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="badComment">신고글 관리페이지</a></li>
              <li><a href="logoutAction">로그아웃</a></li>
            </ul>
          </li>
          <% } else {// else안에 if %>
          <li class="dropdown"><a href="#"><span>Get online</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="myPage"><%=name%> 페이지</a></li>
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

	


<div class="board_wrap">
		
		<div class="board_list_wrap">
			  	<div class="table-responsive" id="tableH" >
         <table class="table table-striped table-sm text-center table-hover" id="tableid">
          <thead>
            <tr id="tabletr">
              <th scope="col">글번호</th>
              <th scope="col">제목</th>
              <th scope="col">글쓴이</th>
              <th scope="col">작성일</th>
              <th scope="col">조회</th>
              
            </tr>
          </thead>         	
          
          <tbody>
          <c:forEach items="${list}" var="board">
        	  <tr id="tabletr">
		      	<td scope="col">${board.postId}</td>
		        <td scope="col" style="cursor: pointer;" class="postView" >${board.postTitle}</td>
		        <td scope="col">관리자</td>
		        <td scope="col">${board.postDate}</td>
		        <td scope="col">${board.postCnt}</td>
		       </tr>
		        
          	 </c:forEach>       
          </tbody>
                          	  
           </table>
     	 </div>
		
		</div>
		
     	<% if(id != null){ if(name.equals("코코딩")) { // >>>>> 관리자로 로그인 %>
		<div class="bt_wrap">
			<button type="button" class="writePost" id="insertBtn" onclick="insertBoard()" >글쓰기</button>
		</div>
		<% }%>
		<% }%>
		
		<div class="board_page">
		
	<nav aria-label="Page navigation example" class="pageList">
		<ul class="pagination" id="pageUl">
		
			<!-- 이전 그룹 번호로 생성-->		
		<c:choose>
			<c:when test="${startGroupNum == '0'}">
	    		<li class="page-item disabled" id="page-item List">
	      			<a class="page-link" href="adminBoard.do" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	      			</a>
	    		</li>
	    	</c:when>		
			<c:otherwise>
	    		<li class="page-item" id="page-item List">
	      			<a class="page-link" href="adminBoard.do?groupNum=${startGroupNum}&pageNum=${(startGroupNum-1)*5+1}" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	      			</a>
	    		</li>
	    	</c:otherwise>
    	
    	</c:choose>
    
<%--     <c:forEach var="board" begin="1" end="총게시물 / 한페이지당 몇개 보여줄건지 "> --%>
    <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
    
		<c:choose>
			<c:when test="${param.pageNum eq i }">
						<li class="page-item pageClickClass active" aria-current="page"><a class="page-link" id="pageClicked" href="adminBoard.do?groupNum=${startGroupNum+1 }&pageNum=${i}">${i}</a></li>
			</c:when>
			<c:otherwise>
	    		<li class="page-item pageClickClass" aria-current="page"><a class="page-link" id="pageClicked" href="adminBoard.do?groupNum=${startGroupNum+1 }&pageNum=${i}">${i}</a></li>
			</c:otherwise>
		</c:choose>   
    
    </c:forEach>

	   	  
		<!--  이후 그룹 번호로 생성 -->
    <c:choose>
		<c:when test="${endGroupNum == 0}">
	   		<li class="page-item disabled">
	    	 		<a class="page-link" href="adminBoard.do" aria-label="Next">
		       			<span aria-hidden="true">&raquo;</span>
	     			</a>
	   		</li>
    	</c:when>
		<c:otherwise>
    		<li class="page-item" id="page-item List">
      			<a class="page-link" href="adminBoard.do?groupNum=${endGroupNum }&pageNum=${(endGroupNum-1)*5+1}" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
      			</a>
    		</li>
    	</c:otherwise>
    	
    	</c:choose>
    	  
  		</ul>
	</nav>

		</div>
		
	
	</div>
		
    
	<form action="updateCnt" method="post" id="frm">   
	 
		<input type="hidden" name="postId" id="hiddenPostId" value="">
		<input type="hidden" name="postTitle" id="hiddenPostTitle" value="">
		<input type="hidden" name="postDate" id="hiddenPostDate" value="">
		<input type="hidden" name="postCnt" id="hiddenPostICnt" value="">

	</form>
		
		
		
		
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
<!--   <footer id="footer"> -->

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

<!--     </div> -->
<!--   </footer>End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

function insertBoard() {
	 window.location.href = 'adminBoardInsert'
}


$(function () {
 
		$('#tableH').on('click','.postView', function(){

			console.log($(this).prev().text());
			console.log($(this).text());
			console.log($(this).next().next().text());
			console.log($(this).next().next().next().text());
										
			$('#hiddenPostId').val( $(this).prev().text() );
			$('#hiddenPostTitle').val($(this).text())
			$('#hiddenPostDate').val($(this).next().next().text())
			$('#hiddenPostICnt').val($(this).next().next().next().text())
		
			$('#frm').submit();
	
		})
		
		
		
		
})
		




</script>
</html>