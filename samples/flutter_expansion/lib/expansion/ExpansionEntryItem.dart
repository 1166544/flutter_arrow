import 'package:flutter/material.dart';
import './ExpansionEntry.dart';

class EntryItem extends StatelessWidget {
	EntryItem(this.entry);

	final Entry entry;

	Widget _buildTiles(Entry root) {
		if (root.children.isEmpty) {
			// 子代为空时返回单个文本内容
			return ListTile(title: Text(root.title));
		} else {
			// 不为空时拆分列表
			return ExpansionTile(
				title: Text(root.title),
				key: PageStorageKey<Entry>(root),
				children: root.children.map(this._buildTiles).toList()
			);
		}
	}

	@override
	Widget build(BuildContext context) {
		return this._buildTiles(this.entry);
	}
}
