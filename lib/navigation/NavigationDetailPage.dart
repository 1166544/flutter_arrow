import 'package:flutter/material.dart';
import './NavigationTodo.dart';

/// 子页面
class NavigationDetailPage extends StatelessWidget {
	final NavigationTodo todo;

	// 接收外部传入参数
	NavigationDetailPage({Key key, @required this.todo}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: new Text('${todo.title}')),
			body: new Padding(
				padding: new EdgeInsets.all(16.0),
				child: new Text('${todo.description}')
			)
		);
	}
}
