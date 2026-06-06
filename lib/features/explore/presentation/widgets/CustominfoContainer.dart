import 'package:agro/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/endlessWheatFIeld.png"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Optimizing Wheat Yield",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Rust is a common wheat disease caused by various fungal species belonging to the genera Puccinia and Phakopsora. It manifests as orange or reddish-brown lesions on the leaves, stems, and sometimes even the grains of wheat plants.",
                      style: TextStyle(
                        fontSize: 14 ,
                        
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
