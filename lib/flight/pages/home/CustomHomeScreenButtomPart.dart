import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/styles/CustomViewAllStyle.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeCityCard.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeCity.dart';
import 'dart:async';

/// 底部布局
class HomeScreenBottomPart extends StatelessWidget {

	StreamController<List<City>> _cities = new StreamController<List<City>>();

	HomeScreenBottomPart() {
		// hole
	}

	/**
	 *  初始化数据
	 */
	_initStremData() {
		_cities.add([new City(), new City()]);
	}

	@override
	Widget build(BuildContext context) {
		return Column(
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
						stream: _cities.stream,
						initialData: _initStremData(),
						builder: (context, snapshot) {
							print('${snapshot.hasData}');
							return !snapshot.hasData
								? Center(child: CircularProgressIndicator())
								: this._buildCitiesList(context, snapshot.data);
						},
					),
				)
			],
		);
	}

	/// 构建城市列表
	Widget _buildCitiesList(BuildContext context, List<City> snapshots) {
		return ListView.builder(
			itemCount: snapshots.length,
			scrollDirection: Axis.horizontal,
			itemBuilder: (context, index) {
				return CityCard(city: snapshots[index]);
			},
		);
	}

}
