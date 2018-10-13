import 'package:flutter/material.dart';
import './LayoutChoice.dart';

/// 列表卡
class ChoiceCard extends StatelessWidget {

	/// 构造体
	ChoiceCard({Key key, this.choice}): super(key: key);

	/// 数据源
	final Choice choice;

	@override
	Widget build(BuildContext context) {
		final TextStyle textStyle = Theme.of(context).textTheme.display1;

		return Card(
			color: Colors.white,
			child: Center(
				child: Column(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Icon(choice.icon, size: 128.0, color: Colors.tealAccent),
						Text(choice.title, style: textStyle)
					]
				)
			),
		);
	}
}
