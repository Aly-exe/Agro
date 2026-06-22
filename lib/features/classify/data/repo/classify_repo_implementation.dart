import 'dart:developer';
import 'dart:io';
import 'package:agro/features/classify/data/repo/classify_repo.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ClassifyRepoImplementation implements ClassifyRepo {
  final picker = ImagePicker();

  @override
  Future classifyImage(imagePath) async {
    final image = File(imagePath);
    var interpreter = await Interpreter.fromAsset("assets/ML/model.tflite");
    final decoededImage = img.decodeImage(image.readAsBytesSync());
    final resized = img.copyResize(
      decoededImage!,
      width: 224,
      height: 224,
    );
    final input = [
      List.generate(224, (y) {
        return List.generate(224, (x) {
          final pixel = resized.getPixel(x, y);

          return <double>[
            pixel.r / 255.0,
            pixel.g / 255.0,
            pixel.b / 255.0,
          ];
        });
      })
    ];
    final output = [List<double>.filled(4, 0)];
    try {
      interpreter.run(input, output);
      final List<String> wheatClassificationList = ["Crown and Root Rot", "Healthy Wheat", "Leaf Rust","Wheat Loose Smut"];
      int predictionIndex = 0;

    log("Output is ${output.toString()}");
      for (int i = 0 ; i < output.first.length; i++ ){
        if(output.first[i] > output.first[predictionIndex]){
          predictionIndex = i;
        }
      }
      log("Wheat is ${wheatClassificationList[predictionIndex]}");
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    // log("${output.first}");
    interpreter.close();
  }

  @override
  Future deletImage() async {
    // TODO: implement deletImage
  }

  @override
  Future<XFile> takeImageByCamera() async {
    // TODO: implement takeImage
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image!;
  }

  @override
  Future<XFile> uploadImageFromGallary() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image!;
  }
}
