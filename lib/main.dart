import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flighttickets/flight/CustomAppBar.dart';
import 'package:flighttickets/flight/CustomShapeClipper.dart';
import 'package:flighttickets/flight/CustomFlightList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

// import './arrow/RandomScrollListApp.dart';
// import './themes/ThemesColorApp.dart';
// import './image/ImageHttpApp.dart';
// import './listview/ListViewApp.dart';
// import './listview/ListViewHorizontalApp.dart';
// import './listview/ListViewBuilderApp.dart';
// import './listview/ListCustomItemViewApp.dart';
// import './listview/ListHeadingItem.dart';
// import './listview/ListMessageItem.dart';
// import './listview/ListItem.dart';
// import './listview/ListGrid.dart';
// import './getsures//GestureTabsApp.dart';
// import './getsures//GestureMaterialApp.dart';
// import './getsures//GestureDismissibleApp.dart';
// import './image/ImageFadingApp.dart';
// import './image/ImageCachedApp.dart';
// import './navigation/NavigationBasicApp.dart';
// import './navigation/NavigationTodo.dart';
// import './navigation/NavigationPassingData.dart';
// import './navigation/NavigationHomeScreenApp.dart';
// import './networking/NetworkingFetchData.dart';
// import './sockets/SocketsApp.dart';
// import './lakes/LakesApp.dart';
// import './animates/AnimateListApp.dart';

ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);
final formatCurrency = NumberFormat.simpleCurrency();

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);
var homeScreenBottomPart = Column(
	children: <Widget>[
		Padding(
			padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
			child: Row(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Text('Currently Watched Items', style: dropDownMenuItemStyle),
					Spacer(),
					Text('VIEW ALL(12)', style: viewAllStyle)
				],
			),
		),
		Container(
			height: 240.0,
			child: StreamBuilder(
				stream: Firestore.instance.collection('cities').orderBy('newPrice').snapshots(),
				builder: (context, snapshot) {
					print('${snapshot.hasData}');
					return !snapshot.hasData
						? Center(child: CircularProgressIndicator())
						: _buildCitiesList(context, snapshot.data.documents);
				},
			),
		)
	],
);

Widget _buildCitiesList(BuildContext context, List<DocumentSnapshot> snapshots) {
	return ListView.builder(
		itemCount: snapshots.length,
		scrollDirection: Axis.horizontal,
		itemBuilder: (context, index) {
			return CityCard(city: City.fromSnapshot(snapshots[index]));
		},
	);
}

List<String> locations = List();
final _searchFieldController = TextEditingController();

/// 启动
Future<void> main() async {
	final FirebaseApp app = await FirebaseApp.configure(
		name: 'flight-firestore',
		options: Platform.isIOS
			? const FirebaseOptions(
              googleAppID: '1:1009830851809:ios:8658d2b8af672428',
              gcmSenderID: '1009830851809',
              databaseURL: 'https://flight-app-mock.firebaseio.com/',
            )
          : const FirebaseOptions(
              googleAppID: '1:1009830851809:android:8658d2b8af672428',
              apiKey: 'AIzaSyD40ZrOJQh-hTva6dQ-ddYo95fXq5LOb3E',
              databaseURL: 'https://flight-app-mock.firebaseio.com/',
            )
	);

	runApp(MaterialApp(
		title: 'Flight in the sky',
		debugShowCheckedModeBanner: false,
		home: HomeScreen(),
		theme: appTheme,
	));
}

/// 主启动类
class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: CustomAppBar(),
			body: SingleChildScrollView(
				scrollDirection: Axis.vertical,
				child: Column(
					children: <Widget>[
						HomeScreenTopPart(),
						homeScreenBottomPart,
						homeScreenBottomPart
					],
				),
			),
		);
	}
}

class HomeScreenTopPart extends StatefulWidget {
	@override
	_HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
	var selectedLocationIndex = 0;
	var isFlightSelected = true;

	@override
	Widget build(BuildContext context) {
		return Stack(
			children: <Widget>[
				ClipPath(
					clipper: CustomShapeClipper(),
					child: Container(
						height: 400.0,
						decoration: BoxDecoration(
							gradient: LinearGradient(colors: [firstColor, secondColor])
						),
						child: Column(
							children: <Widget>[
								SizedBox(height: 50.0),
								this.getStreamBuilder(context),
								SizedBox(height: 50.0),
								this.getColumnText(),
								SizedBox(height: 30.0),
								this.getColumnPadding(),
								SizedBox(height: 20.0),
								this.getColumnRow(),
							],
						),
					),
				)
			],
		);
	}

	Widget getColumnRow() {
		return Row(
			mainAxisSize: MainAxisSize.min,
			mainAxisAlignment: MainAxisAlignment.spaceAround,
			children: <Widget>[
				InkWell(
					child: ChoiceChip(
						Icons.flight_takeoff, 'Flights', this.isFlightSelected
					),
					onTap: () {
						setState(() {
							this.isFlightSelected = true;
						});
					},
				),
				SizedBox(width: 20.0),
				InkWell(
					child: ChoiceChip(
						Icons.hotel,
						'Hotels',
						!this.isFlightSelected
					),
					onTap: () {
						setState(() {
							this.isFlightSelected = false;
						});
					},
				)
			],
		);
	}

	Widget getColumnPadding() {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 32.0),
			child: Material(
				elevation: 5.0,
				borderRadius: BorderRadius.all(Radius.circular(30.0)),
				child: TextField(
					controller: _searchFieldController,
					style: dropDownMenuItemStyle,
					cursorColor: appTheme.primaryColor,
					decoration: InputDecoration(
						contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
						suffixIcon: Material(
							elevation: 2.0,
							borderRadius: BorderRadius.all(Radius.circular(30.0)),
							child: InkWell(
								onTap: () {
									this.navigateToPageRoute(context);
								},
								child: Icon(Icons.search, color: Colors.black),
							),
						),
						border: InputBorder.none
					)
				),
			),
		);
	}

	navigateToPageRoute(BuildContext context) {
		Navigator.push(context, MaterialPageRoute(
			builder: (context) =>
				InheritedFlightListing(
					fromLocation: locations[this.selectedLocationIndex],
					toLocation: _searchFieldController.text,
					child: FlightListingScreen(),
				)
		));
	}

	Widget getColumnText() {
		return Text(
			'Where would\nyou want to go?',
			style: TextStyle(fontSize: 24.0, color: Colors.white),
			textAlign: TextAlign.center
		);
	}

    Widget getStreamBuilder(BuildContext context) {
		return StreamBuilder(
			stream: Firestore.instance.collection('locations').snapshots(),
			builder: (context, snapshot) {
				if (snapshot.hasData) {
					addLocations(context, snapshot.data.documents);
				}

				return !snapshot.hasData
				? Container()
				: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Row(
						children: <Widget>[
							Icon(Icons.location_on, color: Colors.white),
							SizedBox(width: 16.0),
							PopupMenuButton(
								onSelected: (index) {
									setState(() {
										this.selectedLocationIndex = index;
									});
								},
								child: Row(
									children: <Widget>[
										Text(locations[this.selectedLocationIndex], style: dropDownLabelStyle),
										Icon(Icons.keyboard_arrow_down, color: Colors.white)
									],
								),
								itemBuilder: (BuildContext context) => _buildPopupMenuItem(),
							),
							Spacer(),
							Icon(Icons.settings, color: Colors.white)
						],
					),
				);
			},
		);
	}
}

List<PopupMenuItem<int>> _buildPopupMenuItem() {
	List<PopupMenuItem<int>> popupMenuItems = List();
	for (int i = 0; i < locations.length; i++) {
		popupMenuItems.add(
			PopupMenuItem(
				child: Text(locations[i], style: dropDownMenuItemStyle),
				value: i,
			)
		);
	}

	return popupMenuItems;
}

addLocations(BuildContext context, List<DocumentSnapshot> snapshots) {
	for(int i = 0; i < snapshots.length; i++) {
		final Location location = Location.fromSnapshot(snapshots[i]);
		locations.add(location.name);
	}
}

class ChoiceChip extends StatefulWidget {
	final IconData icon;
	final String text;
	final bool isSelected;

	ChoiceChip(this.icon, this.text, this.isSelected);

	@override
	_ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
			decoration: widget.isSelected
				? BoxDecoration(
					color: Colors.white.withOpacity(0.15),
					borderRadius: BorderRadius.all(Radius.circular(20.0))
				)
				: null,
			child: Row(
				mainAxisSize: MainAxisSize.min,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Icon(widget.icon, size: 20.0, color: Colors.white),
					SizedBox(width: 8.0),
					Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 16.0))
				],
			),
		);
	}
}
class Location {
  final String name;

  Location.fromMap(Map<String, dynamic> map)
      : assert(map['name'] != null),
        name = map['name'];

  Location.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);
}

class City {
	final String imagePath, cityName, monthYear, discount;
	final int oldPrice, newPrice;

	City.fromMap(Map<String, dynamic> map)
		: assert(map['cityName'] != null),
		  assert(map['monthYear'] != null),
		  assert(map['discount'] != null),
		  assert(map['imagePath'] != null),
		  imagePath = map['imagePath'],
		  cityName = map['cityName'],
		  monthYear = map['monthYear'],
		  discount = map['discount'],
		  oldPrice = map['oldPrice'],
		  newPrice = map['newPrice'];

	City.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);
}

class CityCard extends StatelessWidget {
	final City city;

	CityCard({this.city});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 8.0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					this.getCityCardClipRRect(),
					this.getCityCardRow()
				],
			),
		);
	}

	Widget getCityCardRow() {
		return Row(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				SizedBox(width: 5.0),
				Text('${formatCurrency.format(city.newPrice)}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)),
				SizedBox(width: 5.0),
				Text('${formatCurrency.format(city.oldPrice)}', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12.0))
			],
		);
	}

	Widget getCityCardClipRRect() {
		return ClipRRect(
			borderRadius: BorderRadius.all(Radius.circular(10.0)),
			child: Stack(
				children: <Widget>[
					Container(
						height: 210.0,
						width: 160.0,
						child: CachedNetworkImage(
							imageUrl: '${city.imagePath}',
							fit: BoxFit.cover,
							fadeInDuration: Duration(milliseconds: 500),
							fadeInCurve: Curves.easeIn,
							placeholder: Center(child: CircularProgressIndicator())
						),
					),
					Positioned(
						left: 0.0,
						bottom: 0.0,
						width: 160.0,
						height: 60.0,
						child: Container(
							decoration: BoxDecoration(
								gradient: LinearGradient(
									begin: Alignment.bottomCenter,
									end: Alignment.topCenter,
									colors: [Colors.black, Colors.black.withOpacity(0.1)]
								)
							),
						),
					)
				],
			),
		);
	}
}


// 动画列表
// void main(List<String> args) {
//   runApp(new AnimateListApp());
// }

// 创建不同类型子项的List
// void main() => runApp(new ListCustomItemViewApp(
//     items: new List<ListItem>.generate(
//         1000,
//         (i) => i % 6 == 0
//             ? new ListHeadingItem('Heading $i')
//             : new ListMessageItem('Sender $i', 'MessageBody $i'))
// 		)
// 	);

// 创建一个 grid List
// void main() {
// 	runApp(new ListGrid());
// }

// 处理点击
// void main() {
// 	runApp(new GestureTabsApp());
// }

// 处理点击-水波效果
// void main() {
// 	runApp(new GestureMaterialApp());
// }

// 实现滑动关闭
// void main() {
// 	runApp(new GestureDismissibleApp(
// 		items: new List<String>.generate(20, (i) => 'Item ${i + 1}')
// 	));
// }

// 占位符图片
// void main() {
// 	runApp(new ImageFadingApp());
// }

// 使用缓存图片
// void main() {
// 	runApp(new ImageCachedApp());
// }

// 导航到新页面并返回
// void main() {
// 	runApp(new MaterialApp(
// 		title: 'Navigation Basics',
// 		debugShowCheckedModeBanner: false,
// 		home: new NavigationBasicApp()
// 	));
// }

// 导航到新面并传值
// void main() {
// 	runApp(
// 		new MaterialApp(
// 			title: 'Padding data',
// 			debugShowCheckedModeBanner: false,
// 			home: new NavigationPassingData(
// 				// 生成20个待办事项并使用ListView显示它们
// 				todos: new List.generate(20, (i) => new NavigationTodo('Todo $i', 'A description of what needs to be done for Todo $i'))
// 			)
// 		)
// 	);
// }

// 导航到新页面并返回值
// void main() {
// 	runApp(new MaterialApp(
// 		title: 'Returning Data',
// 		debugShowCheckedModeBanner: false,
// 		home: new NavigationHomeScreenApp()
// 	));
// }

// 从网络获取数据
// void main(List<String> args) {
//   runApp(new NetworkingFetchDataApp());
// }

// SocketsHome
// void main(List<String> args) {
// 	runApp(new SockatesApp());
// }

// LAKES布局示例
// void main() {
//   runApp(new LakesApp());
// }
