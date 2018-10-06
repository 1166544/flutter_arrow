import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GestureDismissibleApp extends StatelessWidget {
	final List<String> items;

	GestureDismissibleApp({Key key, @required this.items}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final title = 'Dismissing Items';

		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)),
				body: new ListView.builder(
					itemCount: items.length,
					itemBuilder: (context, index) {
						final item = items[index];

						// 让用户能够将条目从列表中移除，用户删除一个条目后，
						// 从列表中删除该条目并显示一个Snackbar。 在实际的场景中，可能需要执行更复杂的逻辑，
						// 例如从Web服务或数据库中删除条目。
						return new Dismissible(
							key: new Key(item),
							onDismissed: (direction) {
								items.removeAt(index);

								Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item dismissed')));
							},
							background: new Container(color: Colors.red),
							child: new ListTile(title: new Text('$item'))
						);
					}
				)
			)
		);
	}

}
