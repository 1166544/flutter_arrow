import 'package:flutter/material.dart';
import './TabbedChoice.dart';

class ChoiceCard extends StatelessWidget {
	const ChoiceCard({ Key key, this.choice }): super(key: key);

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
						new Icon(choice.icon, size: 128.0, color: Colors.teal),
						new Text(choice.title, style: textStyle)
					]
				)
			)
		);
	}
}
