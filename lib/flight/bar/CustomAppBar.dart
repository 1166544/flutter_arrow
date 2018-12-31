import 'package:flutter/material.dart';
import 'package:flighttickets/flight/styles/CustomeStyle.dart';

/// 自定义APPBAR
class CustomAppBar extends StatelessWidget {
	final List<BottomNavigationBarItem> bottomBarItems = [];
	final bottomNavigationBarItemStyle = TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

	CustomAppBar() {
		BottomNavigationBarItem bottomBarItemExplore = BottomNavigationBarItem(
			icon: Icon(Icons.home, color: appTheme.primaryColor),
			title: Text('Explore', style: this.bottomNavigationBarItemStyle.copyWith(color: appTheme.primaryColor))
		);
		BottomNavigationBarItem bottomBarItemWatchList = BottomNavigationBarItem(
			icon: Icon(Icons.favorite, color: Colors.black),
			title: Text('Whatlist', style: this.bottomNavigationBarItemStyle)
		);
		BottomNavigationBarItem bottomBarItemNotifications = BottomNavigationBarItem(
			icon: Icon(Icons.notifications, color: Colors.black),
			title: Text('Notifications', style: this.bottomNavigationBarItemStyle)
		);

		this.bottomBarItems.add(bottomBarItemExplore);
		this.bottomBarItems.add(bottomBarItemWatchList);
		this.bottomBarItems.add(bottomBarItemNotifications);
	}

	@override
	Widget build(BuildContext context) {
		return Material(
			elevation: 15.0,
			child: BottomNavigationBar(items: this.bottomBarItems, type: BottomNavigationBarType.fixed)
		);
	}
}
