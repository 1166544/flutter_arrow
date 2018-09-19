import 'package:flutter/material.dart';

/// 响应用户基本操作，如点击和拖动使用GestureDetector Widget组件
class GestureTabsApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Gesture Demo';

		return new MaterialApp(
			title: title,
			home: new GestureHomePage(title: title)
		);
	}
}

/// 自定义页面,中间包含自定义按钮
class GestureHomePage extends StatelessWidget {
	final String title;

	GestureHomePage({Key key, this.title}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: new Text(title)),
			body: new Center(child: new GestureButton()),
		);
	}
}

/// 自定义按钮，使用GestureDetector包围
class GestureButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new GestureDetector(
			// 响应TAB事件,弹出底部提示信息
			onTap: () {
				final snakBar = new SnackBar(content: new Text('Button Tabed!'));
				Scaffold.of(context).showSnackBar(snakBar);
			},
			child: new Container(
				padding: new EdgeInsets.all(18.0),
				decoration: this.getDecoration(context),
				child: new Text('Custom gesture button'),
			),
		);
	}

	BoxDecoration getDecoration(BuildContext context) {
		return new BoxDecoration(
			color: Theme.of(context).scaffoldBackgroundColor,
			borderRadius: new BorderRadius.circular(8.0)
		);
	}
}
