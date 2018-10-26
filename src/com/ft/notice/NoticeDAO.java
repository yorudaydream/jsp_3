package com.ft.notice;

import java.util.List;

import com.ft.board.BoardDAO;
import com.ft.board.BoardDTO;

public class NoticeDAO implements BoardDAO{

	@Override
	public List<BoardDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception {
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
	public int getCount(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
