import 'package:flutter/material.dart';

class LakesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 将封装内容组装在一起。
    // 这些widget放置到ListView中，而不是列中，因为在小设备上运行应用程序时，ListView会自动滚动
    return MaterialApp(
        title: 'Flutter Cover IMAGE DEMO',
		debugShowCheckedModeBanner: false,		// 显示DEBUG版标记
		showSemanticsDebugger: false,			// 显示布局边框
        home: new Scaffold(
          appBar: new AppBar(title: Text('Top Lakes')),
          body: new ListView(children: [
            this.getCoverImage(),
            this.getTitleSection(),
            this.getButtonSection(context),
            this.getTextSection()
          ]),
        ));
  }

  /// 获取封面图片
  /// fit: BoxFit.cover 告诉框架，图像应该尽可能小，但覆盖整个渲染框
  Widget getCoverImage() {
    return Image.asset('images/lake.jpg',
        width: 600.0, height: 240.0, fit: BoxFit.cover);
  }

  /// 描述文本内容
  /// softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开
  Widget getTextSection() {
    final String descText =
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''';
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: Text(descText, softWrap: true));
  }

  /// 按钮栏部份布局
  ///
  /// * [context] 上下文
  Widget getButtonSection(BuildContext context) {
    return Container(
      child: Row(
        // 平均份配行内容
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          this.buildButtonColumn(context, Icons.call, 'CALL'),
          this.buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          this.buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  /// 标题内容布局,包括左中右三部份，左部份又包括上下部份，因此用column包括
  Widget getTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(children: [
        // 第1列内容：使用Expanded将内容占据整行
        Expanded(
          child: Column(
              // 左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 上部份文本
                Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Oeschien Lake Campground',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                // 下部份内容
                Text('Kandersteg, Switzerland',
                    style: TextStyle(color: Colors.grey[500]))
              ]),
        ),
        // 第2列内容,第3列内容使用交互容器包含
        FavoriteWidget()
      ]),
    );
  }

  /// 生成按钮封装
  ///
  /// * [context] 上下文
  /// * [icon] 图标
  /// * [label] 文本内容
  Column buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }
}

/// 收藏交互按钮
class FavoriteWidget extends StatefulWidget {
	@override
	_FavoriteWidgetState createState() => _FavoriteWidgetState();
}

/// 交互逻辑
class _FavoriteWidgetState extends State<FavoriteWidget> {
	bool _isFavorited = true;
	int _favoriteCount = 41;

	/// 收藏状态,设置setState通知框架重绘
	void _toogleFavorite(){
		setState(() {
			if(this._isFavorited) {
				this._favoriteCount -= 1;
			} else {
				this._favoriteCount += 1;
			}
			this._isFavorited = !this._isFavorited;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Row(
			// 设置最小宽度适应
			mainAxisSize: MainAxisSize.min,
			children: <Widget>[
				// CONTAINER容器使用ICONBUTTON包含，同时注册击事件
				Container(
					padding: EdgeInsets.all(0.0),
					child: IconButton(
						// 图标
						icon:(
							this._isFavorited ?
							Icon(Icons.star)
							:
							Icon(Icons.star_border)
						),
						// 颜色
						color: Colors.red[500],
						// 注册点击事件
						onPressed: this._toogleFavorite,
					),
				),

				// 收藏数量文本
				SizedBox(
					width: 20.0,
					child: Container(
						child: Text('$_favoriteCount')
					)
				)
			]
		);
	}
}
