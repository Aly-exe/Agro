import 'package:flutter/cupertino.dart';

Widget drawerElement(
    {required var width,
    required var height,
    required IconData icon,
    required String drawerElementname,
    void Function()? onTap}) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: width * .6,
        height: height * .075,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10,
            ),
            Text(drawerElementname),
          ],
        ),
      ),
    ),
    onTap: onTap,
  );
}
