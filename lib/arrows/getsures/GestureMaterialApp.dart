import 'package:flutter/material.dart';

/// Material触摸水波效果
/// 创建一个可点击的Widget。
/// 将它包裹在一个InkWell中来管理点击回调和水波动画。
class GestureMaterialApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'InvkWell Demo';

		return new MaterialApp(
			title: title,
			home: new GestureMaterialView(title: title)
		);
	}
}

class GestureMaterialView extends StatelessWidget {
	final String title;

	GestureMaterialView({Key key, this.title}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: new Text(title)),
			body: new Center(child: new GestureInkWellButton())
		);
	}
}

class GestureInkWellButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new InkWell(
			onTap: () {
				Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('InkWell Tabed')));
			},
			child: new Container(
				padding: new EdgeInsets.all(12.0),
				child: new Text('Flat Button')
			),
		);
	}
}
