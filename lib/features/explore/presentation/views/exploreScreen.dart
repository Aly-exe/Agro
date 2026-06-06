import 'package:agro/features/explore/presentation/widgets/CustominfoContainer.dart';
import 'package:flutter/material.dart';

class Explorescreen extends StatelessWidget {
  const Explorescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/images/endlessWheatFIeld.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black38, 
                        Colors.black26, 
                        Colors.black12, 
                        Colors.transparent
                      ],
                      begin: AlignmentGeometry.bottomCenter,
                      end: AlignmentGeometry.topCenter)),
            ),
            Positioned(
                left: 20,
                bottom: 30,
                child: Text(
                  "Wheat Mastery",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Manrope",
                      color: Colors.white),
                )),
            Positioned(
                left: 20,
                bottom: 10,
                child: Text(
                  "Essential insights for this season's harvest",
                  style: TextStyle(
                      fontSize: 16, fontFamily: "Manrope", color: Colors.white),
                )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (index, context) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: CustomInfoContainer(),
                  );
                }),
          ),
        )
      ],
    );
  }
}
