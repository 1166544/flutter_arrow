import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/lists/CustomFlightCard.dart';
import 'package:flighttickets/flight/lists/CustomFlightDetails.dart';
import 'dart:async';

/// 搜索结果页底部内容
class FlightListingBottomPart extends StatelessWidget {

	StreamController<List<FlightDetails>> _dealsList = new StreamController<List<FlightDetails>>();

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(left: 16.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Padding(
						padding: const EdgeInsets.symmetric(horizontal: 16.0),
						child: Text('Best Deals for Next 6 Months', style: dropDownMenuItemStyle)
					),
					SizedBox(height: 10.0),
					StreamBuilder(
						stream: _dealsList.stream,
						initialData: this._initStremData(),
						builder: (context, snapshot) {
							return !snapshot.hasData
								? Center(child: CircularProgressIndicator())
								: this._buildDealsList(context, snapshot.data);
						},
					)
				],
			),
		);
	}

	/// 构建搜索结果列表
	Widget _buildDealsList(BuildContext context, List<FlightDetails> snapshots) {
		return ListView.builder(
			shrinkWrap: true,																		// 创建按需创建的可滚动线性小部件数组
			itemCount: snapshots.length,
			physics: ClampingScrollPhysics(),														// 滑动边界超出处理
			scrollDirection: Axis.vertical,
			itemBuilder: (context, index) {
				return FlightCardItem(flightDetails: snapshots[index]);		// 动态创建子内容
			},
		);
	}

	/**
	 * 初始化数据
	 */
	_initStremData() {
		this._dealsList.add([new FlightDetails(), new FlightDetails(), new FlightDetails(), new FlightDetails(), new FlightDetails(), new FlightDetails()]);
	}

}
