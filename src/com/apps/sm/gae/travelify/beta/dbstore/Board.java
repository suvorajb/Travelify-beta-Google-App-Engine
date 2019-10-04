package com.apps.sm.gae.travelify.beta.dbstore;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Ignore;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;


@Entity
public class Board {
	
	@Id private Long boardid;
	
	// user data
	@Index private String uid;
	@Index private String unickname;
	
	@Unindex private String boardtitle;
	@Index private String boardtype;
	@Index private String location;
	@Unindex private String boardnote;
	@Unindex private String boardphotourl;
	
	@Unindex private String[] boardplaces;
	
	@Unindex private Date createddt;
	
	@Unindex private String photoKey;
	
	@Unindex private String mapstyles;
	
	// not save these fields
	@Ignore private int commentscount;
	@Ignore private List<BoardComment> commentslist;
	@Ignore private String publshddatestr;
	@Ignore private String uprofilestr;
	@Ignore private String shortboardtitle;
	
	@Override
	public String toString() {
		return "Board-" + boardtitle + "][" + boardtype + "][" + location + "][" + boardnote + "][" + uid + "][" + Arrays.toString(boardplaces) + "]";
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

	public String getBoardtitle() {
		return boardtitle;
	}

	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public String getBoardtype() {
		return boardtype;
	}

	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBoardnote() {
		return boardnote;
	}

	public void setBoardnote(String boardnote) {
		this.boardnote = boardnote;
	}

	public String[] getBoardplaces() {
		return boardplaces;
	}

	public void setBoardplaces(String[] boardplaces) {
		this.boardplaces = boardplaces;
	}
	
	public Date getCreateddt() {
		return createddt;
	}
	
	public void setCreateddt(Date createddt) {
		this.createddt = createddt;
	}

	public String getPhotoKey() {
		return photoKey;
	}

	public void setPhotoKey(String photoKey) {
		this.photoKey = photoKey;
	}

	public String getBoardphotourl() {
		return boardphotourl;
	}

	public void setBoardphotourl(String boardphotourl) {
		this.boardphotourl = boardphotourl;
	}

	public int getCommentscount() {
		return commentscount;
	}

	public void setCommentscount(int commentscount) {
		this.commentscount = commentscount;
	}

	public List<BoardComment> getCommentslist() {
		return commentslist;
	}

	public void setCommentslist(List<BoardComment> commentslist) {
		this.commentslist = commentslist;
	}

	public String getMapstyles() {
		return mapstyles;
	}

	public void setMapstyles(String mapstyles) {
		this.mapstyles = mapstyles;
	}

	public String getPublshddatestr() {
		return publshddatestr;
	}

	public void setPublshddatestr(String publshddatestr) {
		this.publshddatestr = publshddatestr;
	}

	public String getUprofilestr() {
		return uprofilestr;
	}

	public void setUprofilestr(String uprofilestr) {
		this.uprofilestr = uprofilestr;
	}

	public String getShortboardtitle() {
		return shortboardtitle;
	}

	public void setShortboardtitle(String shortboardtitle) {
		this.shortboardtitle = shortboardtitle;
	}
}
