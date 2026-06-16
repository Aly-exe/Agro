import 'dart:developer';

import 'package:agro/features/classify/data/repo/classify_repo_implementation.dart';
import 'package:agro/features/classify/presentation/view_model/classify_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ClassifyCubit extends Cubit<ClassifyCubitState> {
  ClassifyCubit() : super(ClassifyInitialState());
  ClassifyRepoImplementation classifyrepo = ClassifyRepoImplementation();
  bool isImageLoaded = false;
   String? imagePath;

  Future<XFile> uploadImageFromGallary() async {
    emit(LoadingUploadImageFromCameraState());
    try {
      XFile image = await classifyrepo.uploadImageFromGallary();
      imagePath = image.path;
      isImageLoaded = true;
      log("Image Uploaded Succefull");
      emit(SucessUploadImageFromCameraState());
      return image;
    } catch (e) {
      log("faild ${e}");
      emit(FailedUploadImageFromCameraState(e.toString()));
      rethrow;
    }
  }
}
