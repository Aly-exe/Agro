import 'package:image_picker/image_picker.dart';

abstract class ClassifyRepo {
  Future<XFile>? uploadImageFromGallary(){}
  Future<XFile>? takeImageByCamera(){}
  Future? deletImage(){}
  Future? classifyImage(){}
}