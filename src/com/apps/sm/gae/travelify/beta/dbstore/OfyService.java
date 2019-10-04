package com.apps.sm.gae.travelify.beta.dbstore;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

public class OfyService {
	// Register our models with Objectify. If you add a new model, make sure to
	// register it here as well.
	static {
		factory().register(Trip.class);
		factory().register(TripPlan.class);
		factory().register(Tips.class);
		factory().register(ClippedPlace.class);
		factory().register(Board.class);
		factory().register(Travelifier.class);
		factory().register(BoardComment.class);
	}

	/**
	 * @return Objectify instance to use for datastore interaction.
	 */
	public static Objectify ofy() {
		return ObjectifyService.ofy();
	}

	/**
	 * @return Factory for Objectify instances.
	 */
	public static ObjectifyFactory factory() {
		return ObjectifyService.factory();
	}
}
