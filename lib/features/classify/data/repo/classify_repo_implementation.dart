import 'package:agro/features/classify/data/repo/classify_repo.dart';
import 'package:image_picker/image_picker.dart';

class ClassifyRepoImplementation implements ClassifyRepo {
  final picker = ImagePicker();

  @override
  Future classifyImage() async {}

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
