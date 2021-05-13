package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.db.DbConnect;

public class qrdao {
	
	public void savenum(String number) {
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into qr values(?,0)";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, number);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("savenum에러:"+e.getMessage());
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	public boolean qrcheck(String number) {
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select num from qr where num=?";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("qrcheck에러:"+e.getMessage());
		}finally {
			db.dbClose(rs,pstmt, conn);
		}
		return false;
	}
	
	public void qrinsertid(String id, String number) {
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update qr set id=? where num=?";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, number);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("qrinsertid:"+e.getMessage());
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public String qridtimmer(String number) {
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select id from qr where num=?";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String id=rs.getString("id");
				if(id!=(String.valueOf(0)))return rs.getString("id");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("qridtimmer에러:"+e.getMessage());
		}finally {
			db.dbClose(rs,pstmt, conn);
		}
		return String.valueOf(0);
	}
	
	public void qrdelete(String number) {
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete qr where num=?";
		
		try {
			conn=db.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, number);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("qrdelete에러:"+e.getMessage());
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
