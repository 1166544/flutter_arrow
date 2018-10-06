import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 标准的ListView构造函数适用于小列表。
/// 为了处理包含大量数据的列表，最好使用ListView.builder构造函数。
///
/// ListView的构造函数需要一次创建所有项目，但ListView.builder的构造函数不需要，
/// 它将在列表项滚动到屏幕上时创建该列表项。
class ListViewBuilderApp extends StatelessWidget {
	final List<String> items;

	ListViewBuilderApp({Key key, @required this.items}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final title = 'Long text list';

		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)),
				body: new ListView.builder(
					itemCount: this.items.length,
					itemBuilder: (context, index) {
						return new ListTile(title: new Text('${this.items[index]}'));
					}
				)
			)
		);
	}
}
