import 'package:flutter/material.dart';
import './NavigationTodo.dart';
import './NavigationDetailPage.dart';

/// 父页面
class NavigationPassingData extends StatelessWidget {
	final List<NavigationTodo> todos;

	// 接收外部传入数据
	NavigationPassingData({Key key, @required this.todos}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: new Text('Todos')),

			// 使用ListView显示Todos列表
			body: new ListView.builder(
				itemCount: todos.length,
				itemBuilder: (context, index) {
					return new ListTile(
						title: new Text('This is Generate ${todos[index].title}'),

						// 实现ListTile的onTap回调。 在onTap回调中，将再次调用Navigator.push方法
						// 实现往子页面传值
						onTap: () {
							Navigator.push(context, new MaterialPageRoute(
								builder: (context) => new NavigationDetailPage(todo: todos[index])
							));
						}
					);
				}
			)
		);
	}
}
