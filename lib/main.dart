import 'package:flutter/material.dart';
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
import './getsures//GestureMaterialApp.dart';

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
void main() {
	runApp(new GestureMaterialApp());
}
