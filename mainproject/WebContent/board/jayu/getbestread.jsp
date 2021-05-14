<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DbConnect db = new DbConnect();
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from jayuboard where rownum<=3 order by readcount";
	JSONArray arr=new JSONArray();
	
	conn=db.getConnection();
	try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(sql);
		while(rs.next())
		{
			String num=rs.getString("num");
			String subject=rs.getString("subject");
			
			JSONObject ob=new JSONObject();
			ob.put("num",num);
			ob.put("subject",subject);
			
			//array에 추가
			arr.add(ob);
		}%>
		
		
	<%}catch(SQLException e){
		System.out.println("select 오류: "+ e.getMessage());
	}finally{
		db.dbClose(rs, pstmt, conn);
	}
%><%=arr.toString()%>



