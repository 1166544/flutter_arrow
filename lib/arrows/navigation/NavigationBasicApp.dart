import 'package:flutter/material.dart';

class NavigationBasicApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text('First Screen')),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Launch new screen'),

		  // 点击跳转至子页
		  // 调用Navigator.push方法。 该push方法将添加Route到由导航器管理的路由栈中
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SecondScreen()
				)
			);
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	  return new Scaffold(
		  appBar: new AppBar(title: new Text('Second Screen')),
		  body: new Center(
			  child: new RaisedButton(
				  // 点击跳转至首页
				  // pop方法将Route从导航器管理的路由栈中移除当前路径
				  onPressed: () {
					  Navigator.pop(context);
				  },
				  child: new Text('Go Back'),
			  )
		  ),
	  );
  }
}
