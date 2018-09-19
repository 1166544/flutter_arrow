import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 在某些情况下，在从网上下载图片后缓存图片可能会很方便，以便它们可以脱机使用。
/// 为此可以使用cached_network_image包来达到目的。
/// 除了缓存之外，cached_image_network包在加载时还支持占位符和淡入淡出图片。
class ImageCachedApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Cached Images';
		final imageUrl = 'http://c.hiphotos.baidu.com/image/h%3D300/sign=cfce96dfa251f3dedcb2bf64a4eff0ec/4610b912c8fcc3ce912597269f45d688d43f2039.jpg';

		return new MaterialApp(
			title: title,
			home: new Scaffold(
				appBar: new AppBar(title: new Text(title)),
				body: new Center(
					child: new CachedNetworkImage(
						placeholder: new CircularProgressIndicator(),
						imageUrl: imageUrl
					)
				)
			)
		);
	}
}
