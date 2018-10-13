import 'package:flutter/material.dart';
import './LayoutChoice.dart';
import './LayoutChoiceCard.dart';

class LayoutAppBarBasic extends StatefulWidget {
	@override
	_LayoutBasicAppBarState createState() => _LayoutBasicAppBarState();
}

class _LayoutBasicAppBarState extends State<LayoutAppBarBasic> {
	Choice _selectedChoice = choices[0];

	/// 控制状态更新视图
	void _select(Choice choice) {
		setState(() {
			this._selectedChoice = choice;
		});
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(
					// 标题
					title: const Text('Basic AppBar'),
					// 右边工具栏，点击控制页面内容变幻
					actions: <Widget>[
						// 点击按钮控制
						IconButton(icon: Icon(choices[0].icon), onPressed: () { this._select(choices[0]); }),
						IconButton(icon: Icon(choices[1].icon), onPressed: () { this._select(choices[1]); }),

						// 点击弹出菜单控制
						PopupMenuButton<Choice>(
							onSelected: this._select,
							itemBuilder: (BuildContext context) {
								return choices.skip(2).map((Choice choice) {
									return PopupMenuItem<Choice>(
										value: choice,
										child: Text(choice.title)
									);
								}).toList();
							}
						)
					],
				),
				// 主内容
				body: Padding(
					padding: const EdgeInsets.all(16.0),
					child: ChoiceCard(choice: this._selectedChoice)
				),
			),
		);
	}
}
