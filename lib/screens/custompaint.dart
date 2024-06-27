// import 'dart:io';
// import 'package:agro/generated/l10n.dart';
// import 'package:agro/screens/diseaseAndtreatmentscreens/crown%20and%20root%20rot.dart';
// import 'package:agro/screens/diseaseAndtreatmentscreens/leaf%20rust.dart';
// import 'package:agro/screens/diseaseAndtreatmentscreens/loose%20smut.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';

// class CustomScreen extends StatefulWidget {
//   CustomScreen({super.key});

//   @override
//   State<CustomScreen> createState() => _CustomScreenState();
// }

// class _CustomScreenState extends State<CustomScreen> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   List<dynamic>? output;
//   String? lastoutput;

//   Future<void> _getImageFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _captureImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future loadModel() async {
//     await Tflite.loadModel(
//             model: "assets/ML/model.tflite", labels: "assets/ML/labels.txt")
//         .then((value) {})
//         .catchError((error) {});
//   }

//   Future classifyImage(File image) async {
//     List<dynamic>? classify = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 1,
//       threshold: 0.2,
//       imageMean: 255,
//       imageStd: 255,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Diagnosing image...')),
//     );
//     return classify;
//   }

//   void _diagnoseImage() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Diagnosing image...')),
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadModel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 'Wheat Image Classifier',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 30),
//           if (_image != null)
//             Container(
//               padding: EdgeInsets.all(10),
//               child: GestureDetector(
//                   onDoubleTap: () {
//                     setState(() {
//                       _image = null;
//                     });
//                   },
//                   child: Image.file(_image!)),
//               height: 200,
//             ),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: _getImageFromGallery,
//                 style: ElevatedButton.styleFrom(
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(20),
//                   backgroundColor: Colors.green[100],
//                 ),
//                 child: Icon(
//                   Icons.image,
//                   size: 30,
//                   color: Colors.green,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _captureImage,
//                 style: ElevatedButton.styleFrom(
//                   shape: CircleBorder(),
//                   padding: EdgeInsets.all(20),
//                   backgroundColor: Colors.green[100],
//                 ),
//                 child: Icon(
//                   Icons.camera_alt,
//                   size: 30,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           if (_image != null)
//             ElevatedButton(
//               onPressed: () async {
//                 if (_image == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text("Plaese upload or take an image ")));
//                 } else {
//                   final val = await classifyImage(_image!);
//                   setState(() {
//                     output = val;
//                     if (output![0]["label"].toString() ==
//                         "0 Crown and Root Rot") {
//                       lastoutput = S.of(context).Crown_Root_Rot;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: ((context) =>
//                                   CrownAndRootRotScreen(_image))));
//                     } else if (output![0]["label"].toString() ==
//                         "1 Healthy Wheat") {
//                       lastoutput = S.of(context).Healthy_Wheat;
//                     } else if (output![0]["label"].toString() ==
//                         "2 Leaf Rust") {
//                       lastoutput = S.of(context).Leaf_Rust;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: ((context) => LeafRust(_image))));
//                     } else if (output![0]["label"].toString() ==
//                         "3 Wheat Loose Smut") {
//                       lastoutput = S.of(context).Wheat_Loose_Smut;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: ((context) => LooseSmut(_image))));
//                     }
//                   });
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//               child: Text(
//                 'Diagnose',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:agro/generated/l10n.dart';
import 'package:agro/screens/diseaseAndtreatmentscreens/crown%20and%20root%20rot.dart';
import 'package:agro/screens/diseaseAndtreatmentscreens/leaf%20rust.dart';
import 'package:agro/screens/diseaseAndtreatmentscreens/loose%20smut.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class CustomScreen extends StatefulWidget {
  CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<dynamic>? output;
  String? lastoutput;
  bool _isPlaying1 = false;
  bool _isPlaying2 = false;

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _toggleAudio1() async {
    if (_isPlaying1) {
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.play(AssetSource("sounds/audio2.wav"));
    }
    setState(() {
      _isPlaying1 = !_isPlaying1;
      if (_isPlaying1) {
        _isPlaying2 = false;
      }
    });
  }

  Future<void> _toggleAudio2() async {
    if (_isPlaying2) {
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.play(AssetSource("sounds/audio1.wav"));
    }
    setState(() {
      _isPlaying2 = !_isPlaying2;
      if (_isPlaying2) {
        _isPlaying1 = false;
      }
    });
  }

  Future loadModel() async {
    await Tflite.loadModel(
            model: "assets/ML/model.tflite", labels: "assets/ML/labels.txt")
        .then((value) {})
        .catchError((error) {});
  }

  Future classifyImage(File image) async {
    List<dynamic>? classify = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.2,
      imageMean: 255,
      imageStd: 255,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Diagnosing image...')),
    );
    return classify;
  }

  void _diagnoseImage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Diagnosing image...')),
    );
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying1 = false;
        _isPlaying2 = false;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                'Wheat Image Classifier',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          if (_image != null)
            Container(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      _image = null;
                    });
                  },
                  child: Image.file(_image!)),
              height: 200,
            ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _getImageFromGallery,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green[100],
                    ),
                    child: Icon(
                      Icons.image,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isPlaying1 ? Icons.pause : Icons.play_arrow),
                    onPressed: _toggleAudio1,
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _captureImage,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green[100],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    icon: Icon(_isPlaying2 ? Icons.pause : Icons.play_arrow),
                    onPressed: _toggleAudio2,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          if (_image != null)
            ElevatedButton(
              onPressed: () async {
                if (_image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please upload or take an image")));
                } else {
                  final val = await classifyImage(_image!);
                  setState(() {
                    output = val;
                    if (output![0]["label"].toString() ==
                        "0 Crown and Root Rot") {
                      lastoutput = S.of(context).Crown_Root_Rot;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  CrownAndRootRotScreen(_image))));
                    } else if (output![0]["label"].toString() ==
                        "1 Healthy Wheat") {
                      lastoutput = S.of(context).Healthy_Wheat;
                    } else if (output![0]["label"].toString() ==
                        "2 Leaf Rust") {
                      lastoutput = S.of(context).Leaf_Rust;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LeafRust(_image))));
                    } else if (output![0]["label"].toString() ==
                        "3 Wheat Loose Smut") {
                      lastoutput = S.of(context).Wheat_Loose_Smut;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LooseSmut(_image))));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Diagnose',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

