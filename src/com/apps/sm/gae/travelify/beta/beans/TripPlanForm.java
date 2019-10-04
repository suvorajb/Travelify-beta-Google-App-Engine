package com.apps.sm.gae.travelify.beta.beans;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.apps.sm.gae.travelify.beta.models.Place;

public class TripPlanForm {
	
	private Long tripid;
	private String triptitle;	
	private String tripplace;
	
	private String[] brkfstplaces;
	//private String brkfstnote;
	
	private String[] lunchplaces;
	//private String lunchnote;
	
	private String[] dinnrplaces;
	//private String dinnrnote;
	
	private String[] sightseeingtours;
	
	private String[] nghtlifeplaces;
	
	private String[] temples;

	private String[] mosques;
	
	private String[] churches;
	
	private String[] artgalleries;
	
	private String[] zoo_aquariums;
	
	//private String[] amusmntparks;
	//private String[] shoppingmalls;

	private String tripplannote;
		
	private Map<String, List<Place>> rsltmap;
	
	@Override
	public String toString() {
		return "Trip Plan - [" + tripid + "][" + triptitle + "][" + tripplace + "][" + Arrays.toString(brkfstplaces) + "][" + Arrays.toString(lunchplaces) + "][" + Arrays.toString(dinnrplaces) 
				+ "][" + Arrays.toString(sightseeingtours) + "][" + Arrays.toString(artgalleries) + "]["+ Arrays.toString(zoo_aquariums) +"]";
	}
	
	
	public Long getTripid() {
		return tripid;
	}
	public void setTripid(Long tripid) {
		this.tripid = tripid;
	}
	public String[] getBrkfstplaces() {
		return brkfstplaces;
	}
	public void setBrkfstplaces(String[] brkfstplaces) {
		this.brkfstplaces = brkfstplaces;
	}
	/*public String getBrkfstnote() {
		return brkfstnote;
	}
	public void setBrkfstnote(String brkfstnote) {
		this.brkfstnote = brkfstnote;
	}*/
	public String[] getLunchplaces() {
		return lunchplaces;
	}
	public void setLunchplaces(String[] lunchplaces) {
		this.lunchplaces = lunchplaces;
	}
	/*public String getLunchnote() {
		return lunchnote;
	}
	public void setLunchnote(String lunchnote) {
		this.lunchnote = lunchnote;
	}*/
	public String[] getDinnrplaces() {
		return dinnrplaces;
	}
	public void setDinnrplaces(String[] dinnrplaces) {
		this.dinnrplaces = dinnrplaces;
	}
	/*public String getDinnrnote() {
		return dinnrnote;
	}
	public void setDinnrnote(String dinnrnote) {
		this.dinnrnote = dinnrnote;
	}*/
	public String[] getSightseeingtours() {
		return sightseeingtours;
	}
	public void setSightseeingtours(String[] sightseeingtours) {
		this.sightseeingtours = sightseeingtours;
	}
	public String[] getNghtlifeplaces() {
		return nghtlifeplaces;
	}
	public void setNghtlifeplaces(String[] nghtlifeplaces) {
		this.nghtlifeplaces = nghtlifeplaces;
	}
	public String[] getTemples() {
		return temples;
	}
	public void setTemples(String[] temples) {
		this.temples = temples;
	}
	public String[] getArtgalleries() {
		return artgalleries;
	}
	public void setArtgalleries(String[] artgalleries) {
		this.artgalleries = artgalleries;
	}
	public String[] getZoo_aquariums() {
		return zoo_aquariums;
	}
	public void setZoo_aquariums(String[] zoo_aquariums) {
		this.zoo_aquariums = zoo_aquariums;
	}
	/*public String[] getAmusmntparks() {
		return amusmntparks;
	}
	public void setAmusmntparks(String[] amusmntparks) {
		this.amusmntparks = amusmntparks;
	}
	public String[] getShoppingmalls() {
		return shoppingmalls;
	}
	public void setShoppingmalls(String[] shoppingmalls) {
		this.shoppingmalls = shoppingmalls;
	}*/
	public Map<String, List<Place>> getRsltmap() {
		return rsltmap;
	}
	public void setRsltmap(Map<String, List<Place>> rsltmap) {
		this.rsltmap = rsltmap;
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
	public String getTripplannote() {
		return tripplannote;
	}
	public void setTripplannote(String tripplannote) {
		this.tripplannote = tripplannote;
	}


	public String[] getMosques() {
		return mosques;
	}


	public void setMosques(String[] mosques) {
		this.mosques = mosques;
	}


	public String[] getChurches() {
		return churches;
	}


	public void setChurches(String[] churches) {
		this.churches = churches;
	}
	
	
}
