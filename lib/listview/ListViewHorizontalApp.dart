import 'package:flutter/material.dart';

/// 横向滚动列表
class ListViewHorizontalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Horizontal List';

    return new MaterialApp(
        title: title,
        home: new Scaffold(
            appBar: new AppBar(title: new Text(title)),
            body: new Container(
                margin: new EdgeInsets.symmetric(vertical: 80.0),
                height: 200.0,
                child: new ListView(
					// 在创建ListView时，设置scrollDirection为水平方向以覆盖默认的垂直方向。
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      this.getItemListContainer(160.0, Colors.pink),
                      this.getItemListContainer(160.0, Colors.lightBlue),
                      this.getItemListContainer(160.0, Colors.yellow),
                    ]
				)
			)
		)
	);
  }

  Container getItemListContainer(double widthNum, Color colorValue) {
    return new Container(
      width: widthNum,
      color: colorValue,
    );
  }
}
