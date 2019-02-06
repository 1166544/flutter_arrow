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
					SizedBox(height: 20.0),
					this.buildGuideItem(context, 'assets/images/pic6.png', 'Samantha William', 4.2, 86, 4),
					SizedBox(height: 10.0),
					this.buildSeperateLine(),
					SizedBox(height: 10.0),
					this.buildGuideItem(context, 'assets/images/pic8.png', 'Jonathan Hope', 2.2, 86, 2),
					SizedBox(height: 20.0),
					this.buildGuideItem(context, 'assets/images/pic9.png', 'Andrea Summers', 3.2, 86, 3),
					SizedBox(height: 20.0),
					this.buildGuideItem(context, 'assets/images/pic10.png', 'William Johnson', 4.2, 86, 4),
				],
			),
		);
	}

	/// 构建分割线
	Widget buildSeperateLine() {
		return Row(
			children: <Widget>[
				Container(width: 80.0, height: 0.5, color: Colors.white),
				Container(
					width: 270.0,
					height: 0.5,
					color: Colors.grey.withOpacity(0.5),
					padding: EdgeInsets.only(top: 15.0),
				),
			],
		);
	}

	/// 构建月度评分
	Widget buildGuideItem(BuildContext context, String imgUrl, String name, double score, int views, int startNum) {
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
				Padding(
					padding: EdgeInsets.only(left: 20.0, top: 0.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text(name),
							Row(
								children: <Widget>[
									this.buildRateStartItem(startNum),
									SizedBox(width: 15.0,),
									Text(score.toString(), style: TextStyle(fontSize: 11.0)),
									SizedBox(width: 3.0,),
									Text('(${views.toString()} reviews)', style: TextStyle(fontSize: 11.0, color: Colors.grey))
								],
							)
						],
					),
				),
			],
		);
	}

	/// 构建星星效果
	Widget buildRateStartItem(int startNum) {
		return Row(
			children: <Widget>[
				this.buildStar(startNum, 1),
				this.buildStar(startNum, 2),
				this.buildStar(startNum, 3),
				this.buildStar(startNum, 4),
			],
		);
	}

	/// 单个星星
	Widget buildStar(int startNum, int index) {
		return Icon(
			Icons.star,
			color: startNum >= index ? Colors.yellow : Colors.grey,
			size: 16.0
		);
	}
}
