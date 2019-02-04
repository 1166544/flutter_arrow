import 'package:flutter/material.dart';

/// 带圆角效果用户头像
class CommonAvata extends StatelessWidget {
	CommonAvata() {
		// hole
	}

	@override
	Widget build(BuildContext context) {
		return Hero(
			tag: 'assets/images/pic10.png',
			child: Container(
				width: 125,
				height: 125,
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(62.5),
					image: DecorationImage(
						fit: BoxFit.cover,
						image: AssetImage('assets/imagesl/pic10.png')
					)
				),
			),
		);
	}
}
