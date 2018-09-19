import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemesColorApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final appName = 'Custom Themes';

		// 通过new ThemeData()创建一个实例并将其传递给Theme Widget
		return new MaterialApp(
			title: appName,
			theme: new ThemeData(brightness: Brightness.light, primaryColor: Colors.lightBlue[800], accentColor: Colors.cyan[600]),
			home: new ThemeHomePage(title: appName),
		);
	}
}

/// 自定义主题类
class ThemeHomePage extends StatelessWidget {
	final String title;

	ThemeHomePage({Key key, @required this.title}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: new Text(title)),
			body: this.getBody(context),
			floatingActionButton: this.getFloatingActionButton(context),
		);
	}

	/// 定义了自定义主题，可以在Widget的build方法中通过Theme.of(context)函数使用
	Widget getBody(BuildContext context) {
		return new Center(
			child: new Container(
				color: Theme.of(context).accentColor,
				child: new Text('Text with a background color', style: Theme.of(context).textTheme.title)
			),
		);
	}

	Theme getFloatingActionButton(BuildContext context) {
		return new Theme(
			// 扩展父主题时无需覆盖所有的主题属性，通过使用copyWith方法来实现
			data: Theme.of(context).copyWith(accentColor: Colors.yellow),
			child: new FloatingActionButton(onPressed: null, child: new Icon(Icons.add))
		);
	}
}
