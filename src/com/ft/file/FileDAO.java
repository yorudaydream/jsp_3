package com.ft.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ft.util.DBConnector;

public class FileDAO {
	public List<FileDTO> selectList(FileDTO fdt) throws Exception{
		List<FileDTO> ar = new ArrayList<>();
		
		Connection con = DBConnector.getConnect();				
		
		String sql = "select * from upload where num=? and kind=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, fdt.getNum());
		st.setString(2, fdt.getKind());
		
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			fdt = new FileDTO();
			fdt.setFnum(rs.getInt("fnum"));
			fdt.setFname(rs.getString("fname"));
			fdt.setOname(rs.getString("oname"));
			fdt.setNum(rs.getInt("num"));
			fdt.setKind(rs.getString("kind"));
			ar.add(fdt);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
		
	}
	
	
	public int insert(FileDTO fdt) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into upload value(file_seq.nextval, ?, ?, ?, ?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, fdt.getFname());
		st.setString(2, fdt.getOname());
		st.setInt(3, fdt.getNum());
		st.setString(4, fdt.getKind());
		
		int result = st.executeUpdate();
				
			
		DBConnector.disConnect(st, con);
		
		return result;
		
	}
}
