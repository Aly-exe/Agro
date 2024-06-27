import 'package:flutter/material.dart';

class FeedbackItem extends StatelessWidget {
  final String name;
  final int rating;
  final String review;
  final String image;

  FeedbackItem(
      {required this.name,
      required this.rating,
      required this.review,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;


    return Card(
      child: Padding(
        padding: EdgeInsets.all(screenWidth*.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth*.07,
                  backgroundImage:
                      NetworkImage(image), // Replace with actual image URL
                ),
                SizedBox(width: screenWidth*.04,),
                Container(
                  width: screenWidth * 0.3, // Adjust width based on screen size
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
                Spacer(),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: index < rating ? Colors.amber : Colors.grey,
                      size: screenWidth*.07,
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: screenWidth*.04),
            Center(
              child: Container(
                width: screenWidth * 0.8, // Adjust width based on screen size
                child: Text(
                  review,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  textAlign: TextAlign.center, // Center text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
