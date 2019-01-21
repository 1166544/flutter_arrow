import 'package:flutter/material.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightList.dart';
import 'package:flighttickets/flight/styles/CustomShapeClipper.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';

/// 搜索结果页顶部内容
class FlightListTopPart extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				this.buildCurveContent(),
				this.buildCardContent(context)
			],
		);
	}

	/// 构建卡片容器
	Widget buildCardContent(BuildContext context) {
		return Column(
			children: <Widget>[
				SizedBox(height: 20.0),
				// 圆形卡片
				Card(
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
					margin: EdgeInsets.symmetric(horizontal: 16.0),
					elevation: 10.0,
					child: this.getCardContent(context)
				)
			],
		);
	}

	/// 卡片内容
	Widget getCardContent(BuildContext context) {
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
			child: Row(
				mainAxisSize: MainAxisSize.max,
				children: <Widget>[
					Expanded(
						flex: 5,
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[												// 解释外部传入参数
								Text('FROM: ${InheritedFlightListing.of(context).fromLocation}', style: TextStyle(fontSize: 16.0)),
								Divider(color: Colors.grey, height: 20.0),
								Text('TO: ${InheritedFlightListing.of(context).toLocation}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
							],
						),
					),
					Spacer(),																// 撑开占位符
					Expanded(																// 上下按钮图标
						flex: 1,
						child: Icon(
							Icons.import_export, color: Colors.black, size: 32.0
						)
					)
				],
			),
		);
	}

	/// 建立曲线形背景
	Widget buildCurveContent() {
		return ClipPath(
			clipper: CustomShapeClipper(),
			child: Container(
				decoration: BoxDecoration(gradient: LinearGradient(colors: [firstColor, secondColor])),
				height: 160.0,
			),
		);
	}
}
