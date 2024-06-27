import 'package:agro/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'reusablecomponent/item_feed.dart'; // Import the feedback item widget

class FeedbackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Feedbacks),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text(S.of(context).Nofeedback));
          }

          final feedbackDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: feedbackDocs.length,
            itemBuilder: (context, index) {
              var feedback = feedbackDocs[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.05,
                ),
                child: FeedbackItem(
                  name: feedback['name'],
                  rating: feedback['rating'],
                  review: feedback['review'],
                  image: feedback['image'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
