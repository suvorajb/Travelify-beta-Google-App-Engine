package com.apps.sm.gae.travelify.beta.dbstore;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Ignore;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class ClippedPlace {

	@Id private Long clippedid;

	// user data
	@Index private String uid;
	@Index private String unickname;
	
	// place data
	@Index private String plcname;
	@Unindex private String plcaddrss;
	@Unindex private String plcreference;
	@Unindex private String plclatlon;

	@Index private String plccategory;
	
	@Unindex private Date clippedddate;
	
	@Ignore private String publshddatestr;
	@Ignore private String uprofilestr;
	@Ignore private String shorttitle;
	
	@Override
	public String toString() {
		return "Clip - [" + uid + "][" + unickname + "][" + plcname + "][" + plcaddrss + "][" + clippedddate + "]";
	}

	public Long getClippedid() {
		return clippedid;
	}

	public void setClippedid(Long clippedid) {
		this.clippedid = clippedid;
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

	public String getPlcname() {
		return plcname;
	}

	public void setPlcname(String plcname) {
		this.plcname = plcname;
	}

	public String getPlcaddrss() {
		return plcaddrss;
	}

	public void setPlcaddrss(String plcaddrss) {
		this.plcaddrss = plcaddrss;
	}

	public Date getClippeddate() {
		return clippedddate;
	}

	public void setClippeddate(Date clippeddate) {
		this.clippedddate = clippeddate;
	}

	public String getPlccategory() {
		return plccategory;
	}

	public void setPlccategory(String plccategory) {
		this.plccategory = plccategory;
	}

	public String getPlcreference() {
		return plcreference;
	}

	public void setPlcreference(String plcreference) {
		this.plcreference = plcreference;
	}

	public String getPlclatlon() {
		return plclatlon;
	}

	public void setPlclatlon(String plclatlon) {
		this.plclatlon = plclatlon;
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

	public String getShorttitle() {
		return shorttitle;
	}

	public void setShorttitle(String shorttitle) {
		this.shorttitle = shorttitle;
	}
}
