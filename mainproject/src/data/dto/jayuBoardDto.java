package data.dto;

import java.sql.Timestamp;

public class jayuBoardDto {
	
	private int num;
	private String myid;
	private String subject;
	private String content;
	private int likes;
	private int reg;
	private int restep;
	private int relevel;
	private int readcount;
	private Timestamp writeday;
	private int acount;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getReg() {
		return reg;
	}
	public void setReg(int reg) {
		this.reg = reg;
	}
	public int getRestep() {
		return restep;
	}
	public void setRestep(int restep) {
		this.restep = restep;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public int getAcount() {
		return acount;
	}
	public void setAcount(int acount) {
		this.acount = acount;
	}

	
	
	
}
