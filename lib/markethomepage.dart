import 'package:agro/func.dart';
import 'package:agro/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'marketMedicine/showallmedicineitems.dart';
import 'marketWheat/showwheatitems.dart';

class MarketLayout extends StatefulWidget {
  const MarketLayout({super.key});

  @override
  State<MarketLayout> createState() => _MarketLayoutState();
}

class _MarketLayoutState extends State<MarketLayout> {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: screenSize.height * 0.1), // 10% of screen height
            Padding(
              padding: EdgeInsets.all(screenSize.width * 0.03), // 3% of screen width
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(context, ShowWheatItems());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Wheat.jpg',
                              width: screenSize.width * 0.6, // 60% of screen width
                              height: screenSize.height * 0.2, // 20% of screen height
                            ),
                            Text(
                              S.of(context).wheatmarket,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.055, // 5.5% of screen width
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.03), // 3% of screen width
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(context, ShowMedItems());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/medcine.jpg',
                              width: screenSize.width * 0.6, // 60% of screen width
                              height: screenSize.height * 0.2, // 20% of screen height
                            ),
                            Text(
                              S.of(context).medicinemarket,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.055, // 5.5% of screen width
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
