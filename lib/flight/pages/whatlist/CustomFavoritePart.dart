import 'package:flutter/material.dart';

class CustomFavoritePart extends StatelessWidget {
	CustomFavoritePart() {
		// hole
	}

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(top: 30.0, left: 20.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Text('CustomFavoritePart', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
					SizedBox(height: 10.0),
					this.buildGuideItem('assets/images/pic6.png', 'Samantha William', 4.2, 86, 4, 1),
					this.buildGuideItem('assets/images/pic8.png', 'Jonathan Hope', 4.2, 86, 2, 2),
					this.buildGuideItem('assets/images/pic9.png', 'Andrea Summers', 4.2, 86, 3, 3),
					this.buildGuideItem('assets/images/pic10.png', 'William Johnson', 4.2, 86, 4, 4),
				],
			),
		);
	}

	/// 构建月度评分
	Widget buildGuideItem(String imgUrl, String name, double score, double views, double startNum, double index) {
		return Row(
			children: <Widget>[
				// 用户圆角头像
				Hero(
					tag: 'assets/images/pic10.png',
					child: Container(
						width: 60.0,
						height: 60.0,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(7.0),
							image: DecorationImage(
								fit: BoxFit.cover,
								image: AssetImage(imgUrl)
							)
						),
					),
				),
				SizedBox(width: 5.0),
				Column(
					children: <Widget>[
						Text(name),
						Row(
							children: <Widget>[
								Icon(Icons.star, color: startNum < index ? Colors.yellow : Colors.grey),
								Icon(Icons.star, color: startNum < index ? Colors.yellow : Colors.grey),
								Icon(Icons.star, color: startNum < index ? Colors.yellow : Colors.grey),
								Icon(Icons.star, color: startNum < index ? Colors.yellow : Colors.grey),
								Text(score.toString()),
								Text(views.toString())
							],
						)
					],
				),
				Container(
					width: double.infinity,
					height: 1.0,
					color: index == 1 ? Colors.grey : Colors.white
				)
			],
		);
	}
}
