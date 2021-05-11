package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import data.dto.jayuBoardDto;
import oracle.db.DbConnect;

public class jayuBoardDao {
	DbConnect db=new DbConnect();
	
	public void insertjayu(jayuBoardDto dto)
	{
		//dto에 들어있는 4개의 값을 일단 변수에 저장
		int num=dto.getNum();
		int reg=dto.getReg();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) // 0일 경우 원글로 구분
		{	
			//그룹변수는  num의 최대값 +1
			reg=this.getMaxNum()+1;
			//원글은 모두 0으로 초기화
			restep=0;
			relevel=0;
			//원글과 답글일때는 이 세가지 변수(reg,restep,relevel)가 달라진다
			
		}
		
		else
		{ //null이 아닐경우 답글로 구분
			
			//같은 그룹중 전달받은 restep 보다 큰 게시글들은 모두 +1
			this.updateRestep(reg, restep);
			//그후 restep, relevel 모두 1증가
			restep+=1;
			relevel+=1;
		}

		String sql="insert into jayuboard values (seq_mini.nextval,"
				+ "?,?,?,?,?,?,0,0,sysdate)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getMyid());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			//여기서부터는 dto에서 꺼내는게 아니라 변수로 선언
			pstmt.setInt(4, reg);
			pstmt.setInt(5, restep);
			pstmt.setInt(6, relevel);
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("insert에러"+e.getMessage());
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//num max=null 일 경우 0값 리턴
		public int getMaxNum()
		{
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			conn=db.getConnection();
			
			String sql="select nvl(max(num),0) from jayuboard"; 
			//NVL 함수는 값이 null인 경우 지정값을 출력한다=멕시멈 num을 출력하는데, 널일때는 0 출력
			
			int n=0;
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next())
					n=rs.getInt(1);	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return n;
		}
		
		
		//같은 그룹중 전달받은 step보다 더 큰값이 있으면 각각 +1로 업뎃
		public void updateRestep(int reg, int restep) 
		{
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getConnection();
		
		String sql="update jayuboard set restep=restep+1 where reg=? "
				+ "and restep>?"; 
				//reg(그룹)와 같거나 restep(답글순서에 관한 변수)이 전달받은것보다 클경우 restep에 +1
		int n=0;
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, reg);
			pstmt.setInt(2, restep);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		}
		
		
	
	//전체 갯수 구하기
		public int getTotalCount()
		{
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			conn=db.getConnection();
			
			String sql="select count(*) from jayuboard"; 
			
			int n=0;
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next())
					n=rs.getInt(1);	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return n;
		}
	
		//페이징처리에 필요한 리스트만 보내기
		public List<jayuBoardDto> getList(int start, int end)
		{
			List<jayuBoardDto> list=new Vector<jayuBoardDto>();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			conn=db.getConnection();
			
			 String sql = "select a.* from (select ROWNUM as RNUM,b.* from "
			            + "(select * from jayuboard order by reg desc,restep asc)b)a "
			            + "where a.RNUM>=? and a.RNUM<=?";
			 
			 		//epleboard order by reg desc,restep asc
			 		//리플보드인데 순서를 reg의 내림차순 restep의 오름차순
			 		//제이쿼리 이용할 때도 이 문법 그대로 사용하면됨
			 
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				//실행
				rs=pstmt.executeQuery();
				while(rs.next())
				{
					jayuBoardDto dto=new jayuBoardDto();
					dto.setNum(rs.getInt("num"));
					dto.setMyid(rs.getString("myid"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setLikes(rs.getInt("likes"));
					dto.setReg(rs.getInt("reg"));
					dto.setRestep(rs.getInt("restep"));
					dto.setRelevel(rs.getInt("relevel"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
					list.add(dto);
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("getlist에러"+e.getMessage());
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return list;
		}
		
		//num에 해당하는 readcount 1 증가
		public int updateReadcount(String num) 
		{	
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql="update jayuboard set readcount=readcount+1 where num=?";
			int n=0;
			conn=db.getConnection();
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			return n;
		}
		
		
		public int updateLikes(String num) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql= "update jayuboard set likes=likes+1 where num=?";
			int n =0;
			conn=db.getConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			return n;
			
		}
		
		
		
		//num에 해당하는 dto데이터 반환
		public jayuBoardDto getData(String num) 
		{
			jayuBoardDto dto=new jayuBoardDto();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			conn=db.getConnection();
			
			String sql="select * from jayuboard where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, num);
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					dto.setNum(rs.getInt("num"));
					dto.setMyid(rs.getString("Myid"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setLikes(rs.getInt("likes"));
					dto.setReg(rs.getInt("reg"));
					dto.setRestep(rs.getInt("restep"));
					dto.setRelevel(rs.getInt("relevel"));
					dto.setReadcount(rs.getInt("readcount"));
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
		
		
		//수정
		public void updatejayu(String subject, String content, String num) 
		{	
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql="update jayuboard set subject=?, content=? "
					+ "where num=?";
			
			conn=db.getConnection();
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, subject);
				pstmt.setString(2, content);
				pstmt.setString(3, num);
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
				
		
		//삭제
		public void deletejayu(String num) 
		{	
			Connection conn=null;
			PreparedStatement pstmt=null;
			conn=db.getConnection();
			String sql="delete from jayuboard where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
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
