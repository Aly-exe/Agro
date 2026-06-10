import 'package:agro/features/auth/presentation/widgets/agroLandingContainer.dart';
import 'package:agro/features/auth/presentation/widgets/customButton.dart';
import 'package:agro/features/auth/presentation/widgets/customTextFormField.dart';
import 'package:flutter/material.dart';

class AddNameScreen extends StatelessWidget {
  const AddNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AgroLandingContainer(),
            CustomTextFormField(
              hintText: "Ali Raslan",
              label: "Full Name",
              prefixIcon: "assets/icons/personIcon.svg",
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(onPressed: (){},text: "Add Name"),
            SizedBox(
              height: 30,
            ),
            
          ],
        ),
      ),
    );
  }
}