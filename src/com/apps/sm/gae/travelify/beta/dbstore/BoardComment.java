package com.apps.sm.gae.travelify.beta.dbstore;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Ignore;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;


@Entity
public class BoardComment {
	
	@Id private Long commentid;
	@Index private Long boardid;
	
	// user data
	@Index private String uid;
	@Index private String unickname;
	
	@Unindex private String commentdata;
	@Unindex private Date commentdt;
	
	@Ignore private String uprofilestr;
	
	
	public Long getCommentid() {
		return commentid;
	}
	public void setCommentid(Long commentid) {
		this.commentid = commentid;
	}
	public Long getBoardid() {
		return boardid;
	}
	public void setBoardid(Long boardid) {
		this.boardid = boardid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUnickname() {
		return unickname;
	}
	public void setUnickname(String unickname) {
		this.unickname = unickname;
	}
	public String getCommentdata() {
		return commentdata;
	}
	public void setCommentdata(String commentdata) {
		this.commentdata = commentdata;
	}
	public Date getCommentdt() {
		return commentdt;
	}
	public void setCommentdt(Date commentdt) {
		this.commentdt = commentdt;
	}
	public String getUprofilestr() {
		return uprofilestr;
	}
	public void setUprofilestr(String uprofilestr) {
		this.uprofilestr = uprofilestr;
	}		
}
