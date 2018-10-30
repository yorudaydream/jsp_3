package com.ft.qna;

import javax.servlet.http.HttpServletRequest;

import com.ft.board.BoardDTO;
import com.ft.controller.ActionForward;

public class QnaService {
private QnaDAO qnaDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
	}
	
	public ActionForward selectList(HttpServletRequest) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(false);
		actionForward.setPath("./qnaList.do");
		
		try {
		
		int curPage = 1;
		
		curPage = Integer.parseInt(request.getParameter("curPage"));
		
		String kind = Request.getParameter("kind");
		String search = Request.getParameter("search");
		
		MakePager mk =  new MakePager(curPage, search, kind);
		RowNumber rowNumber = mk.makeRow();
		
		List<BoardDAO> ar = qnaDAO.getCount(kind, search);
		int totalCount = qnaDAO.getCount(kind, search);
		Pager pager = mk.makePage(totalCount);
		
		request.setAttribute("list",ar);
		request.setAttribute("pager",pager);
		
		actionForward.setPath("");
		
		BoardDTO bdt = qnaDAO.selectOne(num);
		
		request.setAttribute("dto", bdt);
		
		actionForward.setPath("../Web-INF/qnaDTO");
		actionForward.setCheck(true);
		
		
	}catch (Exception e)	{
		request.setAttribute("message", "Fail");
		request.setAttribute("path", "../index.jsp");
	}
	
		if(BoardDTO == null) {
			actionForward.setCheck(false);
			actionForward.setPath("./qnaList.do");
		}
		
		
		
}
