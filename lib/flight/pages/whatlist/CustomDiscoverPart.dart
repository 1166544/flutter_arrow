import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomDiscoverClipper.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeChoiceChip.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightListingScreen.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeLocation.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeChoiceChip.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightList.dart';
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
	 * 添加位置
	 *
	 * @param context 上下文
	 * @param snapshots 列表数据
	 * @returns
	 *
	 */
	void addLocations(BuildContext context, List<Location> snapshots) {
		for(int i = 0; i < snapshots.length; i++) {
			final Location location = snapshots[i];
			this.locations.add(location.name);
		}
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
		return Column(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			mainAxisSize: MainAxisSize.min,
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
							padding: EdgeInsets.all(5),
							child: ClipRRect(
								borderRadius: BorderRadius.all(Radius.circular(50.0)),
								child: Image.asset('assets/images/pic10.png', width: 45, height: 45)
							),
						)
					],
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

	/**
	 * 绘制类型选择按钮
	 */
	Widget buildFlightSelectButton() {
		return Row(
			mainAxisSize: MainAxisSize.min,
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			children: <Widget>[
				InkWell(
					child: ChoiceChipIcon(
						Icons.flight_takeoff,
						'Flights',
						this.isFlightSelected
					),
					onTap: () {
						// setState(() {
						// 	this.isFlightSelected = true;
						// });
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
						// setState(() {
						// 	this.isFlightSelected = false;
						// });
					},
				)
			],
		);
	}

	/**
	 * 绘制搜索输入框
	 */
	Widget buildSearchContainer() {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 32.0),
			child: Material(
				elevation: 5.0,
				borderRadius: BorderRadius.all(Radius.circular(30.0)),
				child: TextField(
					controller: this._searchFieldController,
					style: dropDownMenuItemStyle,
					cursorColor: appTheme.primaryColor,
					decoration: InputDecoration(
						contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
						suffixIcon: Material(
							elevation: 2.0,
							borderRadius: BorderRadius.all(Radius.circular(30.0)),
							child: InkWell(
								// onTap: () {
								// 	this.navigateToSearchDetailPage(context);
								// },
								child: Icon(Icons.search, color: Colors.black),
							),
						),
						border: InputBorder.none
					)
				),
			),
		);
	}

	/**
	 * 跳转至搜索页
	 */
	void navigateToSearchDetailPage(BuildContext context) {
		Navigator.push(context, MaterialPageRoute(
			builder: (context) =>
				InheritedFlightListing(													// 跳转子页
					fromLocation: this.locations[this.selectedLocationIndex],			// FROM
					toLocation: _searchFieldController.text,							// TO
					child: FlightListingScreen(),										// 跳转后打开的目标页面
				)
		));
	}

	/**
	 * 绘制主标题
	 */
	Widget buildMainTitle() {
		return Text(
			'Where would\nyou want to go?',
			style: TextStyle(fontSize: 26.0, color: Colors.black, fontWeight: FontWeight.bold),
			textAlign: TextAlign.center
		);
	}

	/**
	 * 顶部导航菜单
	 *
	 * @param context 上下文
	 */
    Widget buildTopNavMenu(BuildContext context) {
		return Container(
			child: Text('Discover', style: TextStyle(fontSize: 30, color: Color(0xff000000), fontWeight: FontWeight.bold)),
		);
	}

	/// 创建下拉菜单数据列表
	List<PopupMenuItem<int>> _buildPopupMenuItem() {
		List<PopupMenuItem<int>> popupMenuItems = List();
		for (int i = 0; i < this.locations.length; i++) {
			popupMenuItems.add(
				PopupMenuItem(
					child: Text(this.locations[i], style: dropDownMenuItemStyle),
					value: i,
				)
			);
		}

		return popupMenuItems;
	}
}
