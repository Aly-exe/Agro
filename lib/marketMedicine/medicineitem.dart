import 'package:agro/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'medicineitemModel.dart';

class MedicineItem extends StatelessWidget {
  final Medicine medicine;

  const MedicineItem({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.03, // 3% of screen width
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
            SizedBox(height: screenSize.width * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: screenSize.width * 0.03),
                Icon(
                  Icons.person,
                  size: screenSize.width * 0.08, // 8% of screen width
                ),
                SizedBox(width: screenSize.width * 0.03), // 3% of screen width
                Expanded(
                  child: Text(
                    '${medicine.name}',
                    style: TextStyle(fontSize: screenSize.width * 0.045), // 4.5% of screen width
                  ),
                ),
                Image.asset(
                  "assets/images/medcine.jpg",
                  width: screenSize.width * 0.3, // 30% of screen width
                  height: screenSize.height * 0.15, // 15% of screen height
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02), // 2% of screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      S.of(context).available,
                      style: TextStyle(fontSize: screenSize.width * 0.04), // 4% of screen width
                    ),
                    SizedBox(height: screenSize.height * 0.015), // 1.5% of screen height
                    Text(
                      ' ${medicine.quantity} ${S.of(context).package}',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04, // 4% of screen width
                        color: Colors.teal[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenSize.width * 0.05), // 5% of screen width
                Column(
                  children: [
                    Text(
                      S.of(context).Price,
                      style: TextStyle(fontSize: screenSize.width * 0.04), // 4% of screen width
                    ),
                    SizedBox(height: screenSize.height * 0.015), // 1.5% of screen height
                    Text(
                      '${medicine.price} ${S.of(context).pound}',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04, // 4% of screen width
                        color: Colors.teal[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenSize.width * 0.05), // 5% of screen width
                Column(
                  children: [
                    Text(
                      S.of(context).ProductName,
                      style: TextStyle(fontSize: screenSize.width * 0.04), // 4% of screen width
                    ),
                    SizedBox(height: screenSize.height * 0.015), // 1.5% of screen height
                    Text(
                      '${medicine.productName}',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.04, // 4% of screen width
                        color: Colors.teal[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02), // 2% of screen height
            IconButton(
              onPressed: () {
                final Uri whatsApp = Uri.parse('https://wa.me/+2${medicine.phone}');
                launchUrl(whatsApp);
              },
              icon: Icon(
                Icons.message_outlined,
                color: Colors.teal[500],
                size: screenSize.width * 0.08, // 8% of screen width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
