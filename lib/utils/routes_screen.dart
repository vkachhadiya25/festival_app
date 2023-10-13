import 'package:festival_app/screen/festival_screen.dart';
import 'package:festival_app/screen/festivaledit_screen.dart';
import 'package:festival_app/screen/splesh_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> routes_screen = {
  '/' : (Context) => SpleshScreen(),
  'festival' : (Context) => FestivalScreen(),
  'edit' : (Context) => FestivalEditScreen(),
};