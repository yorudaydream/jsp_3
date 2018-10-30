package com.ft.notice;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ft.action.ActionForward;
import com.ft.board.BoardDTO;
import com.ft.file.FileDAO;
import com.ft.file.FileDTO;
import com.ft.page.MakePager;
import com.ft.page.Pager;
import com.ft.page.RowNumber;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeService {
private NoticeDAO noticeDAO;
	
	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}
	
	//selectList
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		int curPage=1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		MakePager mk = new MakePager(curPage, search, kind);
		RowNumber rowNumber = mk.makeRow();
		
		try {
			List<BoardDTO> ar = noticeDAO.selectList(rowNumber);
			int totalCount = noticeDAO.getCount(rowNumber.getSearch());
			Pager pager = mk.makePage(totalCount);
			request.setAttribute("list", ar);
			request.setAttribute("pager", pager);
			actionFoward.setPath("../WEB-INF/notice/noticeList.jsp");
		} catch (Exception e) {
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "../index.jsp");
			actionFoward.setPath("../WEB-INF/common/result.jsp");
			e.printStackTrace();
		}
		
		actionFoward.setCheck(true);
		
		return actionFoward;
	}
	
	//selectOne
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionFoward = new ActionForward();
		BoardDTO boardDTO=null;
		
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			boardDTO = noticeDAO.selectOne(num);
			FileDAO fileDAO = new FileDAO();
			FileDTO fileDTO = new FileDTO();
			fileDTO.setNum(num);
			fileDTO.setKind("N");
			List<FileDTO> ar = fileDAO.selectList(fileDTO);
			request.setAttribute("dto", boardDTO);
			request.setAttribute("files", ar);
			request.setAttribute("board", "notice");
			actionFoward.setCheck(true);
			actionFoward.setPath("../WEB-INF/view/board/boardSelectOne.jsp");
		} catch (Exception e) {
			actionFoward.setCheck(false);
			actionFoward.setPath("./noticeList.do");
			e.printStackTrace();
		}
		
		if(boardDTO == null) {
			actionFoward.setCheck(false);
			actionFoward.setPath("./noticeList.do");
		}
		
		return actionFoward;
	}
	
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		
		if(method.equals("POST")) {
			//dao
			String message="Fail";
			String path = "./noticeList.do";
			//파일의 크기 byte
			int maxsize = 1024*1024*10;
			
			String save = request.getServletContext().getRealPath("upload");
			System.out.println(save);
			File file = new File(save);
			
			if(!file.exists()) {
				file.mkdirs();//없으면 이 공간에 그 경로로 파일을 만들자. 파일 업로드 할 때 필수코드
			}
			
			try {
				MultipartRequest multi = new MultipartRequest(request, save, maxsize, "UTF-8", new DefaultFileRenamePolicy());
				NoticeDTO ndt = new NoticeDTO();
				ndt.setTitle(request.getParameter("title"));
				ndt.setWriter(request.getParameter("writer"));
				ndt.setContent(request.getParameter("content"));
				ndt.setNum(noticeDAO.getNum());
				int result = noticeDAO.insert(ndt);
				
				if(result>0) {
					FileDAO fileDAO = new FileDAO();
					//파일의 파라미터 명을 모아둔 것
					Enumeration<Object> e = multi.getFileNames();
					while(e.hasMoreElements()) {
						String p = (String)e.nextElement();
						FileDTO fileDTO = new FileDTO();
						fileDTO.setKind("N");
						fileDTO.setNum(ndt.getNum());
						fileDTO.setFname(multi.getFilesystemName(p));
						fileDTO.setOname(multi.getOriginalFileName(p));
						fileDAO.insert(fileDTO);
					}
					
					message = "Success";
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
					
					
				}else {
					actionForward.setCheck(true);
					actionForward.setPath("../WEB-INF/view/common/result.jsp");
					
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("message",	message);
			request.setAttribute("path", path);
			
			
		}else {
			request.setAttribute("board", "notice");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/view/board/boardWrite.jsp");
			
			//return actionForward;
		}
		return actionForward;
	}
	
}
