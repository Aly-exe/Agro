abstract class ClassifyCubitState {}

class ClassifyInitialState extends ClassifyCubitState{}
class LoadingTakeImagByCameraState extends ClassifyCubitState{}
class SucessTakeImageByCameraState extends ClassifyCubitState{}
class FailedTakeImageByCameraState extends ClassifyCubitState{
  final String errorMessage;
  FailedTakeImageByCameraState(this.errorMessage); 
}
class SuccessRemoveImageState extends ClassifyCubitState{}
class LoadingUploadImageFromGallaryState extends ClassifyCubitState{}
class SucessUploadImageFromGallaryState extends ClassifyCubitState{}
class FailedUploadImageFromGallaryState extends ClassifyCubitState{
  final String errorMessage;
  FailedUploadImageFromGallaryState(this.errorMessage); 
}
class LoadingClassifyImageState extends ClassifyCubitState{}
class SucessClassifyImageState extends ClassifyCubitState{}
class FailedClassifyImageState extends ClassifyCubitState{
  final String errorMessage;
  FailedClassifyImageState(this.errorMessage); 
}