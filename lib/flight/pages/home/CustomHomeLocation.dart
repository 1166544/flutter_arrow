import 'package:cloud_firestore/cloud_firestore.dart';

/// 数据过滤
class Location {
  String name = 'abc';

  Location() {
	  // hole
  }

  Location.fromMap(Map<String, dynamic> map)
      : assert(map['name'] != null),
        name = map['name'];

  Location.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);
}

