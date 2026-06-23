import 'package:agro/features/classify/presentation/widgets/landing_wheat_classification_container.dart';
import 'package:flutter/material.dart';

class DiseasedWheatView extends StatelessWidget {
  const DiseasedWheatView(
      {super.key, required this.image, required this.wheatClassification});
  final String image;
  final String wheatClassification;

  @override
  Widget build(BuildContext context) {
    return LandingWhaetClassificationContainer(
        image: image, wheatClassification: wheatClassification);
  }
}
