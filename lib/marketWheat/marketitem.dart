import 'package:agro/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'wheatmarketitemModel.dart';

class MarketItem extends StatelessWidget {
  final WheatItem wheatItem;

  const MarketItem({Key? key, required this.wheatItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.025, // 2.5% of screen width
        vertical: screenSize.height * 0.01, // 1% of screen height
      ),
      child: Container(
        padding: EdgeInsets.all(screenSize.width * 0.02), // 2% of screen width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row to show icon and user name
            Padding(
              padding: EdgeInsets.all(screenSize.width * 0.02), // 2% of screen width
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: screenSize.width * 0.075, // 7.5% of screen width
                  ),
                  SizedBox(width: screenSize.width * 0.0375), // 3.75% of screen width
                  Text(
                    wheatItem.name, // Use wheatItem properties
                    style: TextStyle(fontSize: screenSize.width * 0.045), // 4.5% of screen width
                  ),
                ],
              ),
            ),
            // Row to show available items and price, image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      S.of(context).available,
                      style: TextStyle(fontSize: screenSize.width * 0.0375), // 3.75% of screen width
                    ),
                    SizedBox(height: screenSize.height * 0.018), // 1.8% of screen height
                    Text(
                      '${wheatItem.quantity} ${S.of(context).kilo}', // Use wheatItem properties
                      style: TextStyle(
                        fontSize: screenSize.width * 0.0375, // 3.75% of screen width
                        color: Colors.teal[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenSize.width * 0.075), // 7.5% of screen width
                Column(
                  children: [
                    Text(
                      S.of(context).Price,
                      style: TextStyle(fontSize: screenSize.width * 0.0375), // 3.75% of screen width
                    ),
                    SizedBox(height: screenSize.height * 0.018), // 1.8% of screen height
                    Text(
                      '${wheatItem.price} ${S.of(context).pound}', // Use wheatItem properties
                      style: TextStyle(
                        fontSize: screenSize.width * 0.0375, // 3.75% of screen width
                        color: Colors.teal[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenSize.width * 0.075), // 7.5% of screen width
                Column(
                  children: [
                    Image.asset(
                      'assets/images/Wheat.jpg',
                      width: screenSize.width * 0.2, // 20% of screen width
                      height: screenSize.height * 0.125, // 12.5% of screen height
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.0125), // 1.25% of screen height
            IconButton(
              onPressed: () {
                final Uri whatsApp = Uri.parse('https://wa.me/+2${wheatItem.phone}');
                launchUrl(whatsApp);
              },
              icon: Icon(
                Icons.message_outlined,
                color: Colors.teal[500],
                size: screenSize.width * 0.075, // 7.5% of screen width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
