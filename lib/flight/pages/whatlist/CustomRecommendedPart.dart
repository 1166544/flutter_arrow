import 'package:flutter/material.dart';

class CustomRecommendedPart extends StatelessWidget {
	CustomRecommendedPart() {
		// hole
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(top: 15.0, left: 15.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					Text('CustomRecommendedPart', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
					Container(
						height: 200.0,
						child: ListView(
							shrinkWrap: true,	// 兼容超出容器处理
							scrollDirection: Axis.horizontal, // 设定横向滚动
							children: <Widget>[	// 子容器内容
								this.buildScrollSubItem(),
								SizedBox(width: 12.0),
								this.buildScrollSubItem(),
								SizedBox(width: 12.0),
								this.buildScrollSubItem(),
							],
						),
					)
				],
			),
		);
	}

	/// 卡片子项
	Widget buildScrollSubItem() {
		return Column(
			children: <Widget>[
				Container(
					decoration: BoxDecoration(
						borderRadius: BorderRadius.circular(5.0),
						image: DecorationImage(image: AssetImage('assets/images/pic2.png'))
					),
					height: 125.0,
					width: 125.0,
					// child: Container(
					// 	child: Text('KANO IN THE RIVER'),
					// ),
				),
				SizedBox(height: 5.0),
				Text('by Daniel Thomas'),
				Text('IDR 150.000'),
			],
		);
	}
}
