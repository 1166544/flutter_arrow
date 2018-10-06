import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './ListItem.dart';
import './ListMessageItem.dart';
import './ListHeadingItem.dart';

/// 为了表示列表中的不同类型的条目，我们需要为每个类型的条目定义一个类。
class ListCustomItemViewApp extends StatelessWidget {
	final List<ListItem> items;

	ListCustomItemViewApp({Key key, @required this.items}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final title = 'Mixed List';

		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)
			),
			body: new ListView.builder(
				itemCount: items.length,
				itemBuilder: (context, index) {
					final item = items[index];

					if (item is ListHeadingItem) {
						return new ListTile(title: new Text(item.heading, style: Theme.of(context).textTheme.headline));
					} else if (item is ListMessageItem) {
						return new ListTile(title: new Text(item.sender), subtitle: new Text(item.body));
					}
				}
			)
		));
	}
}
