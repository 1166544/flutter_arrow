import 'package:flutter/material.dart';

/// 带圆角效果用户头像
class CommonAvata extends StatelessWidget {
	CommonAvata() {
		// hole
	}

	@override
	Widget build(BuildContext context) {
		return this.getCustomAvataItem();
	}

  /// 圆角头像组件
  Widget getCustomAvataItem() {
    return Hero(
			tag: 'assets/images/pic10.png',
			child: Container(
				width: 125,
				height: 125,
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(62.5),
					image: DecorationImage(
						fit: BoxFit.cover,
						image: AssetImage('assets/imagesl/pic10.png')
					)
				),
			),
		);
  }

  /// 圆角搜索框
  Widget getCustomSearchItem() {
      return Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: TextFormField(
              decoration: InputDecoration(
				  border: InputBorder.none,	/// 去除外边框
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                  hintText: 'Search for recipes and channels',
				  hintStyle: TextStyle(color: Colors.grey)
              ),
          ),
      );
  }

  /// 构建引用组件（左边带竖线加右边带上下标题组件）
  Widget getRefItem() {
	  return Container(
		  padding: EdgeInsets.only(left: 15.0),
		  decoration: BoxDecoration(
			  // 构建左边3宽度竖线
			  border: Border(
				  left: BorderSide(color: Colors.orange, style: BorderStyle.solid, width: 3.0)
			  )
		  ),
		  child: Row(
			  children: <Widget>[
				  Column(
					  crossAxisAlignment: CrossAxisAlignment.start,
					  children: <Widget>[
						  Text('POPULAR RECIPES', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
						  Text('THIS WEEK', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
					  ],
				  )
			  ],
		  ),
	  );
  }

  /// 横向滚动容器
  Widget getHorizontalScrollItem() {
	  return Container(
		  padding: EdgeInsets.only(top: 15.0, left: 15.0),
		  height: 125.0,
		  child: ListView(
			  shrinkWrap: true,		// 兼容超出容器部份
			  scrollDirection: Axis.horizontal,
			  children: <Widget>[
				  // ITEM CARD 容器
				  this.getSubScrollItem(),
				  SizedBox(width: 10.0),
				  this.getSubScrollItem(),
				  SizedBox(width: 10.0),
				  this.getSubScrollItem(),
			  ],
		  ),
	  );
  }

  /// 横向滚动卡片容器
  Widget getSubScrollItem() {
	  return Container(
		height: 125.0,
		width: 250.0,
		// 圆角效果
		decoration: BoxDecoration(
			borderRadius: BorderRadius.circular(12.0),
			color: Colors.white
		),
		child: Row(
			children: <Widget>[
				Container(
					decoration: BoxDecoration(
						borderRadius: BorderRadius.circular(12.0),
						image: DecorationImage(image: AssetImage('assets/imagesl/pic10.png'))
				),
				height: 125.0,
				width: 100.0,
				),
				SizedBox(width: 20.0),
				Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text('Grilled Chicken', style: TextStyle(fontSize: 12.0)),
						Text('with Fruit Salad', style: TextStyle(fontSize: 10.0)),
						SizedBox(height: 10.0),
						// 2单位像素高的黄色横线
						Container(
							height: 2.0,
							width: 75.0,
							color: Colors.orange,
						),
						SizedBox(height: 10.0),
						Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								// 圆角头像
								Container(
								width: 25.0,
								height: 25.0,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(12.5),
									image: DecorationImage(image: AssetImage('assets/imagesl/pic10.png'))
								),
								),
								SizedBox(width: 10.0),
								Text('James Oliver', style: TextStyle(fontSize: 10.0))
							],
						)
					],
				)
			],
		),
	);
  }


}
