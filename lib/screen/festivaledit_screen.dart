import 'dart:io';

import 'package:festival_app/model/category_model.dart';
import 'package:festival_app/model/festival_model.dart';
import 'package:festival_app/utils/global.dart';
import 'package:festival_app/utils/color_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

class FestivalEditScreen extends StatefulWidget {
  const FestivalEditScreen({super.key});

  @override
  State<FestivalEditScreen> createState() => _FestivalEditScreenState();
}

class _FestivalEditScreenState extends State<FestivalEditScreen> {
  int bgColor = 0, txtColor = 2;
  bool bold = true;
  bool italic = false;
  bool font = false;
  Alignment txtAlign = Alignment.center;
  int bgimageindex = 0, fontStyle = 0;
  bool isVisible = false;
  GlobalKey globalKey = GlobalKey();
  double _value = 15;

  @override
  Widget build(BuildContext context) {
    List<FestivalModel> l1 = ModalRoute.of(context)!.settings.arguments as List<FestivalModel>;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${Global.g1.name}",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await saveImage();
                },
                icon: Icon(Icons.download)),
            IconButton(
                onPressed: () async {
                  File file = await saveImage();
                  await Share.shareXFiles([XFile(file.path)]);
                },
                icon: Icon(Icons.share)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RepaintBoundary(
                key: globalKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.57,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorList[bgColor],
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Image.asset("assets/bgimage/${l1[bgimageindex].image}",fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.57,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Container(
                      alignment: txtAlign,
                      child: SelectableText(
                        "${Global.g1.txtName.text}",
                        style: TextStyle(
                          color: colorList[txtColor],
                          fontSize: _value,
                          fontWeight:
                              bold ? FontWeight.bold : FontWeight.normal,
                          fontStyle:
                              italic ? FontStyle.italic : FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 5,),
               Container(
                height: 230,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (bgColor < colorList.length - 1) {
                                    bgColor++;
                                  } else {
                                    bgColor = 0;
                                  }
                                  isVisible = false;
                                });
                              },
                              icon: const Icon(Icons.color_lens)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  bold = !bold;
                                });
                              },
                              icon: const Icon(
                                Icons.format_bold,
                                color: Colors.black54,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  italic = !italic;
                                });
                              },
                              icon: const Icon(
                                Icons.format_italic,
                                color: Colors.black54,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (txtColor < colorList.length - 1) {
                                    txtColor++;
                                  } else {
                                    txtColor = 0;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.text_format_outlined,
                                color: Colors.black54,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: TextField(
                                          controller: Global.g1.txtName,
                                          decoration: const InputDecoration(
                                            label: Text(
                                                "Add to a screen festival name : "),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Ok",
                                                style: TextStyle(fontSize: 20),
                                              )),
                                        ],
                                      );
                                    },
                                  );
                                });
                              },
                              icon: Icon(Icons.text_fields)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  txtAlign = Alignment.centerLeft;
                                });
                              },
                              icon: const Icon(Icons.format_align_left)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  txtAlign = Alignment.center;
                                });
                              },
                              icon: const Icon(
                                  Icons.format_align_center_outlined)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  txtAlign = Alignment.centerRight;
                                });
                              },
                              icon: const Icon(Icons.format_align_right)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  bgColor = 0;
                                  txtColor = 2;
                                  bold = false;
                                  italic = false;
                                  font = false;
                                  txtAlign = Alignment.center;
                                  bgimageindex = 0;
                                  fontStyle = 0;
                                  isVisible = true;
                                });
                              },
                              icon: const Icon(Icons.restart_alt)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: l1.length,
                        itemExtent: 100,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    isVisible = true;
                                    bgimageindex = index;
                                  },
                                );
                              },
                              child: Image.asset(
                                "assets/bgimage/${l1[index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Slider(
                      min: 5,
                      max: 60,
                      divisions: 10,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black54,
                      thumbColor: Colors.white,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> saveImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    String file =
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}-${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
    return await File("/storage/emulated/0/Download/$file.png")
        .writeAsBytes(byteData!.buffer!.asUint8List());
  }
}
