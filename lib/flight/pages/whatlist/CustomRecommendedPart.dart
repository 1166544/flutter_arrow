import 'package:flutter/material.dart';

class CustomRecommendedPart extends StatelessWidget {
	CustomRecommendedPart() {
		// hole
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(top: 35.0, left: 20.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					Padding(
						padding: EdgeInsets.only(bottom: 20.0),
						child: Text('CustomRecommendedPart', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
					),
					Container(
						height: 200.0,
						child: ListView(
							shrinkWrap: true,	// 兼容超出容器处理
							scrollDirection: Axis.horizontal, // 设定横向滚动
							children: <Widget>[	// 子容器内容
								this.buildScrollSubItem('assets/images/pic1.png', 'by Daniel Thomas', 'IDR 150.000'),
								SizedBox(width: 12.0),
								this.buildScrollSubItem('assets/images/pic2.png', 'by Daniel James', 'IDR 180.000'),
								SizedBox(width: 12.0),
								this.buildScrollSubItem('assets/images/pic4.png', 'by Authr Smanntha', 'IDR 88.000'),
							],
						),
					),
					Padding(
						padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
						child: Text('Favorite Activity', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
					),
					Container(
						height: 200.0,
						child: ListView(
							shrinkWrap: true,	// 兼容超出容器处理
							scrollDirection: Axis.horizontal, // 设定横向滚动
							children: <Widget>[	// 子容器内容
								this.buildScrollSubItem('assets/images/pic5.png', 'by Samantha William', 'IDR 55.000'),
								SizedBox(width: 12.0),
								this.buildScrollSubItem('assets/images/pic1.png', 'by Daniel Thomas', 'IDR 210.000'),
								// SizedBox(width: 12.0),
								// this.buildScrollSubItem('assets/images/pic2.png', 'by Kate Susan', 'IDR 67.000'),
							],
						),
					)
				],
			),
		);
	}

	/// 卡片子项
	Widget buildScrollSubItem(String imgUrl, String title, String subTitle) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Container(
					decoration: BoxDecoration(
						borderRadius: BorderRadius.circular(5.0),
						image: DecorationImage(image: AssetImage(imgUrl))
					),
					height: 125.0,
					width: 125.0,
					// child: Container(
					// 	child: Text('KANO IN THE RIVER'),
					// ),
				),
				SizedBox(height: 12.0),
				Text(title),
				SizedBox(height: 3.0),
				Text(subTitle, style: TextStyle(color: Colors.grey))
			],
		);
	}
}
