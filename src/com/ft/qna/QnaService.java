package com.ft.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.smartcardio.CommandAPDU;

import com.ft.action.ActionForward;
import com.ft.board.BoardDTO;
import com.ft.page.MakePager;
import com.ft.page.Pager;
import com.ft.page.RowNumber;

public class QnaService implements BoardService{
private QnaDAO qnaDAO;

public QnaService() {
	qnaDAO = new QnaDAO();
}

public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionForward = new ActionForward();
	actionForward.setCheck(false);
	actionForward.setPath("./qnaList.do");
	BoardDTO boardDTO=null;
	try {
		int num = Integer.parseInt(request.getParameter("num"));
		boardDTO = qnaDAO.selectOne(num);
		
		request.setAttribute("dto", boardDTO);
		
		actionForward.setPath("../WEB-INF/view/board/boardSelectOne.jsp");
		actionForward.setCheck(true);
	}catch (Exception e) {
		// TODO: handle exception
	}
	if(boardDTO == null) {
		actionForward.setCheck(false);
		actionForward.setPath("./qnaList.do");
	}
	
	return actionForward;
}

//list
public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
	ActionForward actionFoward = new ActionForward();
	int curPage=1;
	try {
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}catch (Exception e) {
		
	}
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	
	MakePager mk = new MakePager(curPage, search, kind);
	RowNumber rowNumber = mk.makeRow();
	List<BoardDTO> ar;
	try {
		ar = qnaDAO.selectList(rowNumber);
		int totalCount = qnaDAO.getCount(rowNumber.getSearch());
		Pager pager = mk.makePage(totalCount);
		request.setAttribute("list", ar);
		request.setAttribute("pager", pager);
		actionFoward.setPath("../WEB-INF/qna/qnaList.jsp");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	actionFoward.setCheck(true);
	return actionFoward;
}
		
}
