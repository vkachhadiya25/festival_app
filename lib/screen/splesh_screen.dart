import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, 'festival');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/image/festival.png",
            height: 200,
          ),
        ),
      ),
    );
  }
}
