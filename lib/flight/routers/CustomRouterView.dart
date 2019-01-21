import 'package:flutter/material.dart';

import 'package:flighttickets/flight/pages/deals/CustomDeals.dart';
import 'package:flighttickets/flight/pages/notifications/CustomNotifications.dart';
import 'package:flighttickets/flight/pages/whatlist/CustomWhatList.dart';
import 'package:flighttickets/flight/pages/home/CustomHomeIndex.dart';

/// 基础列表页面数据
class CustomRouterView {
	static final CustomRouterView _singleton = new CustomRouterView._internal();

	factory CustomRouterView() {
		return _singleton;
	}

	CustomRouterView._internal();

	// 默认样式
	TextStyle defaultBarItemStyle;

	// 选中样式
	TextStyle selectedBarItemStyle;

	/// 视图层页面列表
	List<Widget> getViewList() {
		return [
			CustomHomeIndex(),
			CustomWhatList(),
			CustomDeals(),
			CustomNotifications()
		];
	}

	/**
	 * TAB BAR数据
	 * @params appTheme 主题
	 */
	List<BottomNavigationBarItem> getBarButtonList(ThemeData appTheme) {

		// 默认样式
		final TextStyle defaultBarItemStyle = TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

		// 选中样式
		final TextStyle selectedBarItemStyle = defaultBarItemStyle.copyWith(color: appTheme.primaryColor);

		// 返回列表
		return [
			this.getNavigationBarItem(Icons.home, appTheme.primaryColor, 'Explore', selectedBarItemStyle),
			this.getNavigationBarItem(Icons.favorite, appTheme.primaryColor, 'Whatlist', defaultBarItemStyle),
			this.getNavigationBarItem(Icons.bookmark, appTheme.primaryColor, 'Deals', defaultBarItemStyle),
			this.getNavigationBarItem(Icons.notifications, appTheme.primaryColor, 'Notifications', defaultBarItemStyle)
		];
	}

	/**
	 * 构造TAB ITEM按钮内容
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
}
