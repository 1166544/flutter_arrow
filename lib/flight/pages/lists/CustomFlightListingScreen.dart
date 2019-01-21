import 'package:flutter/material.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightListTopPart.dart';
import 'package:flighttickets/flight/pages/lists/CustomFlightListingBottomPart.dart';

/// 搜索页面
class FlightListingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Search Result'),
          elevation: 0.0,
          centerTitle: true,
          leading: InkWell(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.maybePop(context);				// 返回导航点击处理
              })
		),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[								// 搜索页面内容列表
            FlightListTopPart(),							// 顶部内容
            SizedBox(height: 20.0),
            FlightListingBottomPart()						// 底部内容
          ],
        ),
      ),
    );
  }
}
