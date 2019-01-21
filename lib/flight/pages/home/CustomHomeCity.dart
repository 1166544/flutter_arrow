import 'package:cloud_firestore/cloud_firestore.dart';

/// 定义航班城市数据结构
class City {
	String imagePath = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546943418095&di=db880be0df853f32725e89413f52e9e2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F9f510fb30f2442a7be5cbf53db43ad4bd01302f1.jpg';
	String cityName = 'LA';
	String monthYear = '9';
	String discount = '0.5';
	int oldPrice = 20;
	int newPrice = 30;

	City() {
		// hole
	}

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
