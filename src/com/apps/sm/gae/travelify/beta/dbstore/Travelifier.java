package com.apps.sm.gae.travelify.beta.dbstore;

import java.util.Arrays;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Ignore;
import com.googlecode.objectify.annotation.Unindex;

@Entity
public class Travelifier {
	
	@Id private String uid;
	
	@Unindex private String ugplusid;
	@Unindex private String uphoto;
	@Unindex private String ugplus;
	
	@Unindex private String[] followers;
	@Unindex private String[] following;
	
	@Ignore private int myboardscount;
	@Ignore private int mytripscount;
	@Ignore private int myclipscount;
	
	@Override
	public String toString() {
		return "Travelifier-" + uid + "][" + ugplusid + "][" + uphoto + "][" + ugplus + "][" + Arrays.toString(followers) + "][" + Arrays.toString(following) + "]";
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUgplusid() {
		return ugplusid;
	}
	public void setUgplusid(String ugplusid) {
		this.ugplusid = ugplusid;
	}
	public String getUphoto() {
		return uphoto;
	}
	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}
	public String getUgplus() {
		return ugplus;
	}
	public void setUgplus(String ugplus) {
		this.ugplus = ugplus;
	}
	public String[] getFollowers() {
		return followers;
	}
	public void setFollowers(String[] followers) {
		this.followers = followers;
	}
	public String[] getFollowing() {
		return following;
	}
	public void setFollowing(String[] following) {
		this.following = following;
	}

	public int getMyboardscount() {
		return myboardscount;
	}

	public void setMyboardscount(int myboardscount) {
		this.myboardscount = myboardscount;
	}

	public int getMytripscount() {
		return mytripscount;
	}

	public void setMytripscount(int mytripscount) {
		this.mytripscount = mytripscount;
	}

	public int getMyclipscount() {
		return myclipscount;
	}

	public void setMyclipscount(int myclipscount) {
		this.myclipscount = myclipscount;
	}
	
	
}
