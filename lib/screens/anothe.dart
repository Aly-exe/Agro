import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';


class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final AudioPlayer _player = AudioPlayer();

  Future<void> _getImageFromGallery() async {
    await _player.play(AssetSource("sounds/audio1.wav"));
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImage() async {
    await _player.play(AssetSource("sounds/audio2.wav"));
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _diagnoseImage() {
    // Add your image diagnosis logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Diagnosing image...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              // Handle language change
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.teal,
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
              child: Image.file(_image!),
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
                      backgroundColor: Colors.teal[100],
                    ),
                    child: Icon(
                      Icons.image,
                      size: 30,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Upload Image'),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _captureImage,
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.teal[100],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Capture Image'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          if (_image != null)
            ElevatedButton(
              onPressed: _diagnoseImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
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
