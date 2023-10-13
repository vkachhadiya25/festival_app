import 'package:festival_app/model/category_model.dart';
import 'package:festival_app/model/festival_model.dart';
import 'package:festival_app/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({super.key});

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
  void initState() {
    super.initState();
    Global.g1.FestivalList.map((e) {
      FestivalModel q1 = FestivalModel.fromMap(e);
      Global.g1.modelList.add(q1);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Festival",
          style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: h,
              child: Image.asset(
                "assets/image/bg.jpg",
                fit: BoxFit.cover,
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 210),
              itemCount: Global.g1.festival.length,
              itemBuilder: (context, index) {
                return festivalTile(Global.g1.festival[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding festivalTile(FestivalModel f1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          List<FestivalModel> l1 = [];
          Global.g1.name = f1.name;
          for (var x in Global.g1.modelList) {
            if (x.name == f1.name) {
              l1.add(x);
            }
          }

          Navigator.pushNamed(context, 'edit', arguments: l1);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "assets/image/${f1.image}",
                height: 120,
              ),
              Spacer(),
              Text(
                "${f1.name}",
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
