import 'package:flutter/material.dart';
import './TabbedChoice.dart';
import './TabbedChoiceCard.dart';

class TabbedBarApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			// 定义启动页，使用默认TAB控制器
			home: new DefaultTabController(
				length: choices.length,
				// 使用集成脚手架
				child: Scaffold(
					appBar: AppBar(
						title: const Text('Tabbed AppBar'),
						// 定义TAB内容，设置可滚动，通过动态方式创建TAB数据列表
						bottom: TabBar(
							isScrollable: true,
							tabs: choices.map((Choice choice) {
								return Tab(
									text: choice.title,
									icon: Icon(choice.icon),
								);
							}).toList(),
						),
					),
					// 设置TAB内容
					body: TabBarView(
						children: choices.map((Choice choice) {
							return Padding(
								padding: const EdgeInsets.all(1.0),
								child: ChoiceCard(choice: choice)
							);
						}).toList(),
					)
				)
			)
		);
	}
}
