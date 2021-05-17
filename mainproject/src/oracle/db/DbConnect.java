package oracle.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	String oracleDriver="oracle.jdbc.driver.OracleDriver";
	String oracleUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public DbConnect() {
		try {
			Class.forName(oracleDriver);       //프로젝트 안에 오라클 자료가 없을 경우 익셉션 발생. 또는 오타일경우 익셉션.
			//System.out.println("오라클 드라이버 검색 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클드라이버 검색 실패:"+e.getMessage());
		}
	}
	
	//db server 연결하는 메서드 
		public Connection getConnection()
		{
			Connection conn = null;
			try {
				conn=DriverManager.getConnection(oracleUrl, "angel", "a1234"); //오라클Url,계정명,비밀번호

				System.out.println("오라클 서버 연결 성공");
			} catch (SQLException e) {
				System.out.println("오라클 연결 실패:"+e.getMessage());
			}
			return conn;
		}
			
		//db close
		public void dbClose(Statement stmt, Connection conn)//레퍼런스 변수이기때문에 실제 db도 같이 닫힘
		{
			try{
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {}
		}
			
			public void dbClose(ResultSet rs, Statement stmt, Connection conn)
			{
				try{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {}
			}
			
			
			public void dbClose(PreparedStatement pstmt, Connection conn)
			{
				try{
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {}
			}
			
			public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn)
			{
				try{
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {}
			}
			
			public void dbClose(CallableStatement cstmt, Connection conn)
			{
				try{
					if(cstmt!=null)cstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {}
			}
			
			public void dbClose(ResultSet rs, CallableStatement cstmt, Connection conn)
			{
				try{
					if(rs!=null)rs.close();
					if(cstmt!=null)cstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {}
			}
			
		}