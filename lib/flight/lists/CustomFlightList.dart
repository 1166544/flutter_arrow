import 'package:flutter/material.dart';

class InheritedFlightListing extends InheritedWidget {

	final String toLocation;
	final String fromLocation;

	InheritedFlightListing({this.fromLocation, this.toLocation, Widget child}): super(child: child);

	@override
	bool updateShouldNotify(InheritedWidget oldWidget) {
		return true;
	}

	static InheritedFlightListing of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedFlightListing);
}