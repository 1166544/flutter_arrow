import 'package:flutter/material.dart';
import './RandomWords.dart';

class RandomScrollListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

	  return new MaterialApp(
		  title: 'Startup Name Generator',
		  theme: this.getThemeData(),
		  home: new RandomWords()
	  );
  }

  /// 定义主题样式
  ThemeData getThemeData() {
    return new ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightGreen,
      accentColor: Colors.cyan[600]
    );
  }
}