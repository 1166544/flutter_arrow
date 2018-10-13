import 'package:flutter/material.dart';
import './LayoutChoice.dart';
import './LayoutChoiceCard.dart';

class LayoutAppBar extends StatefulWidget {
	@override
	_AppBarBottomState createState() => new _AppBarBottomState();
}

class _AppBarBottomState extends State<LayoutAppBar> with SingleTickerProviderStateMixin {
	TabController _tabController;

	/// 初始化
	@override
	void initState() {
	  	super.initState();
		this._tabController = new TabController(vsync: this, length: choices.length);
	}

	/// 回收操作
	@override
	void dispose() {
		this._tabController.dispose();
	  	super.dispose();
	}

	/// 下一页
	/// * [delta] 偏移量
	void _nextPage(int delta) {
		final int newIndex = this._tabController.index + delta;

		if (newIndex < 0 || newIndex >= this._tabController.length) {
			return;
		}
		this._tabController.animateTo(newIndex);
	}

	/// APP_BAR
	/// * [context] 执行上下文
	Widget getAppBar(BuildContext context) {
		return AppBar(
			/// 标题
			title: const Text('AppBar Bottom Widget'),
			leading: IconButton(
				tooltip: 'Previous choice',
				icon: const Icon(Icons.arrow_back),
				onPressed: () => this._nextPage(-1)
			),
			/// 按钮栏
			actions: <Widget>[
				IconButton(
					icon: const Icon(Icons.arrow_forward),
					tooltip: 'Next choice',
					onPressed: () => this._nextPage(1)
				)
			],
			/// 底部按钮栏
			bottom: PreferredSize(
				preferredSize: const Size.fromHeight(48.0),
				child: Theme(
					data: Theme.of(context).copyWith(accentColor: Colors.white),
					child: Container(
						height: 48.0,
						alignment: Alignment.center,
						child: TabPageSelector(controller: this._tabController),
					),
				)
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				appBar: this.getAppBar(context),
				body: TabBarView(
					// 按制器
					controller: this._tabController,
					// 子列表
					children: choices.map(
						(Choice choice) {
							return Padding(
								padding: const EdgeInsets.all(16.0),
								child: ChoiceCard(choice: choice),
							);
						}
					).toList(),
				),
			),
		);
	}
}
