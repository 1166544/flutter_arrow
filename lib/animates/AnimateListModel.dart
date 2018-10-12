import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListModel<E> {
	ListModel({
		@required this.listKey,
		@required this.removedItemBuilder,
		Iterable<E> initialItems
	}) : assert(listKey != null),
		assert(removedItemBuilder != null),
		_items = new List<E>.from(initialItems ?? <E>[]);

	final GlobalKey<AnimatedListState> listKey;
	final dynamic removedItemBuilder;
	final List<E> _items;

	AnimatedListState get _animatedList => listKey.currentState;

	/// 插入
	void insert(int index, E item) {
		this._items.insert(index, item);
		this._animatedList.insertItem(index);
	}

	/// 删除特定某一个
	/// * [index] 序号
	E removeAt(int index) {
		final E removedItem = this._items.removeAt(index);
		if (removedItem != null) {
			this._animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
				return this.removedItemBuilder(removedItem, context, animation);
			});
		}

		return removedItem;
	}

	int get length => this._items.length;
	E operator [](int index) => this._items[index];
	int indexOf(E item) => this._items.indexOf(item);
}
