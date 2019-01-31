import 'package:flutter/material.dart';

/// 自定义直线形状
class CustomDiscoverClipper extends CustomClipper<Path> {

	@override
	Path getClip(Size size) {
		final Path path = Path();
		path.lineTo(0.0, size.height - 60.0);

		// 第一点
		var firstEndPoint = Offset(size.width * .5, size.height - 130.0);
		path.lineTo(firstEndPoint.dx, firstEndPoint.dy);

		// 第二点
		var secondEndPoint = Offset(size.width, size.height - 190.0);
		path.lineTo(secondEndPoint.dx, secondEndPoint.dy);

		path.lineTo(size.width, 0.0);
		path.close();

		return path;
	}

	@override
	bool shouldReclip(CustomClipper oldClipper) {
		return true;
	}
}
