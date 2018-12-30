import 'package:flighttickets/flight/CustomShapeClipper.dart';
import 'package:flighttickets/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Color discountBackgroundColor = Color(0xFfffE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFE6E6E6);

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

class FlightListingBottomPart extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(left: 16.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Text('Best Deals for Next 6 Months', style: dropDownMenuItemStyle)),
					SizedBox(height: 10.0),
					StreamBuilder(
						stream: Firestore.instance.collection('deals').snapshots(),
						builder: (context, snapshot) {
							return !snapshot.hasData ? Center(child: CircularProgressIndicator()) : _buildDealsList(context, snapshot.data.documents);
						},
					)
				],
			),
		);
	}
}

class FlightDetails {
	final String airlines;
	final String date;
	final String discount;
	final String rating;

	final int oldPrice;
	final int newPrice;

	FlightDetails.fromMap(Map<String, dynamic> map)
		: assert(map['airlines'] != null),
		  assert(map['date'] != null),
		  assert(map['discount'] != null),
		  assert(map['rating'] != null),
		  airlines = map['airlines'],
		  date = map['date'],
		  discount = map['discount'],
		  oldPrice = map['oldPrice'],
		  newPrice = map['newPrice'],
		  rating = map['rating'];

	FlightDetails.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);
}

class FlightCard extends StatelessWidget {
	final FlightDetails flightDetails;

	FlightCard({this.flightDetails});

	@override
	Widget build(BuildContext contenxt) {
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 8.0),
			child: Stack(
				children: <Widget>[
					this.getFlightCardContainer(),
					this.getFlightPositioned()
				],
			),
		);
	}

	/// 航班位置容器
	Widget getFlightPositioned() {
		return Positioned(
			top: 10.0,
			right: 0.0,
			child: Container(
				padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
				child: Text('${flightDetails.discount}%', style: TextStyle(color: appTheme.primaryColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
				decoration: BoxDecoration(color: discountBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(10.0))),
			)
		);
	}

	/// 航班信息容器
	Widget getFlightCardContainer() {
		return Container(
			margin: const EdgeInsets.only(right: 16.0),
			decoration: BoxDecoration(
				borderRadius: BorderRadius.all(Radius.circular(10.0)),
				border: Border.all(color: flightBorderColor)
			),
			child: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Row(
							children: <Widget>[
								Text('${formatCurrency.format(flightDetails.newPrice)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
								SizedBox(width: 4.0),
								Text('(${formatCurrency.format(flightDetails.oldPrice)})', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, decoration: TextDecoration.lineThrough, color: Colors.grey),)
							],
						),
						Wrap(
							spacing: 8.0,
							runSpacing: -8.0,
							children: <Widget>[
								FlightDetailChip(Icons.calendar_today, '${flightDetails.date}'),
								FlightDetailChip(Icons.flight_takeoff, '${flightDetails.airlines}'),
								FlightDetailChip(Icons.star, '${flightDetails.rating}'),
							],
						)
					],
				),
			),
		);
	}
}

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

class FlightListTopPart extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				this.getFlightClipPath(),
				this.getFlightColumn(context)
			],
		);
	}

	Widget getFlightColumn(BuildContext context) {
		return Column(
			children: <Widget>[
				SizedBox(height: 20.0),
				Card(
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
					margin: EdgeInsets.symmetric(horizontal: 16.0),
					elevation: 10.0,
					child: Container(
						padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
						child: Row(
							mainAxisSize: MainAxisSize.max,
							children: <Widget>[
								Expanded(
									flex: 5,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											Text('${InheritedFlightListing.of(context).fromLocation}', style: TextStyle(fontSize: 16.0)),
											Divider(color: Colors.grey, height: 20.0),
											Text('${InheritedFlightListing.of(context).toLocation}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
										],
									),
								),
								Spacer(),
								Expanded(
									flex: 1,
									child: Icon(
										Icons.import_export, color: Colors.black, size: 32.0
									)
								)
							],
						),
					),
				)
			],
		);
	}

	Widget getFlightClipPath() {
		return ClipPath(
			clipper: CustomShapeClipper(),
			child: Container(
				decoration: BoxDecoration(gradient: LinearGradient(colors: [firstColor, secondColor])),
				height: 160.0,
			),
		);
	}
}

Widget _buildDealsList(BuildContext context, List<DocumentSnapshot> snapshots) {
	return ListView.builder(
		shrinkWrap: true,
		itemCount: snapshots.length,
		physics: ClampingScrollPhysics(),
		scrollDirection: Axis.vertical,
		itemBuilder: (context, index) {
			return FlightCard(flightDetails: FlightDetails.fromSnapshot(snapshots[index]));
		},
	);
}
