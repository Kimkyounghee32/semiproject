package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.OneBoardDto;
import oracle.db.DbConnect;

public class OneBoardDao {
	DbConnect db=new DbConnect();
	
	//num max 값 리턴
	public int getMaxNum() 
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		String sql="select nvl(max(num),0) from oneboard";
		int n=0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				n=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}return n;
	}
	//같은 그룹 중 전달받은 step보다 더 큰값이 있을 경우 각각 +1로 업데이트
		public void updateRestep(int reg, int restep)
		{
			Connection conn=null;
			PreparedStatement pstmt=null;


			conn=db.getConnection();
			String sql="update oneboard set restep=restep+1 where reg? " + "and restep>?";

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, reg);
				pstmt.setInt(2, restep);

				pstmt.execute();	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				db.dbClose(pstmt,conn);
			}
		}
		//insert 원글, 답글 구분해서
		public void insertBoard(OneBoardDto dto)
		{
			//dto에 들어있는 4개의 값을 일단 변수에 저장
			int num=dto.getNum();
			int reg=dto.getReg();
			int restep=dto.getRestep();
			int relevel=dto.getRelevel();

			if(num==0)//null일 경우 원글
			{
				//그룹변수 num의 최댓값 +1
				reg=this.getMaxNum()+1;
				//원글은 모두 0으로 초기화
				restep=0;
				relevel=0;
			}else { //null이 아닐 경우 답글
				//같은 그룹 중 전달받은 restep 보다 큰 게시글들은 모두 +1
				this.updateRestep(reg, restep);
				///그 후 restep,relevel 모두 1 증가
				restep+=1;
				relevel+=1;
			}
			String sql="insert into oneboard values (seq_mini.nextval," + "?,?,?,?,?,?,0,sysdate)";

			Connection conn=null;
			PreparedStatement pstmt=null;

			conn=db.getConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, dto.getMyid());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				//변수, dto에서 꺼내면 안됨
				pstmt.setInt(4, reg);
				pstmt.setInt(5, restep);
				pstmt.setInt(6, relevel);


				//실행
				pstmt.execute();
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
			String sql="select count(*) from oneboard";
			int n=0;
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next())
				{
					n=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				db.dbClose(rs,pstmt,conn);
			}
			return n;
		}
		//페이징 처리에 필요한 리스트만 보내기
		public List<OneBoardDto> getList(int start, int end)
		{
			List<OneBoardDto> list=new Vector<OneBoardDto>();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			conn=db.getConnection();
			//- 출력할 때 그룹의 내림차순 - 같은 그룹일 땐 스텝의 오름차순
			String sql="select a.* from (select rownum as rnum,b.* from "
					+ "(select * from oneboard order by reg desc,restep asc)b)a where a.RNUM>=? and a.RNUM<=?";

			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);

				rs=pstmt.executeQuery();
				while(rs.next()) {
					OneBoardDto dto = new OneBoardDto();
					dto.setNum(rs.getInt("num"));
					dto.setMyid(rs.getString("myid"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReg(rs.getInt("reg"));
					dto.setRestep(rs.getInt("restep"));
					dto.setRelevel(rs.getInt("relevel"));
					dto.setWriteday(rs.getTimestamp("writeday"));

					//리스트 추가 필수! 잊지말기
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				db.dbClose(rs,pstmt,conn);
			}
			return list;
		}
		
}
