import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 占位符方式显示内容加载
class ImageFadingApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Fade in images';
		final imageUrl = 'http://h.hiphotos.baidu.com/image/h%3D300/sign=5e8c6339bd51f819ee25054aeab54a76/d6ca7bcb0a46f21fd997bb41fb246b600c33ae05.jpg';

		// 当使用默认Image widget显示图片时，它们在加载完成后会直接显示到屏幕上。这可能会让用户产生视觉突兀。
		// 相反，如果你最初显示一个占位符，然后在图像加载完显示时淡入，可以使用FadeInImage来达到这个目的！
		// FadeInImage适用于任何类型的图片：内存、本地Asset或来自网上的图片。
		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)),
				body: new Stack(
					children: <Widget>[
						new Center(child: new CircularProgressIndicator()),
						new Center(
							child: new FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: imageUrl)
						)
					]
				)
			)
		);
	}
}
