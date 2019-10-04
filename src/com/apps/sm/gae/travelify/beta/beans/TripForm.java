package com.apps.sm.gae.travelify.beta.beans;



public class TripForm {

	private String triptitle;
	private String tripplace;

	private int tripduration;
	private String tripseason;
	private String triptype;
	private String[] favcuisines;

	private String hotelnm;
	private String hoteladdr;
	private String hotelrdo;
	
	private String status;
	private String tripnote;
	private String[] recommendneeded;

	@Override
	public String toString() {
		
		return "[" + triptitle + "][" + tripplace + "][" + tripduration + "]["
				+ tripseason + "][" + triptype + "][" + favcuisines + "]["
				+ hotelnm + "][" + hoteladdr + "]["+ hotelrdo +"]";
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

	public String getHotelnm() {
		return hotelnm;
	}

	public void setHotelnm(String hotelnm) {
		this.hotelnm = hotelnm;
	}

	public String getHoteladdr() {
		return hoteladdr;
	}

	public void setHoteladdr(String hoteladdr) {
		this.hoteladdr = hoteladdr;
	}

	public String getHotelrdo() {
		return hotelrdo;
	}

	public void setHotelrdo(String hotelrdo) {
		this.hotelrdo = hotelrdo;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getTripnote() {
		return tripnote;
	}
	
	public void setTripnote(String tripnote) {
		this.tripnote = tripnote;
	}

	public String[] getRecommendneeded() {
		return recommendneeded;
	}

	public void setRecommendneeded(String[] recommendneeded) {
		this.recommendneeded = recommendneeded;
	}
}
