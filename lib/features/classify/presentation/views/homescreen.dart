import 'package:agro/features/classify/presentation/widgets/custombuttomnavigationbar.dart';
import 'package:agro/features/classify/presentation/widgets/custtomAppBar.dart';
import 'package:agro/features/classify/presentation/widgets/expertTipContainer.dart';
import 'package:agro/features/classify/presentation/widgets/landingTextContainer.dart';
import 'package:agro/features/classify/presentation/widgets/uploadandtakeimagecontainer.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CusttomAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child:  const LandingTextContainer(name: "Ali"),
                ),
               SizedBox(
                  height: 30,
                ),
                const UploadAndTakeImageContainer() , 
                const SizedBox(height: 30,),
                ExpertTipContainer()
                ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
