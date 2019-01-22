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
				ClipPath(
					clipper: CustomDiscoverClipper(),
					child: Container(
						height: 400.0,
						decoration: BoxDecoration(
							gradient: LinearGradient(colors: [firstColor, secondColor])
						),
						child: Column(
							children: <Widget>[
								SizedBox(height: 50.0),
								this.buildTopNavMenu(context),									// 顶部导航菜单
								SizedBox(height: 50.0),
								this.buildMainTitle(),											// 绘制主标题
								SizedBox(height: 30.0),
								this.buildSearchContainer(),									// 绘制搜索输入框
								SizedBox(height: 20.0),
								this.buildFlightSelectButton(),
							],
						),
					),
				)
			],
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
		return StreamBuilder(
			stream: this._locationsData.stream,
			initialData: _initStremData(),
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					this.addLocations(context, snapshot.data);
				}

				return !snapshot.hasData
				? Container()
				: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Row(
						children: <Widget>[
							Icon(Icons.location_on, color: Colors.white),
							SizedBox(width: 16.0),
							PopupMenuButton(																				// 下拉菜单选中
								onSelected: (index) {
									// setState(() {
									// 	this.selectedLocationIndex = index;
									// });
								},
								child: Row(																					// 下拉菜单按钮
									children: <Widget>[
										Text(this.locations[this.selectedLocationIndex], style: dropDownLabelStyle),
										Icon(Icons.keyboard_arrow_down, color: Colors.white)
									],
								),
								itemBuilder: (BuildContext context) => this._buildPopupMenuItem(),							//  创建下拉菜单
							),
							Spacer(),
							Icon(Icons.settings, color: Colors.white)
						],
					),
				);
			},
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
