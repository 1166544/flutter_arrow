import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/styles/CustomViewAllStyle.dart';
import 'package:flighttickets/flight/home/CustomHomeCityCard.dart';
import 'package:flighttickets/flight/home/CustomHomeCity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var homeScreenBottomPart = Column(
	children: <Widget>[
		Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
			child: Row(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Text('Currently Watched Items', style: dropDownMenuItemStyle),
					Spacer(),
					Text('VIEW ALL(12)', style: viewAllStyle)
				],
			),
		),
		Container(
			height: 240.0,
			child: StreamBuilder(
				stream: Firestore.instance.collection('cities').orderBy('newPrice').snapshots(),
				builder: (context, snapshot) {
					print('${snapshot.hasData}');
					return !snapshot.hasData
						? Center(child: CircularProgressIndicator())
						: _buildCitiesList(context, snapshot.data.documents);
				},
			),
		)
	],
);

/// 构建城市列表
Widget _buildCitiesList(BuildContext context, List<DocumentSnapshot> snapshots) {
	return ListView.builder(
		itemCount: snapshots.length,
		scrollDirection: Axis.horizontal,
		itemBuilder: (context, index) {
			return CityCard(city: City.fromSnapshot(snapshots[index]));
		},
	);
}
