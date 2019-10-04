package com.apps.sm.gae.travelify.beta.dbstore;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class TripPlan {

	@Id private Long tripplanid;

	@Index private Long tripid;
	@Index private String triptitle;
	@Index private String tripplace;
	
	@Unindex private String[] brkfstplaces;
	//@Unindex private String brkfstnote;

	@Unindex private String[] lunchplaces;
	//@Unindex private String lunchnote;

	@Unindex private String[] dinnrplaces;
	//@Unindex private String dinnrnote;

	@Unindex private String[] sightseeingtours;
	@Unindex private String[] nghtlifeplaces;
	@Unindex private String[] temples;
	@Unindex private String[] mosques;
	@Unindex private String[] churches;	
	@Unindex private String[] artgalleries;
	@Unindex private String[] zoo_aquariums;
	//@Unindex private String[] amusmntparks;
	//@Unindex private String[] shoppingmalls;

	@Unindex private String tripplannote;
	@Unindex private Date plancrtddt;	
	
	
	public Long getTripplanid() {
		return tripplanid;
	}
	public void setTripplanid(Long tripplanid) {
		this.tripplanid = tripplanid;
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
	public Date getPlancrtddt() {
		return plancrtddt;
	}
	public void setPlancrtddt(Date plancrtddt) {
		this.plancrtddt = plancrtddt;
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
