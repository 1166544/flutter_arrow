import 'package:flutter/material.dart';
import './AnimateListModel.dart';
import './AnimateCardItem.dart';

class AnimateListApp extends StatefulWidget {
	@override
	_AnimatedListState createState() => _AnimatedListState();
}

class _AnimatedListState extends State<AnimateListApp> {
	final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
	ListModel<int> _list;
	int _selectedItem;
	int _nextItem;

	@override
	void initState() {
		super.initState();
		this._list = ListModel<int>(listKey: this._listKey, initialItems: <int>[0,1,2], removedItemBuilder: this._buildRemovedItem);
		this._nextItem = 3;
	}

	/// 创建列表项
	/// * [context] 上下文
	/// * [index] 序号
	/// * [animation] 动画对像
	Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
		return CardItem(
			animation: animation,
			item: this._list[index],
			selected: this._selectedItem == this._list[index],
			onTap: () {
				setState(() {
					this._selectedItem = this._selectedItem == this._list[index] ? null : this._list[index];
				});
			}
		);
	}

	// 用于在项目从列表中移除之后生成项目,这种方法是
	// 需要，因为移除的项在其动画之前保持可见
	// 完成（即使它已经离开ListModel这个问题）
	// WIDGET将被[动画DistalSt.RevEnItI]方法使用
	// [AnimatedListRemovedItemBuilder]参数
	Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
		return CardItem(
			animation: animation,
			item: item,
			selected: false
		);
	}

	/// 添加
	void _insert() {
		final int index = this._selectedItem == null ? this._list.length : this._list.indexOf(this._selectedItem);
		this._list.insert(index, this._nextItem++);
	}

	/// 移除
	void _remove() {
		if (this._selectedItem != null) {
			this._list.removeAt(this._list.indexOf(this._selectedItem));
			setState(() {
				this._selectedItem = null;
			});
		}
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(
					title: const Text('AnimatedList'),
					actions: <Widget>[
						IconButton(icon: const Icon(Icons.add_circle), onPressed: this._insert, tooltip: 'Insert a new item'),
						IconButton(icon: const Icon(Icons.remove_circle), onPressed: this._remove, tooltip: 'Remove the selected item'),
					],
				),
				body: Padding(
					padding: const EdgeInsets.all(16.0),
					child: AnimatedList(
						key: this._listKey,
						initialItemCount: this._list.length,
						itemBuilder: this._buildItem
					)
				)
			)
		);
	}
}
