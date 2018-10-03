import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

/// 数据格式影射类
class Post {
	final int userId;
	final int id;
	final String title;
	final String body;

	Post({this.userId, this.id, this.title, this.body});

	factory Post.fromJson(Map<String, dynamic> json) {
		return new Post(
			userId: json['userId'],
			id: json['id'],
			title: json['title'],
			body: json['body']
		);
	}
}

/// 数据转换工厂方法
Future<Post> fetchPost() async {
	final String fetchUrl = 'https://jsonplaceholder.typicode.com/posts/1';
	final response = await http.get(fetchUrl);
	final responseJson = json.decode(response.body);

	return new Post.fromJson(responseJson);
}

/// 数据调用举例
class NetworkingFetchDataApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Fetch Data Example',
			debugShowCheckedModeBanner: false,
			theme: new ThemeData(primarySwatch: Colors.blue),
			home: this.getHomePage()
		);
	}

	/// 首页面布局内容
	Widget getHomePage() {
		return new Scaffold(
			appBar: new AppBar(title: Text('Fetch Data Example')),
			body: new Center(
				child: new FutureBuilder<Post>(
					future: fetchPost(),	// 绑定数据调用
					builder: (context, snapshot) {
						// 返回数据结果通过snapshot对像访问，使用前先判断对数属性值是否存在
						if (snapshot.hasData) {
							return new Text('These content is fetched from network\n\n title: \n${snapshot.data.title} \n\nbody:\n${snapshot.data.body}');
						} else if (snapshot.hasError) {
							return new Text('${snapshot.error}');
						}

						// 默认情况，如果数据未加地，则显示LOADING状态
						return new CircularProgressIndicator();
					},
				)
			),
		);
	}
}
