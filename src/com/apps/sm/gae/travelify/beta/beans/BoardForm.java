package com.apps.sm.gae.travelify.beta.beans;

import java.util.Arrays;

public class BoardForm {

	private Long boardid;

	private String boardtitle;
	private String boardtype;
	private String location;
	private String boardnote;
	
	private String[] clippedplaces;
	private String[] searchedplaces;
	
	private String mapstyles;
		
	@Override
	public String toString() {
		return "Board-" + boardtitle + "][" + boardtype + "][" + location + "][" + boardnote + "][" + Arrays.toString(clippedplaces) + "][" + Arrays.toString(searchedplaces) + "]";
	}

	public Long getBoardid() {
		return boardid;
	}

	public void setBoardid(Long boardid) {
		this.boardid = boardid;
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

	public String[] getClippedplaces() {
		return clippedplaces;
	}

	public void setClippedplaces(String[] clippedplaces) {
		this.clippedplaces = clippedplaces;
	}

	public String[] getSearchedplaces() {
		return searchedplaces;
	}

	public void setSearchedplaces(String[] searchedplaces) {
		this.searchedplaces = searchedplaces;
	}

	public String getMapstyles() {
		return mapstyles;
	}

	public void setMapstyles(String mapstyles) {
		this.mapstyles = mapstyles;
	}

}
