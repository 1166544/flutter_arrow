import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomShapeClipper.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/home/CustomHomeChoiceChip.dart';
import 'package:flighttickets/flight/lists/CustomFlightListingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flighttickets/flight/home/CustomHomeLocation.dart';
import 'package:flighttickets/flight/home/CustomHomeChoiceChip.dart';
import 'package:flighttickets/flight/lists/CustomFlightList.dart';

/// 主页类
class HomeScreenTopPart extends StatefulWidget {
	@override
	_HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
	var selectedLocationIndex = 0;
	var isFlightSelected = true;

	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				ClipPath(
					clipper: CustomShapeClipper(),
					child: Container(
						height: 400.0,
						decoration: BoxDecoration(
							gradient: LinearGradient(colors: [firstColor, secondColor])
						),
						child: Column(
							children: <Widget>[
								SizedBox(height: 50.0),
								this.getStreamBuilder(context),
								SizedBox(height: 50.0),
								this.getColumnText(),
								SizedBox(height: 30.0),
								this.getColumnPadding(),
								SizedBox(height: 20.0),
								this.getColumnRow(),
							],
						),
					),
				)
			],
		);
	}

	Widget getColumnRow() {
		return Row(
			mainAxisSize: MainAxisSize.min,
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			children: <Widget>[
				InkWell(
					child: ChoiceChipIcon(
						Icons.flight_takeoff, 'Flights', this.isFlightSelected
					),
					onTap: () {
						setState(() {
							this.isFlightSelected = true;
						});
					},
				),
				SizedBox(width: 20.0),
				InkWell(
					child: ChoiceChipIcon(
						Icons.hotel,
						'Hotels',
						!this.isFlightSelected
					),
					onTap: () {
						setState(() {
							this.isFlightSelected = false;
						});
					},
				)
			],
		);
	}

	Widget getColumnPadding() {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 32.0),
			child: Material(
				elevation: 5.0,
				borderRadius: BorderRadius.all(Radius.circular(30.0)),
				child: TextField(
					controller: _searchFieldController,
					style: dropDownMenuItemStyle,
					cursorColor: appTheme.primaryColor,
					decoration: InputDecoration(
						contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
						suffixIcon: Material(
							elevation: 2.0,
							borderRadius: BorderRadius.all(Radius.circular(30.0)),
							child: InkWell(
								onTap: () {
									this.navigateToPageRoute(context);
								},
								child: Icon(Icons.search, color: Colors.black),
							),
						),
						border: InputBorder.none
					)
				),
			),
		);
	}

	navigateToPageRoute(BuildContext context) {
		Navigator.push(context, MaterialPageRoute(
			builder: (context) =>
				InheritedFlightListing(
					fromLocation: locations[this.selectedLocationIndex],
					toLocation: _searchFieldController.text,
					child: FlightListingScreen(),
				)
		));
	}

	Widget getColumnText() {
		return Text(
			'Where would\nyou want to go?',
			style: TextStyle(fontSize: 24.0, color: Colors.white),
			textAlign: TextAlign.center
		);
	}

    Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder(
			stream: Firestore.instance.collection('locations').snapshots(),
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					addLocations(context, snapshot.data.documents);
				}

				return !snapshot.hasData
				? Container()
				: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Row(
						children: <Widget>[
							Icon(Icons.location_on, color: Colors.white),
							SizedBox(width: 16.0),
							PopupMenuButton(
								onSelected: (index) {
									setState(() {
										this.selectedLocationIndex = index;
									});
								},
								child: Row(
									children: <Widget>[
										Text(locations[this.selectedLocationIndex], style: dropDownLabelStyle),
										Icon(Icons.keyboard_arrow_down, color: Colors.white)
									],
								),
								itemBuilder: (BuildContext context) => _buildPopupMenuItem(),
							),
							Spacer(),
							Icon(Icons.settings, color: Colors.white)
						],
					),
				);
			},
		);
	}
}

List<String> locations = List();
final _searchFieldController = TextEditingController();

addLocations(BuildContext context, List<DocumentSnapshot> snapshots) {
	for(int i = 0; i < snapshots.length; i++) {
		final Location location = Location.fromSnapshot(snapshots[i]);
		locations.add(location.name);
	}
}

List<PopupMenuItem<int>> _buildPopupMenuItem() {
	List<PopupMenuItem<int>> popupMenuItems = List();
	for (int i = 0; i < locations.length; i++) {
		popupMenuItems.add(
			PopupMenuItem(
				child: Text(locations[i], style: dropDownMenuItemStyle),
				value: i,
			)
		);
	}

	return popupMenuItems;
}
