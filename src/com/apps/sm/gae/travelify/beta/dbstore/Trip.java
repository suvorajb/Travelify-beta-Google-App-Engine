package com.apps.sm.gae.travelify.beta.dbstore;

import java.util.Date;
import java.util.List;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Ignore;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class Trip {

	@Id private Long tripid;
	@Index private String triptitle;
	@Index private String tripplace;
	
	@Unindex private int tripduration;
	@Unindex private String tripseason;
	@Unindex private String triptype;
	@Unindex private String[] favcuisines;
	
	// status for Public for publicly shared trips
	@Index private String status;
	@Index private String flagcompltd;
	@Unindex private Date createddt;
	@Unindex private String tripnote;
	@Unindex private String[] recommendneeded;

	// user data
	@Index private String uid;
	@Index private String unickname;
	@Unindex private String uemailid;

	// hotel data
	@Unindex private float lat;
	@Unindex private float lng;
	@Unindex private String hname;
	@Unindex private String haddress;
	//@Unindex private String hreference;
	
	@Ignore private int tripplancount;
	@Ignore private int tipscount;
	@Ignore private List<Tips> tips;
	@Ignore private String tripstaticmap;
	@Ignore private String publshddatestr;
	@Ignore private String uprofilestr;
	@Ignore private String shorttitle;
	
	@Override
	public String toString() {
		return "Trip - [" + triptitle + "][" + tripplace + "][" + tripduration + "][" + tripseason + "][" + triptype + "][" + favcuisines + "][" + lat + "][" + lng + "]["+ hname +"]";
	}
	
	public Long getTripid() {
		return tripid;
	}
	public void setTripid(Long tripid) {
		this.tripid = tripid;
	}
	public String getTriptitle() {
		return triptitle;
	}
	public void setTriptitle(String triptitle) {
		this.triptitle = triptitle;
	}
	public String getTripplace() {
		return tripplace;
	}
	public void setTripplace(String tripplace) {
		this.tripplace = tripplace;
	}
	public int getTripduration() {
		return tripduration;
	}
	public void setTripduration(int tripduration) {
		this.tripduration = tripduration;
	}
	public String getTripseason() {
		return tripseason;
	}
	public void setTripseason(String tripseason) {
		this.tripseason = tripseason;
	}
	public String getTriptype() {
		return triptype;
	}
	public void setTriptype(String triptype) {
		this.triptype = triptype;
	}
	public String[] getFavcuisines() {
		return favcuisines;
	}
	public void setFavcuisines(String[] favcuisines) {
		this.favcuisines = favcuisines;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreateddt() {
		return createddt;
	}
	public void setCreateddt(Date createddt) {
		this.createddt = createddt;
	}
	public String getTripnote() {
		return tripnote;
	}
	public void setTripnote(String tripnote) {
		this.tripnote = tripnote;
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
	public String getUemailid() {
		return uemailid;
	}
	public void setUemailid(String uemailid) {
		this.uemailid = uemailid;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHaddress() {
		return haddress;
	}
	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}
	/*public String getHreference() {
		return hreference;
	}
	public void setHreference(String hreference) {
		this.hreference = hreference;
	}*/

	public String getFlagcompltd() {
		return flagcompltd;
	}

	public int getTripplancount() {
		return tripplancount;
	}

	public void setFlagcompltd(String flagcompltd) {
		this.flagcompltd = flagcompltd;
	}

	public void setTripplancount(int tripplancount) {
		this.tripplancount = tripplancount;
	}

	public List<Tips> getTips() {
		return tips;
	}

	public void setTips(List<Tips> tips) {
		this.tips = tips;
	}

	public int getTipscount() {
		return tipscount;
	}

	public void setTipscount(int tipscount) {
		this.tipscount = tipscount;
	}

	public String getTripstaticmap() {
		return tripstaticmap;
	}

	public void setTripstaticmap(String tripstaticmap) {
		this.tripstaticmap = tripstaticmap;
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

	public String[] getRecommendneeded() {
		return recommendneeded;
	}

	public void setRecommendneeded(String[] recommendneeded) {
		this.recommendneeded = recommendneeded;
	}
}
