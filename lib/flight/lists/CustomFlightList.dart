import 'package:flutter/material.dart';

/// 跳转子页处理
class InheritedFlightListing extends InheritedWidget {

	/// 前往
	final String toLocation;

	/// 来自
	final String fromLocation;

	InheritedFlightListing({this.fromLocation, this.toLocation, Widget child}): super(child: child);

	@override
	bool updateShouldNotify(InheritedWidget oldWidget) {
		return true;
	}

	/**
	 *  获取当前实例
	 */
	static InheritedFlightListing of(BuildContext context) {
		return context.inheritFromWidgetOfExactType(InheritedFlightListing);
	}
}
