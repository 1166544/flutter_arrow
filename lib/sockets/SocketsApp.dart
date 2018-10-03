import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// SOCKET示例
class SockatesApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'WebSockt Demo';
		return MaterialApp(
			title: title,
			debugShowCheckedModeBanner: false,
			home: new SocketsHome(
				title: title,
				channel: new IOWebSocketChannel.connect('ws://echo.websocket.org')
			)
		);
	}
}

/// 定义构造体传入
class SocketsHome extends StatefulWidget {
	final String title;
	final WebSocketChannel channel;

	SocketsHome({Key key, @required this.title, @required this.channel}): super(key: key);

	@override
	SocketsState createState() => new SocketsState();
}

/// SOCKET控制体
class SocketsState extends State<SocketsHome> {
	TextEditingController _controller = new TextEditingController();

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(title: new Text(widget.title)),
			body: new Padding(
				padding: const EdgeInsets.all(20.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: this.getBodyChildren()
				),
			),
			floatingActionButton: new FloatingActionButton(
				onPressed: this._sendMessage,
				tooltip: 'Send message',
				child: new Icon(Icons.send)
			),
		);
	}

	/// BODY列表数据
	List<Widget> getBodyChildren() {
		return <Widget>[
			new Form(
				child: TextFormField(
					controller: this._controller,
					decoration: InputDecoration(labelText: 'Send a message')
				)
			),
			new StreamBuilder(
				stream: widget.channel.stream,
				builder: (context, snapshot) {
					return Padding(
						padding: const EdgeInsets.symmetric(vertical: 240),
						child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
					);
				}
			)
		];
	}

	/// 发送数据
	void _sendMessage() {
		if (this._controller.text.isNotEmpty) {
			widget.channel.sink.add(this._controller.text);
		}
	}

	@override
	void dispose() {
		widget.channel.sink.close();
		super.dispose();
	}
}
