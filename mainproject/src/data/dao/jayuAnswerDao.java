package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.jayuAnswerDto;
import data.dto.jayuAnswerDto;
import oracle.db.DbConnect;

public class jayuAnswerDao {

DbConnect db=new DbConnect();
	
	public void insertanswer(jayuAnswerDto dto)
	//게시글에 달린 글이기 때문에 넘버로 받아와야한다
	//sql문 물음표3개
	{
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getConnection();
		
		
		String sql="insert into jayuboardanswer values (seq_mini.nextval,?,?,?,sysdate)";	
		 try {
	         pstmt=conn.prepareStatement(sql);
	         //바인딩
	         pstmt.setString(1, dto.getMyid());
	         pstmt.setString(2, dto.getContent());
	         pstmt.setInt(3, dto.getNum());
	         //실행
	         pstmt.execute();         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         db.dbClose(pstmt, conn);
	      }      
	   }
	
	
	public List<jayuAnswerDto> getJayuAnswerList(String num)
	
	{
		List<jayuAnswerDto> list=new Vector<jayuAnswerDto>();
		  Connection conn=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      conn=db.getConnection();
	      
	      String sql="select *from jayuboardanswer where num=? order by idx desc ";	
	      int n=0;
	      try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, num);
				//실행
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					jayuAnswerDto dto=new jayuAnswerDto();
					dto.setIdx(rs.getString("idx"));
					dto.setMyid(rs.getString("myid"));
					dto.setContent(rs.getString("content"));
					dto.setNum(rs.getInt("num"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
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
	
	
	//idx에 해당하는 dto데이터 반환
	public jayuAnswerDto getData(String idx) 
	{
		jayuAnswerDto dto= new jayuAnswerDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		
		String sql="select * from jayuboardanswer where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setIdx(rs.getString("idx"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
		
	}
	
	//댓글 수정메소드
			public void updateanswer(String idx, String content) 
			{
				
				 Connection conn=null;
		         PreparedStatement pstmt=null;
		         String sql="update jayuboardanswer set content=? where idx=?";
		         conn=db.getConnection();
		         try {
		            pstmt=conn.prepareStatement(sql);
		            pstmt.setString(1, content);
		            pstmt.setString(2, idx);
		            //실행
		            pstmt.execute();
		         } catch (SQLException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }finally {
		            db.dbClose(pstmt, conn);
		         }
			}
			
			
			//댓글 삭제메소드
			public void deletejayuanswer(String idx) 
			{
				Connection conn=null;
				PreparedStatement pstmt=null;
				String sql="delete from jayuboardanswer where idx=?";
				conn=db.getConnection();
		        try {
		           pstmt=conn.prepareStatement(sql);
		           pstmt.setString(1, idx);
		           //실행
		           pstmt.execute();
		        } catch (SQLException e) {
		           // TODO Auto-generated catch block
		           e.printStackTrace();
		        }finally {
		           db.dbClose(pstmt, conn);
		        }	

			}
	
		
}
