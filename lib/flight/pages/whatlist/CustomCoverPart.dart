import 'package:flutter/material.dart';

class CustomCoverPart extends StatelessWidget {

	CustomCoverPart() {
		// hole
	}

	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				Image.asset('assets/images/sky.png'),
				Text('Back to Nature Camping Under the Star'),
						// Row(
						// 	children: <Widget>[
						// 		Icon(Icons.location_on, color: Colors.white),
						// 		SizedBox(width: 16.0),
						// 		Text('Labuan Bajo, NTT, Indonesia')
						// 	],
						// ),
						// Row(
						// 	children: <Widget>[
						// 		Image.asset('assets/images/pic1.png'),
						// 		Column(
						// 			children: <Widget>[
						// 				Text('Guided by'),
						// 				Text('Jonathan William')
						// 			],
						// 		)
						// 	],
						// )
			],
		);
	}
}
