package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import data.dto.jayuBoardDto;
import oracle.db.DbConnect;

public class mypagedao {
	
	
	public static JSONArray infoboard(String id){
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		JSONArray arry=new JSONArray();
		conn=db.getConnection();
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");

		
		String sql="select * from infoboard where Myid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			System.out.println("infoboard id:"+id);
			while(rs.next())
			{
				JSONObject ob=new JSONObject();
				ob.put("num", rs.getInt("num"));
				ob.put("Myid", rs.getString("Myid"));
				ob.put("subject", rs.getString("subject"));
				ob.put("content", rs.getString("content"));
				ob.put("likes", rs.getInt("likes"));
				ob.put("reg", rs.getInt("num"));
				ob.put("restep", rs.getInt("restep"));
				ob.put("relevel", rs.getInt("relevel"));
				ob.put("readcount", rs.getInt("readcount"));
				ob.put("writeday", sdf1.format(rs.getTimestamp("writeday")));
				arry.add(ob);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return arry;
	}
	
	public static JSONArray jayuboard(String id){
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		JSONArray arry=new JSONArray();
		
		conn=db.getConnection();
		
		String sql="select * from jayuBoard where Myid=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
			while(rs.next())
			{
				JSONObject ob=new JSONObject();
				jayuBoardDto dto=new jayuBoardDto();
				ob.put("num", rs.getInt("num"));
				ob.put("Myid", rs.getString("Myid"));
				ob.put("subject", rs.getString("subject"));
				ob.put("content", rs.getString("content"));
				ob.put("likes", rs.getInt("likes"));
				ob.put("reg", rs.getInt("num"));
				ob.put("restep", rs.getInt("restep"));
				ob.put("relevel", rs.getInt("relevel"));
				ob.put("readcount", rs.getInt("readcount"));
				ob.put("writeday", sdf1.format(rs.getTimestamp("writeday")));
			
				arry.add(ob);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return arry;
	}
	
	public static String[] myinfo(String id) {
		String[] myinfo=new String[2];
		DbConnect db=new DbConnect();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;


		conn=db.getConnection();
		
		String sql="select * from users where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				myinfo[0]=rs.getString("id");
				myinfo[1]=rs.getString("email");
			}
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
		return myinfo;
	}
	
	
	
}







