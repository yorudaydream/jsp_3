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
import com.oreilly.servlet.MultipartRequest;

public class NoticeDAO implements BoardDAO{

	@Override
	public List<BoardDTO> selectList(RowNumber rowNumber) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+"(select num, title, writer, reg_date, hit from notice "
				+ "where "+rowNumber.getSearch().getKind()+" like ? "
				+ "order by num desc) N) "
				+"where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, "%"+rowNumber.getSearch().getSearch()+"%");
		st.setInt(2, rowNumber.getStartRow());
		st.setInt(3, rowNumber.getLastRow());
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<BoardDTO> ar = new ArrayList<>();
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
		Connection con = DBConnector.getConnect(); 
		String sql = "select * from notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		NoticeDTO ndt =  null;
		
		if(rs.next()) {
			ndt = new NoticeDTO();
			ndt.setNum(rs.getInt("num"));
			ndt.setTitle(rs.getString("title"));
			ndt.setWriter(rs.getString("writer"));
			ndt.setContent(rs.getString("content"));
			ndt.setReg_date(rs.getDate("reg_date"));
			ndt.setHit(rs.getInt("hit"));
		}
		
		DBConnector.disConnect(rs, st, con);
			
		return ndt;
	}
	//seq
	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		rs.next();
		
		int num = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return num;
	}//새로 들어갈 글번호 미리받아오기
	
	
	
	@Override
	public int insert(BoardDTO bdt) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(?, ?, ?, ?, sysdate, 0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, bdt.getNum());
		st.setString(2, bdt.getTitle());
		st.setString(3, bdt.getContent());
		st.setString(4, bdt.getWriter());
		//st.setInt(4, ndt.getHit());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}

	@Override
	public int update(BoardDTO bdt) throws Exception {

		
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(String kind, String search) throws Exception {
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
