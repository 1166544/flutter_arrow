import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';

/// 自定义APPBAR
class CustomAppBar extends StatelessWidget {

	/// TAB列表数据
	List<BottomNavigationBarItem> bottomBarItems;

	CustomAppBar() {
		// 默认样式
		TextStyle defaultBarItemStyle = TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

		// 选中样式
		TextStyle selectedBarItemStyle = defaultBarItemStyle.copyWith(color: appTheme.primaryColor);

		// 添加TAB数据
		this.bottomBarItems = [
			this.getNavigationBarItem(Icons.home, appTheme.primaryColor, 'Explore', selectedBarItemStyle),
			this.getNavigationBarItem(Icons.favorite, appTheme.primaryColor, 'Whatlist', defaultBarItemStyle),
			this.getNavigationBarItem(Icons.bookmark, appTheme.primaryColor, 'Deals', defaultBarItemStyle),
			this.getNavigationBarItem(Icons.notifications, appTheme.primaryColor, 'Notifications', defaultBarItemStyle)
		];
	}

	/**
	 * 构造TAB ITEM内容
	 * @params icon 图标
	 * @params color 图标颜色
	 * @params label 文字
	 * @params style 文样样式
	 */
	BottomNavigationBarItem getNavigationBarItem(IconData icon, Color color, String label, TextStyle style) {
		return BottomNavigationBarItem(
			icon: Icon(icon, color: color), title: Text(label, style: style)
		);
	}

	/// 构造底部样式TAB BAR
	@override
	Widget build(BuildContext context) {
		return Material(
			elevation: 15.0,
			child: BottomNavigationBar(items: this.bottomBarItems, type: BottomNavigationBarType.fixed)
		);
	}
}
