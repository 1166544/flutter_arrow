
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:flighttickets/flight/bar/CustomAppBar.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';
import 'package:flighttickets/flight/home/CustomHomeScreenTopPart.dart';
import 'package:flighttickets/flight/home/CustomHomeScreenButtomPart.dart';

/// 启动
Future<void> main() async {
	final FirebaseApp app = await FirebaseApp.configure(
		name: 'flight-firestore',
		options: Platform.isIOS
			? const FirebaseOptions(
              googleAppID: '1:1009830851809:ios:8658d2b8af672428',
              gcmSenderID: '1009830851809',
              databaseURL: 'https://flight-app-mock.firebaseio.com/',
            )
          : const FirebaseOptions(
              googleAppID: '1:1009830851809:android:8658d2b8af672428',
              apiKey: 'AIzaSyD40ZrOJQh-hTva6dQ-ddYo95fXq5LOb3E',
              databaseURL: 'https://flight-app-mock.firebaseio.com/',
            )
	);

	runApp(MaterialApp(
		title: 'Flight in the sky',
		debugShowCheckedModeBanner: false,
		home: HomeScreen(),
		theme: appTheme,
	));
}

/// 主启动类
class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: CustomAppBar(),
			body: SingleChildScrollView(
				scrollDirection: Axis.vertical,
				child: Column(
					children: <Widget>[
						HomeScreenTopPart(),
						homeScreenBottomPart,
						homeScreenBottomPart
					],
				),
			),
		);
	}
}


// import './arrow/RandomScrollListApp.dart';
// import './themes/ThemesColorApp.dart';
// import './image/ImageHttpApp.dart';
// import './listview/ListViewApp.dart';
// import './listview/ListViewHorizontalApp.dart';
// import './listview/ListViewBuilderApp.dart';
// import './listview/ListCustomItemViewApp.dart';
// import './listview/ListHeadingItem.dart';
// import './listview/ListMessageItem.dart';
// import './listview/ListItem.dart';
// import './listview/ListGrid.dart';
// import './getsures//GestureTabsApp.dart';
// import './getsures//GestureMaterialApp.dart';
// import './getsures//GestureDismissibleApp.dart';
// import './image/ImageFadingApp.dart';
// import './image/ImageCachedApp.dart';
// import './navigation/NavigationBasicApp.dart';
// import './navigation/NavigationTodo.dart';
// import './navigation/NavigationPassingData.dart';
// import './navigation/NavigationHomeScreenApp.dart';
// import './networking/NetworkingFetchData.dart';
// import './sockets/SocketsApp.dart';
// import './lakes/LakesApp.dart';
// import './animates/AnimateListApp.dart';

// 动画列表
// void main(List<String> args) {
//   runApp(new AnimateListApp());
// }

// 创建不同类型子项的List
// void main() => runApp(new ListCustomItemViewApp(
//     items: new List<ListItem>.generate(
//         1000,
//         (i) => i % 6 == 0
//             ? new ListHeadingItem('Heading $i')
//             : new ListMessageItem('Sender $i', 'MessageBody $i'))
// 		)
// 	);

// 创建一个 grid List
// void main() {
// 	runApp(new ListGrid());
// }

// 处理点击
// void main() {
// 	runApp(new GestureTabsApp());
// }

// 处理点击-水波效果
// void main() {
// 	runApp(new GestureMaterialApp());
// }

// 实现滑动关闭
// void main() {
// 	runApp(new GestureDismissibleApp(
// 		items: new List<String>.generate(20, (i) => 'Item ${i + 1}')
// 	));
// }

// 占位符图片
// void main() {
// 	runApp(new ImageFadingApp());
// }

// 使用缓存图片
// void main() {
// 	runApp(new ImageCachedApp());
// }

// 导航到新页面并返回
// void main() {
// 	runApp(new MaterialApp(
// 		title: 'Navigation Basics',
// 		debugShowCheckedModeBanner: false,
// 		home: new NavigationBasicApp()
// 	));
// }

// 导航到新面并传值
// void main() {
// 	runApp(
// 		new MaterialApp(
// 			title: 'Padding data',
// 			debugShowCheckedModeBanner: false,
// 			home: new NavigationPassingData(
// 				// 生成20个待办事项并使用ListView显示它们
// 				todos: new List.generate(20, (i) => new NavigationTodo('Todo $i', 'A description of what needs to be done for Todo $i'))
// 			)
// 		)
// 	);
// }

// 导航到新页面并返回值
// void main() {
// 	runApp(new MaterialApp(
// 		title: 'Returning Data',
// 		debugShowCheckedModeBanner: false,
// 		home: new NavigationHomeScreenApp()
// 	));
// }

// 从网络获取数据
// void main(List<String> args) {
//   runApp(new NetworkingFetchDataApp());
// }

// SocketsHome
// void main(List<String> args) {
// 	runApp(new SockatesApp());
// }

// LAKES布局示例
// void main() {
//   runApp(new LakesApp());
// }
