package com.apps.sm.gae.travelify.beta.beans;

public class TipsForm {

	private String recommendplace;
	private Long tripid;
	private String tips;
	
	public Long getTripid() {
		return tripid;
	}
	public void setTripid(Long tripid) {
		this.tripid = tripid;
	}
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}
	public String getRecommendplace() {
		return recommendplace;
	}
	public void setRecommendplace(String recommendplace) {
		this.recommendplace = recommendplace;
	}	
}
