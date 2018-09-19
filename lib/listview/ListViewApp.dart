import 'package:flutter/material.dart';

/// 基本List
class ListViewApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Basic list';

		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)),
				body: new ListView(
					children: <Widget>[
						this.getItemListTile(Icons.map, 'Map'),
						this.getItemListTile(Icons.photo, 'Album'),
						this.getItemListTile(Icons.phone, 'Phone'),
					]
				)
			)
		);
	}

	/// 使用标准ListView构造函数非常适合仅包含少量条目的列表
	/// 使用内置的ListTile Widget来作为列表项。
	ListTile getItemListTile(IconData iconData, String textString) {
		return new ListTile(
			leading: new Icon(iconData),
			title: new Text(textString.toUpperCase()),
		);
	}
}
