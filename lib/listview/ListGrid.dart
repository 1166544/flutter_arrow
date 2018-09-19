import 'package:flutter/material.dart';

class ListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(title: new Text(title)),
          body: this.getScaffoldBody(context)),
    );
  }

  Widget getScaffoldBody(BuildContext context) {
    return new GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      // Generate 100 Widgets that display their index in the List
      children: new List.generate(100, (index) {
        return new Center(
          child: new Text('Item $index', style: Theme.of(context).textTheme.headline)
        );
      }),
    );
  }
}
