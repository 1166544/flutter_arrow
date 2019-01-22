import 'package:flutter/material.dart';
import 'package:flighttickets/flight/pages/whatlist/CustomDiscoverPart.dart';
import 'package:flighttickets/flight/pages/whatlist/CustomRecommendedPart.dart';
import 'package:flighttickets/flight/pages/whatlist/CustomFavoritePart.dart';

class CustomWhatListPage extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		// 拆分页面结构
		return Column(children: <Widget>[
			CustomDiscoverPart(),
			CustomRecommendedPart(),
			CustomFavoritePart()
		]);
	}
}
