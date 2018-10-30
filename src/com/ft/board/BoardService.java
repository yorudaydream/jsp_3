package com.ft.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ft.action.ActionForward;

public class BoardService {
	//list
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response);

	//selectOne
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response);
	
	//insert
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response);
	
	//update
	public ActionForward update(HttpServletRequest request, HttpServletResponse response);
	
	//delete
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response);
	
	//hitUpdate
	
}
