import 'dart:io';

import 'package:agro/features/auth/presentation/view_models/cubit/auth_cubit.dart';
import 'package:agro/features/classify/presentation/view_model/classify_cubit.dart';
import 'package:agro/features/classify/presentation/view_model/classify_cubit_states.dart';
import 'package:agro/features/classify/presentation/widgets/landingTextContainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadandtakeimagecontainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadedImageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                  : const LandingTextContainer(name: "Ali"),
            ),
            SizedBox(
              height: 30,
            ),
            isImageLoaded
                ?  UploadedImageView(imagePath: cubit.imagePath! , removeImage: cubit.removeImage,)
                :  UploadAndTakeImageContainer(
                  onCameraIconClick: ()async{
                    XFile image = await cubit.takeImagebyCamera();
                  },
                  onFileIconClick: ()async{
                    XFile image = await cubit.uploadImageFromGallary();
                  },
                ),
          ],
        );
      },
    );
  }
}
