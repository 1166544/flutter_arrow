import 'package:flutter/material.dart';

class ImageHttpApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Web Image';
		final imageUrl = 'https://camo.githubusercontent.com/2fa9c4482c77e7ce71a7aa0776f2236624b796e4/68747470733a2f2f6d617263696e737a616c656b2e706c2f77702d636f6e74656e742f75706c6f6164732f323031382f30352f66665f31362e676966';

		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)),
				body: new Image.network(imageUrl)
			)
		);
	}
}
