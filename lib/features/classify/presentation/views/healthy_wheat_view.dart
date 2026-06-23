import 'package:agro/features/classify/presentation/widgets/landing_wheat_classification_container.dart';
import 'package:flutter/material.dart';

class HealthyWheatView extends StatelessWidget {
  const HealthyWheatView(
      {super.key,
      required this.image,
      required this.wheatClassificationresult});
  final String image;
  final String wheatClassificationresult;
  @override
  Widget build(BuildContext context) {
    return LandingWhaetClassificationContainer(
      image: image,
      wheatClassification: wheatClassificationresult,
    );
  }
}
