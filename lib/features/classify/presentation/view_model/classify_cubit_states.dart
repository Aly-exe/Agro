abstract class ClassifyCubitState {}

class ClassifyInitialState extends ClassifyCubitState{}
class SucessUploadImageFromCameraState extends ClassifyCubitState{}
class LoadingUploadImageFromCameraState extends ClassifyCubitState{}
class FailedUploadImageFromCameraState extends ClassifyCubitState{
  final String errorMessage;
  FailedUploadImageFromCameraState(this.errorMessage); 
}