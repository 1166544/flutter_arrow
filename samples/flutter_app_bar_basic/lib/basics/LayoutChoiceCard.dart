import 'package:flutter/material.dart';
import './LayoutChoice.dart';

class ChoiceCard extends StatelessWidget {
	ChoiceCard({Key key, this.choice}) : super(key: key);

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
						new Icon(choice.icon, size: 18.0, color: textStyle.color),
						new Text(choice.title, style: textStyle)
					]
				)
			),
		);
	}
}
