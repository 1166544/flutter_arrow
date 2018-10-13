import 'package:flutter/material.dart';
import './TabbedChoice.dart';
import './TabbedChoiceCard.dart';

class TabbedBarApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			home: new DefaultTabController(
				length: choices.length,
				child: Scaffold(
					appBar: AppBar(
						title: const Text('Tabbed AppBar'),
						bottom: TabBar(
							isScrollable: true,
							tabs: choices.map((Choice choice) {
								return Tab(
									text: choice.title,
									icon: Icon(choice.icon)
								);
							}).toList()
						),
					),
					body: TabBarView(
						children: choices.map((Choice choice) {
							return Padding(
								padding: const EdgeInsets.all(16.0),
								child: ChoiceCard(choice: choice)
							);
						}).toList(),
					)
				)
			)
		);
	}
}
