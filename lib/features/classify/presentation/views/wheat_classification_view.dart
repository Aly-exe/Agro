import 'package:agro/core/services/navigate.dart';
import 'package:agro/features/classify/presentation/views/diseased_wheat_view.dart';
import 'package:agro/features/classify/presentation/views/healthy_wheat_view.dart';
import 'package:agro/features/classify/presentation/views/homescreen.dart';
import 'package:agro/features/classify/presentation/widgets/custtomAppBar.dart';
import 'package:agro/features/classify/presentation/widgets/custtom_app_button.dart';
import 'package:flutter/material.dart';

class WheatClassificationView extends StatelessWidget {
  const WheatClassificationView(
      {super.key,
      required this.classificationResult,
      required this.image,
      this.wheatTreatment});
  final String image;
  final String classificationResult;
  final String? wheatTreatment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusttomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            classificationResult == "Healthy Wheat"
            ? HealthyWheatView(
                image: image,
                wheatClassificationresult: classificationResult,
              )
            : DiseasedWheatView(image: image , wheatClassification: classificationResult,),
            SizedBox(height: 20,),
            CusttomAppButton(onTap: (){
              // navigateToandReplace(context, Homescreen());
            }, text: "Classify Another", icon: "assets/icons/classifyIcon.svg")
          ],
        ),
      )
    );
  }
}
