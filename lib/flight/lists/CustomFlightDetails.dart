import 'package:cloud_firestore/cloud_firestore.dart';

/// 航班信息数据
class FlightDetails {
	String airlines = 'Sky line';
	String date = '2019-01-08';
	String discount = '0.7';
	String rating = '25%';

	int oldPrice = 111;
	int newPrice = 185;

	FlightDetails() {
		// hole
	}

	FlightDetails.fromMap(Map<String, dynamic> map)
		: assert(map['airlines'] != null),
		  assert(map['date'] != null),
		  assert(map['discount'] != null),
		  assert(map['rating'] != null),
		  airlines = map['airlines'],
		  date = map['date'],
		  discount = map['discount'],
		  oldPrice = map['oldPrice'],
		  newPrice = map['newPrice'],
		  rating = map['rating'];

	FlightDetails.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);
}
