package com.apps.sm.gae.travelify.beta.models;

import java.net.URL;
import java.util.Collections;
import java.util.List;

public class PlaceDetail extends Place {

	//private List<AddressComponent> addressComponents = Collections.emptyList( );
	
	//private List<PlaceEvent> events = Collections.emptyList( );
	
	private String formattedPhoneNumber;
	
	private String internationalPhoneNumber;
	
	private Integer priceLevel;
	
	private List<Review> reviews = Collections.emptyList( );
	
	//private Integer utcOffset;

	private URL website;

	/*public List<AddressComponent> getAddressComponents( ) {
		return this.addressComponents;
	}*/
	
	/*public List<PlaceEvent> getEvents( ) {
		return this.events;
	}*/
	
	public String getFormattedPhoneNumber( ) {
		return this.formattedPhoneNumber;
	}
	public String getInternationalPhoneNumber( ) {
		return this.internationalPhoneNumber;
	}

	public Integer getPriceLevel( ) {
		return this.priceLevel;
	}

	public List<Review> getReviews( ) {
		return this.reviews;
	}

	/*public Integer getUtcOffset( ) {
		return this.utcOffset;
	}
*/
	public URL getWebsite( ) {
		return this.website;
	}
}
