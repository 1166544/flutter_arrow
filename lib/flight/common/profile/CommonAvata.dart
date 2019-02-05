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
}
