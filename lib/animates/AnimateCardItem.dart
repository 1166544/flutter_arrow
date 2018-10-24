import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {

	/**
	 * 卡片列表对像
	 */
	const CardItem({
		Key key,
		@required this.animation,
		this.onTap,
		@required this.item,
		this.selected: false
	}): assert(animation != null),
	   assert(item != null && item >= 0),
	   assert(selected != null),
	   super(key: key);

	final Animation<double> animation;
	final VoidCallback onTap;
	final int item;
	final bool selected;

	@override
	Widget build(BuildContext context) {
		TextStyle textStyle = Theme.of(context).textTheme.display1;

		if (selected) {
			textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
		}

		return Padding(
			padding: const EdgeInsets.all(2.0),
			child: SizeTransition(
				axis: Axis.vertical,
				sizeFactor: animation,
				child: GestureDetector(
					behavior: HitTestBehavior.opaque,
					onTap: this.onTap,
					child: SizedBox(
						height: 128.0,
						child: Card(
							color: Colors.primaries[item % Colors.primaries.length],
							child: Center(
								child: Text('Item $item', style: textStyle)
							)
						)
					)
				)
			)
		);
	}
}
