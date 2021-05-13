package data.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import data.dto.logindto;
import oracle.db.DbConnect;

public class logindao {

	// 임시 비밀번호 생성
	public String newpwd() {
		String newpwd = "";

		try {
			SecureRandom random;
			random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			newpwd = new String(Base64.getEncoder().encode(bytes));

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newpwd;
	}

	public String findpw(String id, String email) {
		// 임시 비밀번호를 해싱해서 DB에 저장한다
		if (findid(email).equals(id)) {
			//이메일과 아이디가 일치하면 패스워드 진행
			String pwd = newpwd();
			//패스워드 평문
			if (pwd.equals(""))
				pwd = newpwd();
			String pwda[] = pwdhex(pwd);
			// 0이 salt 1이 패스워드

			DbConnect db = new DbConnect();
			Connection conn = null;
			PreparedStatement pstmt = null;

			String sql = "update users set  pwd=? ,salt=? where id=? and email=?";
			try {
				conn = db.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pwda[1]);
				pstmt.setString(2, pwda[0]);
				pstmt.setString(3, id);
				pstmt.setString(4, email);
				pstmt.execute();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("findpw에러" + e.getMessage());
			} finally {
				db.dbClose(pstmt, conn);
			}
			return pwd;
		}
		return "0";
	}

	public String findid(String email) {
		// id만 리턴하면 됨
		String id = "";
		DbConnect db = new DbConnect();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id,email from users where email=?";

		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				id = rs.getString("id");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("findid에러:" + e.getMessage());
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return id;
	}

	public void createuser(logindto dto) {
		DbConnect db = new DbConnect();

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into users values (?,?,?,?,?)";
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			String[] pwdsalt = pwdhex(dto.getPwd());
			// 0: salt 1:pwd
			pstmt.setString(2, pwdsalt[1]);
			pstmt.setString(3, pwdsalt[0]);
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("logindao에러" + e.getMessage());
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	public String[] pwdhex(String pwd) {
		SecureRandom random;
		try {
			random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			String salt = new String(Base64.getEncoder().encode(bytes));

			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt.getBytes());
			md.update(pwd.getBytes());
			String hex = String.format("%064x", new BigInteger(1, md.digest()));

			String[] pwdsalt = new String[2];
			pwdsalt[0] = salt;
			pwdsalt[1] = hex;
			return pwdsalt;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			System.out.println("pwdhex:" + e.getMessage());
		}
		return null;
	}

	public boolean idcheck(String id) {
		// id 검사
		DbConnect db = new DbConnect();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from users where id=?";

		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("logincheck에러:" + e.getMessage());
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return false;
	}

	public boolean logincheck(String id, String pwd) {
		// pwd : 입력받은 pwd
		DbConnect db = new DbConnect();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean pwdcheck = false;
		String sql = "select * from users where id=?";

		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pwdcheck = pwdcheck(pwd, rs.getString("pwd"), rs.getString("salt"));
				// 입력받은 pwd와 salt를 보낸다
				db.dbClose(rs, pstmt, conn);
				return pwdcheck;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("logincheck에러:" + e.getMessage());
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return pwdcheck;
	}

	public boolean pwdcheck(String pwd, String pwdb, String salt) {
		SecureRandom random;
		try {
			random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);

			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt.getBytes());
			md.update(pwd.getBytes());
			String hex = String.format("%064x", new BigInteger(1, md.digest()));
			if (pwdb.equals(hex))
				return true;

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			System.out.println("pwdcheck:" + e.getMessage());
		}

		return false;
	}

}
