import 'package:festival_app/utils/routes_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(useMaterial3: true),
       routes: routes_screen,
     )
  );
}

