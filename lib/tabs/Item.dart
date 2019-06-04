import 'package:meta/meta.dart';

class Item {
  int id;
  String name;
  String category;
  String min;
  String prodDesc;
  String directors;
  String max;
  String desc;
  double rating;
  String imageUrl;
  String bannerUrl;
  String trailerImg1;
  String trailerImg2;
  String trailerImg3;

  Item({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.directors,
    @required this.min,
    @required this.prodDesc,
    @required this.max,
    @required this.desc,
    @required this.rating,
    @required this.imageUrl,
    @required this.bannerUrl,
    @required this.trailerImg1,
    @required this.trailerImg2,
    @required this.trailerImg3,
  });
}