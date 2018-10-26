package com.ft.board;

import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;

public interface BoardDAO {
	//selectList
	public List<BoardDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception;
	//selectOne
	public BoardDTO selectOne(int num) throws Exception;
	//insert
	public int insert(BoardDTO bdt) throws Exception;
	//update
	public int update(BoardDTO bdt) throws Exception;
	//delete
	public int delete(int num) throws Exception;
	
	//getCount
	public int getCount(int num) throws Exception;
}
