package com.human.java.domain;


import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminVO
{
	
	private	int seq_userId;
	private String userid;
	private String password;
	private String newpass;
	private String username;
	private String usergender;
	
	private int postId;
	private	int		groupId;
	private	String	sequenceNo;
	private String postTitle;
	private String postPass;
	private String postContent;
	private String postDate;
	private int postCnt;
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 10;	// 한페이지당 레코드 수
	private int totalCountGroup;    // 페이지 그룹
	private int totalCountPageGroup = 5;	// 한그룹당 레코드 수
		
	private int firstRow;
	private int endRow;
	
	private int commentId;
	private String writer;
	private String content;
	private String regDate;
	private String secretCheck;
	
	private int badId;
	private String badTitle;
	private String badDate;
	private String badWriter;
	private String reason;
	private String reasonContent;
	private String reporter;
	private String badContent;
	private String badBoard;
	private String badFile;
	private String badF_en;
	private long badF_size;
	
	MultipartFile file; // Form 태그에 있는 type="file"인 대상의 name=""과 동일해야함
	
	public MultipartFile getFile() {
		   return file;
	   }
	   public void setFile(MultipartFile file) {
		   this.file = file;
		   System.out.println("** 파일첨부 변수생성 **");
		   // 현재 이 시점은 Controller의 파라미터가 생성되는 시점 > Controller가 실행되기 전
		   // 현재 시점에서 file에 대한 정보를 담을 변수에 값을 채워주는 작업 코딩
		   
		   if ( !file.isEmpty()) { // file이 비어있지 않으면 / file에 뭐가 있으면
			   // 파일이름 추출, 사이즈 추출, 확장자 추출 등등...
			   this.badFile = file.getOriginalFilename(); // 실제 file명을 넣어준다 
			   this.badF_size = file.getSize();
			   
			   // 실제 파일 생성 >> 혹시 사용자가 같은 이름을 가진 파일을 첨부(업로드)한다면 이전 파일에게 덮어집니다 > 이전 파일에 훼손된다
//			   File f = new File("C:\\Users\\human\\Desktop\\stst3\\cWebBoard\\src\\main\\webapp\\resources\\upload\\"+b_fname);
			   
			   // 가짜 이름(파일이름)을 생성하여 문제를 보완합니다
			   // 1. 가짜이름에 사용할 파일의 확장자명을 추출(진짜이름에서 추출)
			   	String fileExtension = badFile.substring(badFile.lastIndexOf("."));
			   	
			   // 2. 사용자의 파일을 저장할때 이름이 겹치지않도록 암호화하는 특별한 코드(암호화)
			   //		형식 : 랜덤문자열32자리.확장자명
			   	this.badF_en = UUID.randomUUID().toString().replaceAll("-", "") +fileExtension;
			   	
			   	// b_fname_en : 랜덤 문자열이 32자리 이므로 중복없이 저장이 가능하다
			   	// 랜덤파일명(f_fname_en)와 실제파일명(b_fname)은 서로 매칭해야하기 때문에 DB에서 둘다 저장해야합니다
			   File f = new File("C:\\Users\\human\\Desktop\\stst3\\soupieeeee\\src\\main\\webapp\\resources\\upload\\"+badF_en);
			   
			   
			   try {
				    // 첨부파일로 받은 데이터를 File클래스로 만든 데이터에게 변환
				   file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		   }
		   
		   // 비어있으면(파일이없으면) 위 과정을 생략
	   }
	
	
		public AdminVO() {
			
			
		}


	}

	


