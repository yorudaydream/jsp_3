package com.ft.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ft.board.BoardDAO;
import com.ft.board.BoardDTO;
import com.ft.board.BoardReply;
import com.ft.board.BoardReplyDTO;
import com.ft.controller.ActionForward;
import com.ft.page.MakePager;
import com.ft.page.RowNumber;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class QnaDAO implements BoardDAO, BoardReply {

	@Override
	public List<BoardDTO> selectList(RowNumber rowNumber) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(BoardDTO bdt) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardDTO bdt) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	@Override
	public int getCount(String kind, String search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reply(BoardReplyDTO brdt) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyUpdate(BoardReplyDTO brdt) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	private QnaDAO qnaDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
	}
	
	public ActionForward selectList(HttpServletRequest) {
		ActionForward actionForward = new ActionForward();
		try {
		
		int curPage = 1;
		
		curPage = Integer.parseInt(request.));
		
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
		
	}catch (Exception e)	{
		request.setAttribute("message", "Fail");
		request.setAttribute("path", "../index.jsp");
	}
	
	

}
