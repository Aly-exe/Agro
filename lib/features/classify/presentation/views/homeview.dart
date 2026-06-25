import 'package:agro/core/services/navigate.dart';
import 'package:agro/features/classify/presentation/view_model/classify_cubit.dart';
import 'package:agro/features/classify/presentation/view_model/classify_cubit_states.dart';
import 'package:agro/features/classify/presentation/views/wheat_classification_view.dart';
import 'package:agro/features/classify/presentation/widgets/landingTextContainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadandtakeimagecontainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadedImageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key , required this.name});
  final String name ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClassifyCubit, ClassifyCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<ClassifyCubit>();
        bool isImageLoaded = cubit.isImageLoaded;
        return Column(
          children: [
            SizedBox(
              height: isImageLoaded ? 0 : 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: isImageLoaded
                  ? const SizedBox.shrink()
                  :  LandingTextContainer(name: name),
            ),
            SizedBox(
              height: 30,
            ),
            isImageLoaded
                ? UploadedImageView(
                    imagePath: cubit.imagePath!,
                    removeImage: cubit.removeImage,
                    classifyImageByAI: () async {
                      await cubit.classifyImage(cubit.imagePath!).then((val) {
                        navigateToandReplace(
                            context,
                            WheatClassificationView(
                                classificationResult: val,
                                image: cubit.imagePath!));
                      });
                    },
                  )
                : UploadAndTakeImageContainer(
                    onCameraIconClick: () async {
                      XFile image = await cubit.takeImagebyCamera();
                    },
                    onFileIconClick: () async {
                      XFile image = await cubit.uploadImageFromGallary();
                    },
                  ),
          ],
        );
      },
    );
  }
}
