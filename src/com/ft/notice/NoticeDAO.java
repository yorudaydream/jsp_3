package com.ft.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ft.board.BoardDAO;
import com.ft.board.BoardDTO;
import com.ft.page.RowNumber;
import com.ft.util.DBConnector;

public class NoticeDAO implements BoardDAO{

	@Override
	public List<BoardDTO> selectList(RowNumber rowNumber) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+"(select num, title, writer, reg_date, hit from notice "
				+ "where "
				+ "order by num desc) N) "
				+"where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, "%"+rowNumber.getSearch().getSearch()+"%");
		st.setInt(2, rowNumber.getStartRow());
		st.setInt(3, rowNumber.getLastRow());
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<NoticeDTO> ar = new ArrayList<>();
		NoticeDTO ndt = null;
		
		while(rs.next()) {
			ndt = new NoticeDTO();
			ndt.setNum(rs.getInt("num"));
			ndt.setTitle(rs.getString("title"));
			ndt.setWriter(rs.getString("writer"));
			ndt.setReg_date(rs.getDate("reg_date"));
			ndt.setHit(rs.getInt("hit"));
			ar.add(ndt);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
		
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
	public int getCount(int num, String kind) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from notice"
				+ "where " + kind +"like ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		rs.next();
		
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
	}

}
