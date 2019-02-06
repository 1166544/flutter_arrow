import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomDiscoverClipper.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeLocation.dart';
import 'dart:async';


class CustomDiscoverPart extends StatelessWidget {
	var selectedLocationIndex = 0;
	var isFlightSelected = true;
	final _searchFieldController = TextEditingController();
	final List<String> locations = List();
	StreamController<List<Location>> _locationsData = new StreamController<List<Location>>();


	CustomDiscoverPart() {
		// hole
	}

	/**
	 * 初始化数据
	 */
	_initStremData() {
		this._locationsData.add([new Location(), new Location()]);
	}

	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				// 曲线背景和标题
				this.buildDiscoverTitle(),
				// 星空背景图片
				this.buildBackground(),
				// 背景图片内容
				this.buildBackgroundContent()
			],
		);
	}

	/**
	 * 背景图片内容
	 */
	Widget buildBackgroundContent() {
		return Padding(
			padding: EdgeInsets.fromLTRB(45.0, 120.0, 50.0, 0),
			child: Column(
				children: <Widget>[
					// 主标题
					Text(
						'Back to Nature Camping Under the Star',
						style: TextStyle(
							fontSize: 32,
							fontWeight: FontWeight.bold,
							color: Colors.white,
							letterSpacing: 0,
							height: 0.9
						)
					),
					// 地理位置
					Padding(
						padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
						child: Row(
							children: <Widget>[
							Icon(Icons.location_on, color: Colors.white, size: 19.0,),
							Padding(
								padding: EdgeInsets.symmetric(horizontal: 9.0),
								child: Text('Labuan Bajo, NTT. Indonesia', style: TextStyle(color: Colors.white54)),
							)
						]),
					),
					// 占位高度
					SizedBox(height: 180),
					// 当前用户头像
					this.buildCurrentUser()
				],
			),
		);
	}

	/**
	 * 当前用户头像
	 */
	Widget buildCurrentUser() {
		return Row(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisSize: MainAxisSize.max,
			children: <Widget>[
				// 圆角头像
				Stack(
					children: <Widget>[
						ClipRRect(
							borderRadius: BorderRadius.all(Radius.circular(50.0)),
							child: Container(
								width: 60,
								height: 60,
								color: Colors.grey,
							)
						),
						Container(
							width: 60,
							height: 60,
							padding: EdgeInsets.all(4),
							child: ClipRRect(
								borderRadius: BorderRadius.all(Radius.circular(50.0)),
								child: Image.asset('assets/images/pic10.png', width: 50, height: 50)
							),
						)
					],
				),
				Padding(
					padding: EdgeInsets.symmetric(horizontal: 16.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text('Guided by', style: TextStyle(color: Colors.grey)),
							Text('Jonathan William', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
						],
					)
				)
			],
		);
	}

	/**
	 * 星空背景图片
	 */
	Widget buildBackground() {
		return Padding(
			padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0),
			child: Image.asset('assets/images/sky.png'),
		);
	}

	/**
	 * 曲线背景和标题
	 */
	Widget buildDiscoverTitle() {
		return ClipPath(
			clipper: CustomDiscoverClipper(),
			child: Container(
				height: 530.0,
				decoration: BoxDecoration(
					gradient: LinearGradient(colors: [firstColor, secondColor])
				),
				child: Row(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Padding(
							padding: EdgeInsets.fromLTRB(18.0, 38.0, 0, 0),
							child: Text('Discover', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
						)
					],
				),
			),
		);
	}
}
