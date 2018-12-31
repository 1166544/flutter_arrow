import 'package:flutter/material.dart';
import 'package:flighttickets/flight/lists/CustomFlightListTopPart.dart';
import 'package:flighttickets/flight/lists/CustomFlightListingBottomPart.dart';

class FlightListingScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('Search Result'), elevation: 0.0, centerTitle: true, leading: InkWell(child: Icon(Icons.arrow_back), onTap: () { Navigator.maybePop(context); })),
			body: SingleChildScrollView(
				scrollDirection: Axis.vertical,
				child: Column(
					children: <Widget>[
						FlightListTopPart(),
						SizedBox(height: 20.0),
						FlightListingBottomPart()
					],
				),
			),
		);
	}
}
