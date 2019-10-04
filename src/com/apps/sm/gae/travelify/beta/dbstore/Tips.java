package com.apps.sm.gae.travelify.beta.dbstore;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Ignore;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class Tips {

	@Id private Long tipsid;
	@Index private Long tripid;

	// user data
	@Index private String uid;
	@Unindex private String unickname;

	@Unindex private String tipsdata;
	@Unindex private String recommendplace;
	
	@Ignore private String uprofilestr;

	@Override
	public String toString() {
		return this.tipsdata + "&nbsp;&nbsp;By <b>" + this.unickname + "</b>";
	}

	public Long getTipsid() {
		return tipsid;
	}

	public void setTipsid(Long tipsid) {
		this.tipsid = tipsid;
	}

	public Long getTripid() {
		return tripid;
	}

	public void setTripid(Long tripid) {
		this.tripid = tripid;
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

	public String getTipsdata() {
		return tipsdata;
	}

	public void setTipsdata(String tipsdata) {
		this.tipsdata = tipsdata;
	}

	public String getRecommendplace() {
		return recommendplace;
	}

	public void setRecommendplace(String recommendplace) {
		this.recommendplace = recommendplace;
	}
	
	public String getUprofilestr() {
		return uprofilestr;
	}

	public void setUprofilestr(String uprofilestr) {
		this.uprofilestr = uprofilestr;
	}	
}
