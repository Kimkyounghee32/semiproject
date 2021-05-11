package data.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.QnaDto;
import oracle.db.DbConnect;

public class QnaDao {
	DbConnect db=new DbConnect();
	
	public List<QnaDto> getAllDatas()
	{
		List<QnaDto> list =new Vector<QnaDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from faq order by num desc";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDto dto=new QnaDto();
				dto.setNum(rs.getString("num"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public List<QnaDto> getSearchData(String subject)
	{
		List<QnaDto> list=new Vector<QnaDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from faq where subject like '%"
				+subject+"%' order by num desc";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnaDto dto=new QnaDto();
				dto.setNum(rs.getString("num"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("getSearchData에러"+e.getMessage());
		}finally {
			db.dbClose(rs, pstmt, conn);
	}return list;
	}
}
