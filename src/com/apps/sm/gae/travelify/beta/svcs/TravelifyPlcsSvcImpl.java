package com.apps.sm.gae.travelify.beta.svcs;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Service;

import com.apps.sm.gae.travelify.beta.cmn.TravelifyCmnUtil;
import com.apps.sm.gae.travelify.beta.models.AutocompleteQueryOptions;
import com.apps.sm.gae.travelify.beta.models.AutocompleteResult;
import com.apps.sm.gae.travelify.beta.models.Place;
import com.apps.sm.gae.travelify.beta.models.PlaceDetailResult;
import com.apps.sm.gae.travelify.beta.models.PlacesException;
import com.apps.sm.gae.travelify.beta.models.PlacesQueryOptions;
import com.apps.sm.gae.travelify.beta.models.PlacesResult;
import com.apps.sm.gae.travelify.beta.models.PlacesSuggestResult;
import com.claygregory.common.data.geo.GeoLocation;
import com.claygregory.common.net.URLBuilder;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Service("TravelifyPlcsSvcIfc")
public class TravelifyPlcsSvcImpl implements TravelifyPlcsSvc {

	private Gson gson;

	public TravelifyPlcsSvcImpl() {
		GsonBuilder gb = new GsonBuilder();
		gb.setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES);
		this.gson = gb.create();
	}

	public AutocompleteResult autocomplete(String input, boolean sensor) {
		return autocomplete(input, null, sensor);
	}

	public AutocompleteResult autocomplete(String input,
			AutocompleteQueryOptions options, boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(AUTOCOMPLETE_URL)
					.queryParam("key", apikey).queryParam("input", input)
					.queryParam("sensor", String.valueOf(sensor));

			if (options != null)
				for (String param : options.params().keySet())
					builder.queryParam(param, options.param(param));

			return TravelifyCmnUtil.parseAutocompleteResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public PlaceDetailResult detail(String reference, boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(DETAIL_URL)
					.queryParam("key", apikey)
					.queryParam("reference", reference)
					.queryParam("sensor", String.valueOf(sensor));

			return TravelifyCmnUtil.parseDetailResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public URL photoUrl(String photoReference, String maxHeight, String maxWidth, boolean sensor) {
		try {

			return URLBuilder
					.create(PHOTO_URL)
					.queryParam("key", apikey)
					.queryParam("photoreference", photoReference)
					.queryParam("sensor", String.valueOf(sensor))
					.queryParam("maxheight", maxHeight != null ? maxHeight : null)
					.queryParam("maxwidth", maxWidth != null ? maxWidth : null)
					.buildURL();

		} catch (MalformedURLException e) {
			throw new PlacesException(e);
		}
	}

	public PlacesResult search(float lat, float lon, int radius,
			PlacesQueryOptions options, boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(SEARCH_URL)
					.queryParam("key", apikey)
					.queryParam("location", lat + "," + lon)
					.queryParam("radius", String.valueOf(radius))
					.queryParam("sensor", String.valueOf(sensor));

			if (options != null)
				for (String param : options.params().keySet())
					builder.queryParam(param, options.param(param));

			// HttpGet get = new HttpGet( builder.buildURL( ).toString( ) );

			return TravelifyCmnUtil.parseSearchResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public PlacesResult search(float lat, float lon,
			PlacesQueryOptions options, boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(SEARCH_URL)
					.queryParam("key", apikey)
					.queryParam("location", lat + "," + lon)
					.queryParam("rankby", "distance")
					.queryParam("sensor", String.valueOf(sensor));

			if (options != null)
				for (String param : options.params().keySet())
					builder.queryParam(param, options.param(param));

			// HttpGet get = new HttpGet( builder.buildURL( ).toString( ) );

			return TravelifyCmnUtil.parseSearchResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public PlacesResult search(float lat, float lon, int radius, String query,
			boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(TXT_SEARCH_URL)
					.queryParam("key", apikey)
					.queryParam("location", lat + "," + lon)
					.queryParam("query", query)
					.queryParam("radius", String.valueOf(radius))
					.queryParam("sensor", String.valueOf(sensor));

			return TravelifyCmnUtil.parseSearchResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public PlacesResult search(String query, int radius, String type,
			boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(TXT_SEARCH_URL)
					.queryParam("key", apikey).queryParam("query", query)
					.queryParam("types", type)
					.queryParam("radius", String.valueOf(radius))
					.queryParam("sensor", String.valueOf(sensor));

			return TravelifyCmnUtil.parseSearchResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public PlacesResult search(String query, int radius, boolean sensor) {
		try {
			URLBuilder builder = URLBuilder.create(TXT_SEARCH_URL)
					.queryParam("key", apikey).queryParam("query", query)
					.queryParam("radius", String.valueOf(radius))
					.queryParam("sensor", String.valueOf(sensor));

			return TravelifyCmnUtil.parseSearchResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);
		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public PlacesResult search(GeoLocation location, boolean sensor) {
		return this.search(location, null, sensor);
	}

	public PlacesResult search(GeoLocation location,
			PlacesQueryOptions options, boolean sensor) {
		return this.search(location.getLatitude(), location.getLongitude(),
				location.getAccuracy() != null ? location.getAccuracy()
						: DEFAULT_RADIUS, options, sensor);
	}

	public PlacesResult search(String pageToken, boolean sensor) {

		try {
			URLBuilder builder = URLBuilder.create(SEARCH_URL)
					.queryParam("key", apikey)
					.queryParam("pagetoken", pageToken)
					.queryParam("sensor", String.valueOf(sensor));

			return TravelifyCmnUtil.parseSearchResponse(
					TravelifyCmnUtil.invokeUrl(builder), gson);

		} catch (Exception e) {
			throw new PlacesException(e);
		}
	}

	public Map<String, List<Place>> recommend(float lat, float lon, int radius,
			String query, int rsltsCount, boolean sensor) {

		Map<String, List<Place>> rsltmap = new TreeMap<String, List<Place>>();
		List<Place> americanList = null;
		List<Place> chineseList = null;
		List<Place> indianList = null;
		List<Place> italianList = null;
		List<Place> mexicanList = null;
		List<Place> mediterraneanList = null;

		if ("restaurant".equalsIgnoreCase(query)) {
			// search for american restaurants
			PlacesResult american_rslt = this.search(lat, lon, radius,
					"top+rated+american+restaurant", sensor);
			if (american_rslt.isOkay()) {
				americanList = updatePlaceList(american_rslt.asList(),
						rsltsCount);
				rsltmap.put("American Restaurants", americanList);
			}

			// search for asian restaurant
			PlacesResult asian_rslt = this.search(lat, lon, radius,
					"top+rated+thai+chienese+japanese+asian+restaurant", sensor);
			if (asian_rslt.isOkay()) {
				chineseList = updatePlaceList(asian_rslt.asList(), rsltsCount);
				rsltmap.put("Asian Restaurants", chineseList);
			}

			// search for Indian restaurants
			PlacesResult indian_rslt = this.search(lat, lon, radius,
					"top+rated+indian+restaurant", sensor);
			if (indian_rslt.isOkay()) {
				indianList = updatePlaceList(indian_rslt.asList(), rsltsCount);
				rsltmap.put("Indian Restaurants", indianList);
			}
			
			// search for Italian restaurants
			PlacesResult italian_rslt = this.search(lat, lon, radius,
					"top+rated+italian+restaurant", sensor);
			if (italian_rslt.isOkay()) {
				italianList = updatePlaceList(italian_rslt.asList(), rsltsCount);
				rsltmap.put("Italian Restaurants", italianList);
			}			

			// search for Mexican restaurants
			PlacesResult mexican_rslt = this.search(lat, lon, radius,
					"top+rated+mexican+restaurant", sensor);
			if (mexican_rslt.isOkay()) {
				mexicanList = updatePlaceList(mexican_rslt.asList(), rsltsCount);
				rsltmap.put("Mexican Restaurants", mexicanList);
			}			

			// search for mediterranean restaurants
			/*PlacesResult mediterranean_rslt = this.search(lat, lon, radius,
					"greek+mediterranean+restaurant", sensor);
			if (mediterranean_rslt.isOkay()) {
				mediterraneanList = updatePlaceList(mediterranean_rslt.asList(), rsltsCount);
				rsltmap.put("Greek/Mediterranean Restaurants", mediterraneanList);
			}*/	
			
		}

		return rsltmap;
	}

	public PlacesSuggestResult suggest(float lat, float lon, int radius,
			String keyword, int count, boolean sensor) {
		PlacesResult tmpresult = null;
		PlacesSuggestResult updtresult = new PlacesSuggestResult();

		tmpresult = this.search(lat, lon, radius, keyword, sensor);
		if (tmpresult != null && tmpresult.isOkay()) {
			List<Place> placeLst = null;
			placeLst = updatePlaceList(tmpresult.asList(), count);
			updtresult.setPlaces(placeLst);
		}

		return updtresult;
	}

	public PlacesSuggestResult suggest(String query, int radius, String type,
			int count, boolean sensor) {
		PlacesResult tmpresult = null;
		PlacesSuggestResult updtresult = new PlacesSuggestResult();

		tmpresult = this.search(query, radius, type, sensor);
		if (tmpresult != null && tmpresult.isOkay()) {
			List<Place> placeLst = null;
			placeLst = updatePlaceList(tmpresult.asList(), count);
			updtresult.setPlaces(placeLst);
		}

		return updtresult;
	}

	
	public PlacesSuggestResult suggest(String query, int radius, int count, 
			boolean sensor) {
		PlacesResult tmpresult = null;
		PlacesSuggestResult updtresult = new PlacesSuggestResult();

		tmpresult = this.search(query, radius, sensor);
		if (tmpresult != null && tmpresult.isOkay()) {
			List<Place> placeLst = null;
			placeLst = updatePlaceList(tmpresult.asList(), count);
			updtresult.setPlaces(placeLst);
		}

		return updtresult;
	}
	
	
	// this method returns a trip plan recommended places correspond to a Trip
	public Map<String, List<Place>> getTripPlanPlaces(String citynm, String[] plctypes) {

		Map<String, List<Place>> rsltmap = new LinkedHashMap<String, List<Place>>();
		if(plctypes!=null && plctypes.length>0) {
			for(int i=0;i<plctypes.length;i++) {
				
				if("BRK".equalsIgnoreCase(plctypes[i])) {
					// search for breakfast
					PlacesResult brkfst_rslt = this.search("breakfast+cafe+brunch+bakery+in+" + citynm,	10000, false);
					if (brkfst_rslt.isOkay()) {
						rsltmap.put("BRK", brkfst_rslt.asList());
					}
				}
				
				if("LCH".equalsIgnoreCase(plctypes[i])) {
					// search for Lunch
					PlacesResult lunch_rslt = this.search("popular+lunch+restaurants+in+" + citynm,	20000, false);
					if (lunch_rslt.isOkay()) {
						rsltmap.put("LCH", lunch_rslt.asList());
					}
				}
				
				if("DNR".equalsIgnoreCase(plctypes[i])) {
					// search for Dinner
					PlacesResult dinnr_rslt = this.search("top+rated+dinner+restaurants+in+" + citynm,	20000, false);
					if (dinnr_rslt.isOkay()) {
						rsltmap.put("DNR", dinnr_rslt.asList());
					}		
				}
				
				if("NCB".equalsIgnoreCase(plctypes[i])) {
					// search for nightlife
					PlacesResult nghtlf_rslt = this.search("popular+night+club+bar+casino+in+" + citynm,	20000, "casino|bowling_alley|night_club", false);
					if (nghtlf_rslt.isOkay()) {
						rsltmap.put("NCB", nghtlf_rslt.asList());
					}
				}
				
				if("CMT".equalsIgnoreCase(plctypes[i])) {
					// search for church
					PlacesResult church_rslt = this.search("church+in+" + citynm, 50000, "church", false);
					if (church_rslt.isOkay()) {
						rsltmap.put("CMT", church_rslt.asList());
					}
				}
				
				if("MOS".equalsIgnoreCase(plctypes[i])) {
					// search for mosque
					PlacesResult mosque_rslt = this.search("mosque+in+" + citynm, 50000, "mosque", false);
					if (mosque_rslt.isOkay()) {
						rsltmap.put("MOS", mosque_rslt.asList());
					}
				}
				
				if("TMP".equalsIgnoreCase(plctypes[i])) {
					// search for temple
					PlacesResult temple_rslt = this.search("temple+in+" + citynm, 50000, "hindu_temple", false);
					if (temple_rslt.isOkay()) {
						rsltmap.put("TMP", temple_rslt.asList());
					}
				}
				
				if("MSM".equalsIgnoreCase(plctypes[i])) {
					// search for Museum
					PlacesResult museum_rslt = this.search("popular+museum+and+art+gallery+and+city+hall+in+" + citynm,	50000, "museum|art_gallery|city_hall", false);
					if (museum_rslt.isOkay()) {
						rsltmap.put("MSM", museum_rslt.asList());
					}
				}
				
				if("ZAQ".equalsIgnoreCase(plctypes[i])) {
					// search for Zoo Aqurium
					PlacesResult zooAqrm_rslt = this.search("garden+zoo+and+aquarium+and+amusement+park+in+" + citynm,	50000, "zoo|aquarium|amusement_park", false);
					if (zooAqrm_rslt.isOkay()) {
						rsltmap.put("ZAQ", zooAqrm_rslt.asList());
					}
				}
				
				if("STR".equalsIgnoreCase(plctypes[i])) {
					// search for Sight seeing
					PlacesResult sghtsng_rslt = this.search("top+rated+sightseeing+tours+in+" + citynm,	50000, false);
					if (sghtsng_rslt.isOkay()) {
						rsltmap.put("STR", sghtsng_rslt.asList());
					}
				}
			}

		}

		return rsltmap;
	}

	private List<Place> updatePlaceList(List<Place> lstToUpdt, int rsltsCount) {
		int i = 0;
		List<Place> plcList = new ArrayList<Place>();

		if (rsltsCount > 0) {
			for (Place place : lstToUpdt) {
				plcList.add(place);
				i++;
				if (i == rsltsCount)
					break;
			}
		} else {
			plcList = lstToUpdt;
		}
		return plcList;
	}

}
