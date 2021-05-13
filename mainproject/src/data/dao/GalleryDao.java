package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.GalleryDto;
import oracle.db.DbConnect;

public class GalleryDao {
	DbConnect db = new DbConnect();

	// Insert
	public void uploadGallery(String fileName, String fileRealName) {
		
		String sql = "insert into Gallery values (seq_mini.nextval,?,?,?,?,0,0,sysdate)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "testWriter");
			pstmt.setString(2, "testSubject");
			pstmt.setString(3, fileName);
			pstmt.setString(4, fileRealName);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();

		String sql = "select nvl(max(num),0) from Gallery";

		int n = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				n = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return n;
	}

	// 글 전체 수
	public int getTotalCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();

		String sql = "select count(*) from Gallery";

		int n = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				n = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return n;
	}

	public List<GalleryDto> getList(int start, int end) {
		List<GalleryDto> list = new Vector<GalleryDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();

		String sql = "select a.* from (select ROWNUM as RNUM,b.* from "
				+ "(select * from Gallery order by num desc)b)a " + "where a.RNUM>=? and a.RNUM<=?";

		try {
			pstmt = conn.prepareStatement(sql);

			// 바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// 실행
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GalleryDto dto = new GalleryDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setImgName(rs.getString("imgName"));
				dto.setImgRealName(rs.getString("imgRealname"));
				dto.setLikes(rs.getInt("likes"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	public List<GalleryDto> getPage(int start,int end) {
		List<GalleryDto> list = new Vector<GalleryDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();
		
		String sql = "select a.* from (select ROWNUM as RNUM,b.* from "
				+ "(select * from Gallery order by num desc)b)a " + "where a.RNUM>=? and a.RNUM<=?";

		try {
			pstmt = conn.prepareStatement(sql);

			// 바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// 실행
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GalleryDto dto = new GalleryDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setImgName(rs.getString("imgName"));
				dto.setImgRealName(rs.getString("imgRealname"));
				dto.setLikes(rs.getInt("likes"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

	// num에 해당하는 readcount 1 증가
	public int updateReadcount(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Gallery set readcount=readcount+1 where num=?";
		int n = 0;
		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return n;
	}

	public int updateLikes(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Gallery set likes=likes+1 where num=?";
		int n = 0;
		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return n;
	}
	  
	public GalleryDto getData(String num) {
		GalleryDto dto = new GalleryDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getConnection();

		String sql = "select * from Gallery where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setImgName(rs.getString("imgName"));
				dto.setImgRealName(rs.getString("imgRealname"));
				dto.setLikes(rs.getInt("likes"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;

	}

	// 수정
	public void updateGallery(String subject, String content, String image, String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Gallery set subject=?, content=?, image=?" + "where num=?";

		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, image);
			pstmt.setString(4, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 삭제
	public void deleteGallery(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();

		String sql = "delete from Gallery where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

}
