import 'dart:developer';
import 'dart:io';

import 'package:agro/screens/diseaseAndtreatmentscreens/crown%20and%20root%20rot.dart';
import 'package:agro/generated/l10n.dart';
import 'package:agro/screens/diseaseAndtreatmentscreens/leaf%20rust.dart';
import 'package:agro/screens/diseaseAndtreatmentscreens/loose%20smut.dart';
import 'package:agro/services/sharedpreferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  final imagePicker = ImagePicker();
  final player = AudioPlayer();
  final player1 = AudioPlayer();
  IconData play = Icons.play_arrow;
  IconData play1 = Icons.play_arrow;
  List<dynamic>? output;
  String? lastoutput;
  Future<void> uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  Future<void> takeImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  Future loadModel() async {
    await Tflite.loadModel(
            model: "assets/ML/model.tflite", labels: "assets/ML/labels.txt")
        .then((value) {
      log("Model loaded successfully");
    }).catchError((error) {
      log(error.toString());
    });
  }

  File? img;

  Future classifyImage(File image) async {
    List<dynamic>? classify = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.2,
      imageMean: 255,
      imageStd: 255,
    );
    return classify;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.green,
            height: height * 0.25,
          ),
        ),
        image == null
            ? Positioned(
                top: height * .35,
                left: width * 0.11,
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: width * .2,
                        backgroundColor: Color(0xffC6DCBA),
                        child: IconButton(
                          iconSize: width * 0.2,
                          onPressed: uploadImage,
                          icon: Icon(
                            Icons.add_photo_alternate_rounded,
                            color: Colors.black87,
                          ),
                        )),
                    SizedBox(
                      width: width * .025,
                    ),
                    CircleAvatar(
                        radius: width * .2,
                        backgroundColor: Color(0xffC6DCBA),
                        child: IconButton(
                          iconSize: width * 0.2,
                          onPressed: takeImage,
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black87,
                          ),
                        )),
                  ],
                ))
            :
            //if image isn't null  display the image
            Positioned(
                right: width * .22,
                left: width * .22,
                top: height * .12,
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      image = null;
                      output = null;
                      lastoutput = null;
                    });
                  },
                  child: CircleAvatar(
                      radius: width * .28,
                      backgroundColor: Color(0xffC6DCBA),
                      backgroundImage: FileImage(image!)),
                ),
              ),
        image == null
            ? Positioned(
                top: height * 0.49,
                left: width * .20,
                child: Row(
                  children: [
                    IconButton(
                        iconSize: width * .15,
                        onPressed: () {
                          setState(() {
                            if (play1 != Icons.pause) {
                              if (play == Icons.play_arrow) {
                                play = Icons.pause;
                              } else {
                                play = Icons.play_arrow;
                              }
                            }
                            player.onPlayerComplete.listen((event) {
                              setState(() {
                                play = Icons.play_arrow;
                              });
                            });
                          });
                          if (play == Icons.pause) {
                            CashHelper.getData(key:"lang") =="ar"? player.play(AssetSource("sounds/audio2.wav")):player.play(AssetSource("sounds/gallary.mp3"));
                          } else {
                            player.stop();
                          }
                        },
                        icon: Icon(play)),
                    SizedBox(
                      width: width * .25,
                    ),
                    IconButton(
                        iconSize: width * .15,
                        onPressed: () {
                          setState(() {
                            if(play != Icons.pause){
                              if (play1 == Icons.play_arrow) {
                              play1 = Icons.pause;
                            } else {
                              play1 = Icons.play_arrow;
                            }
                            }
                            player1.onPlayerComplete.listen((event) {
                              setState(() {
                                play1 = Icons.play_arrow;
                              });
                            });
                          });
                          if (play1 == Icons.pause) {
                          CashHelper.getData(key: "lang")=="ar" ?  player1.play(AssetSource("sounds/audio1.wav")):player1.play(AssetSource("sounds/camera.mp3"));
                          } else {
                            player1.stop();
                          }
                        },
                        icon: Icon(play1)),
                  ],
                ))
            : SizedBox.square(),
        Positioned(
          top: height * .45,
          left: width * .34,
          child: image == null
              ? SizedBox(width: 0, height: 0)
              : Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: MaterialButton(
                    onPressed: () async {
                      if (image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Plaese upload or take an image ")));
                      } else {
                        final val = await classifyImage(image!);
                        setState(() {
                          output = val;
                          if (output![0]["label"].toString() ==
                              "0 Crown and Root Rot") {
                            setState(() {
                              lastoutput = S.of(context).Crown_Root_Rot;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        CrownAndRootRotScreen(image))));
                          } else if (output![0]["label"].toString() ==
                              "1 Healthy Wheat") {
                            setState(() {
                              lastoutput = S.of(context).Healthy_Wheat;
                            });
                          } else if (output![0]["label"].toString() ==
                              "2 Leaf Rust") {
                            setState(() {
                              lastoutput = S.of(context).Leaf_Rust;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LeafRust(image))));
                          } else if (output![0]["label"].toString() ==
                              "3 Wheat Loose Smut") {
                            setState(() {
                              lastoutput = S.of(context).Wheat_Loose_Smut;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LooseSmut(image))));
                          }
                        });
                      }
                    },
                    child: Text(
                      S.of(context).diagnose,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
        ),
        Positioned(
          top: height * .6,
          left: width * .2,
          child: (image != null && output != null)
              ? Container(
                  alignment: Alignment.center,
                  width: width * .65,
                  child: Text(
                    lastoutput!,
                    style: TextStyle(fontSize: 24.0, color: Colors.black),
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 0.6, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
