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
	public void uploadGallery(GalleryDto dto) {

		String sql = "insert into Gallery values (seq_mini.nextval,?,?,?,0,0,?,sysdate,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();
		System.out.println("fileName: " + dto.getImgName() + "\n upload success");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getImgName());
			pstmt.setString(3, dto.getImgRealName());
			pstmt.setString(4, dto.getHashtag());
			pstmt.setString(5, dto.getSubject());
//			System.out.println("dao.java img name: " + dto.getImgName());
//			System.out.println("dao.java writer: " + dto.getWriter());
//			System.out.println("dao.java RealName: " + dto.getImgRealName());
//			System.out.println("dao.java hashtag: " + dto.getHashtag());
//			System.out.println("dao.java subject: " + dto.getSubject());
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
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return -1;// DB 오류
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
	public int deleteGallery(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getConnection();

		String sql = "delete from Gallery where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return -1;// db 오류

	}

	public String getUserID(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getConnection();

		String sql = "select writer from gallery where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

		return null; // DB 오류
	}

	public int like(String userID, String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getConnection();

		String sql = "insert into likey values (?,?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, num);
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

		return -1; // DB 오류
		
	}
}
