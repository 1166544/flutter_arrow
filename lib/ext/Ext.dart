import 'package:flutter/material.dart';

class Ext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'title',
      home: new Scaffold(
          appBar: new AppBar(title: new Text('title')),
          body: this.getScaffoldBody(context)),
    );
  }

  Widget getScaffoldBody(BuildContext context) {
	  return new Container(
		  child: Text(
			  'Test',
			  textAlign: Textlign.center
		  )
	  );
  }
}
