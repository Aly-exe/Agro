import 'dart:developer';
import 'dart:io';

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
    emit(LoadingUploadImageFromGallaryState());
    try {
      XFile imageFile = await classifyrepo.uploadImageFromGallary();
      imagePath = imageFile.path;
      isImageLoaded = true;
      log("Image Uploaded Succefull");
      emit(SucessUploadImageFromGallaryState());
      return imageFile;
    } catch (e) {
      log("faild ${e}");
      emit(FailedUploadImageFromGallaryState(e.toString()));
      rethrow;
    }
  }
  Future<XFile> takeImagebyCamera() async {
    emit(LoadingTakeImagByCameraState());
    try {
      XFile image = await classifyrepo.takeImageByCamera();
      imagePath = image.path;
      isImageLoaded = true;
      log("Image Uploaded Succefull");
      emit(SucessTakeImageByCameraState());
      return image;
    } catch (e) {
      log("faild ${e}");
      emit(FailedTakeImageByCameraState(e.toString()));
      rethrow;
    }
  }
  void removeImage(){
    isImageLoaded= false;
    emit(SuccessRemoveImageState());
  }
}
