import 'dart:ui';

import 'package:festival_app/model/category_model.dart';

class FestivalModel {
  String? name, image;
  Color? color;

  FestivalModel({this.name, this.image});

  factory FestivalModel.fromMap(Map m1) {
    FestivalModel q1 = FestivalModel(image: m1['image'], name: m1['name']);
    return q1;
  }
}
