
import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';

class FlightDetailChip extends StatelessWidget {
	final IconData iconData;
	final String label;

	FlightDetailChip(this.iconData, this.label);

	@override
	Widget build(BuildContext context) {
		return RawChip(
			label: Text(label),
			labelStyle: TextStyle(color: Colors.black, fontSize: 14.0),
			backgroundColor: chipBackgroundColor,
			avatar: Icon(iconData, size: 14.0),
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
		);
	}
}
