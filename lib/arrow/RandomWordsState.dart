import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './RandomWords.dart';

class RandomWordsState extends State<RandomWords> {

	final _suggestions = <WordPair>[];
	final _biggerFont = const TextStyle(fontSize: 18.0);
	final _saved = new Set<WordPair>();

	Widget _buildSuggestions() {
		return new ListView.builder(
			padding: const EdgeInsets.all(16.0),
			itemBuilder: (context, i) {
				if (i.isOdd) return new Divider();

				// 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
        		// 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
				final index = i ~/ 2;

				// 如果是建议列表中最后一个单词对...接着再生成10个单词对，然后添加到建议列表
				if (index >= _suggestions.length) {
					_suggestions.addAll(generateWordPairs().take(10));
				}
				return _buildRow(_suggestions[index]);
			}
		);
	}

	/// 生成列表右边心形图标及状态
	Widget getTrailIcon(alreadySaved) {
		return new Icon(
			alreadySaved ? Icons.favorite : Icons.favorite_border, color: alreadySaved ? Colors.red : null
		);
	}

	/// 构建操作
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: this.getAppBar(),
			body: this._buildSuggestions(),
		);
	}

	/// 创建行逻辑
	Widget _buildRow(WordPair pair) {
		final alreadySaved = _saved.contains(pair);

		return new ListTile(
			title: this.createText(pair.asPascalCase, _biggerFont),
			trailing: this.getTrailIcon(alreadySaved),
			onTap: () {
				setState(() {
					if (alreadySaved) {
						_saved.remove(pair);
					} else {
						_saved.add(pair);
					}
				});
			},
		);
	}

	/// 生成appBar
	AppBar getAppBar() {
		return new AppBar(
			title: this.createText('Startup Name Generator', _biggerFont),
			actions: <Widget>[
				new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
			],
		);
	}

	/// 添加Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
	void _pushSaved() {
		Navigator.of(context).push(this.addNewRote());
	}

	/// 子页路由内容
	MaterialPageRoute addNewRote() {
		return new MaterialPageRoute(
			builder: (context) {
				final tiles = _saved.map(
					(pair) {
						return this.createListTile(pair.asPascalCase);
					}
				);

				final divided = ListTile.divideTiles(
					context: context, tiles: tiles
				).toList();

				return new Scaffold(
					appBar: new AppBar(title: this.createText('Saved Suggestions', _biggerFont)),
					body: new ListView(children: divided)
				);
			},
		);
	}

	/// 封装ListTitle
	Widget createListTile(textContent) {
		return new ListTile(
			title: this.createText(textContent, _biggerFont),
		);
	}

	/// 封装文本
	Widget createText(titleContent, styleContent) {
		return new Text(titleContent, style: styleContent);
	}
}