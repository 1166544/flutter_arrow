import 'package:flutter/material.dart';
import './ExpansionEntryItem.dart';
import './ExpansionEntry.dart';

/// 折叠列表
class ExpansionApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			home: new Scaffold(
				appBar: AppBar(title: const Text('ExpansionTile')),
				body: ListView.builder(
					itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
					itemCount: data.length,
				)
			)
		);
	}
}
