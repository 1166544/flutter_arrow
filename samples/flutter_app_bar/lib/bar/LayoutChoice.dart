import 'package:flutter/material.dart';

/// 选择TAB数据源
class Choice {
	const Choice({this.title, this.icon});
	final String title;
	final IconData icon;
}

/// TAB BAR列表
const List<Choice> choices = const <Choice>[
	const Choice(title: 'CAR', icon: Icons.directions_car),
	const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
	const Choice(title: 'BOAT', icon: Icons.directions_boat),
	const Choice(title: 'BUS', icon: Icons.directions_bus),
	const Choice(title: 'TRAIN', icon: Icons.directions_railway),
	const Choice(title: 'WALK', icon: Icons.directions_walk),
];
