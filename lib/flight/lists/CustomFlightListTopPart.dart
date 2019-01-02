import 'package:flutter/material.dart';
import 'package:flighttickets/flight/lists/CustomFlightList.dart';
import 'package:flighttickets/flight/styles/CustomShapeClipper.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';

/// 搜索结果页顶部内容
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
