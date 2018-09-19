import './RandomWordsState.dart';
import 'package:flutter/material.dart';

/// 封装状态可能在widget生命周期中发生变化的组件
class RandomWords extends StatefulWidget {
	@override
	createState() => new RandomWordsState();
}
