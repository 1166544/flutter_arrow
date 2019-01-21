import 'package:flutter/material.dart';
import 'package:flighttickets/flight/home/CustomHomeScreenTopPart.dart';
import 'package:flighttickets/flight/home/CustomHomeScreenButtomPart.dart';

/// 首页
class CustomHomeIndex extends StatelessWidget {

	CustomHomeIndex() {
		// hole
	}

	/// 构造首页结构
	@override
	Widget build(BuildContext context) {
		return Column(													// 定义竖向行容器
			children: <Widget>[											// 竖向容器包含多个子容器
				HomeScreenTopPart(),									// 容器顶部内容
				HomeScreenBottomPart(),									// 容器底部内容
				HomeScreenBottomPart(),									// 容器底部内容
			],
		);
	}
}
