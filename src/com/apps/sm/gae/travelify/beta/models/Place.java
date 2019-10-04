package com.apps.sm.gae.travelify.beta.models;

import java.util.Collections;
import java.util.List;
import java.util.Set;

import com.claygregory.common.data.geo.GeoLocation;

public class Place {
	
	public static class Geometry {
		
		private Location location;

		public Location getLocation( ) {
			return this.location;
		}

		@Override
		public String toString( ) {
			return this.getLocation( ).toString( );
		}
		
	}
	
	public static class Location implements GeoLocation {
		
		private float lat;

		private float lng;

		@Override
		public Integer getAccuracy( ) {
			return null;
		}

		@Override
		public float getLatitude( ) {
			return this.lat;
		}

		@Override
		public float getLongitude( ) {
			return this.lng;
		}
		
		@Override
		public String toString( ) {
			return this.getLatitude( ) + ", " + this.getLongitude( );
		}
		
	}
		
	private String formattedAddress;
	
	private Geometry geometry;
		
	private String icon;
	
	private String id;
	
	private String name;
	
	private Float rating;
	
	private String reference;

	private Set<String> types = Collections.emptySet( );

	private String url;

	private String vicinity;
	
	private OpeningHours openingHours;
	
	private List<PlacePhoto> photos = Collections.emptyList( );
	
	private boolean clipped;
	
		
	public String getFormattedAddress( ) {
		return this.formattedAddress;
	}

	public Geometry getGeometry( ) {
		return this.geometry;
	}

	public String getIcon( ) {
		return this.icon;
	}

	public String getId( ) {
		return this.id;
	}

	public String getName( ) {
		return this.name;
	}

	public Float getRating( ) {
		return this.rating;
	}

	public String getReference( ) {
		return this.reference;
	}

	public Set<String> getTypes( ) {
		return this.types;
	}

	public String getUrl( ) {
		return this.url;
	}

	public String getVicinity( ) {
		return this.vicinity;
	}

	public List<PlacePhoto> getPhotos() {
		return photos;
	}

	public OpeningHours getOpeningHours() {
		return this.openingHours;
	}

	public boolean isClipped() {
		return clipped;
	}

	public void setClipped(boolean clipped) {
		this.clipped = clipped;
	}
}
