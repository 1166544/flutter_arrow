import 'package:flutter/material.dart';

/// 向父容器传递内容
class NavigationHomeScreenApp extends StatelessWidget {
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: Text('Returning Data Demo')),
			body: new Center(child: new SelectionButton())
		);
	}
}

/// 选择按钮
class SelectionButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new RaisedButton(
			// 点击处理,将context内容传到父容器
			onPressed: () {
				this._navigateAndDisplaySelection(context);
			},
			child: Text('Pick an option, any option!'),
		);
	}

	/// 将context内容传到父容器处理
	_navigateAndDisplaySelection(BuildContext context) async {
		final result = await Navigator.push(context, new MaterialPageRoute(
			builder: (context) => new SelectionScreen()
		));

		// 将结果通过SnackBar显示
		Scaffold.of(context).showSnackBar(new SnackBar(content: Text('$result')));
	}
}

/// 选择页面
class SelectionScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: Text('Pick an option')),
			body: new Center(
				child: new Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						this._getRaiseButton(context, 'Yep!'),
						this._getRaiseButton(context, 'Nope.'),
					]
				)
			)
		);
	}

	/// 返回按钮
	_getRaiseButton(BuildContext context, String textStr) {
		return new Padding(
			padding: const EdgeInsets.all(8.0),
			child: new RaisedButton(
				onPressed: () {
					// 关闭当前屏幕并返回同时显示提示框
					Navigator.pop(context, textStr);
				},
				child: new Text(textStr),
			),
		);
	}
}
