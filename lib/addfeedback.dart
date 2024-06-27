import 'package:agro/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _rating = 4;
  final TextEditingController _feedbackController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String currentUserName = '';
  String imagelink = '';

  @override
  void initState() {
    super.initState();
    fetchCurrentUserDetails();
  }

  Future<void> fetchCurrentUserDetails() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        currentUserName = userDoc['firstname'] ?? 'Unknown'; // Replace 'Unknown' with a suitable default value
        imagelink = userDoc['image'] ?? 'Unknown'; // Replace 'Unknown' with a suitable default value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth * 0.05; // 5% of screen width
    double fontSize = screenWidth * 0.05; // 5% of screen width
    double verticalSpacing = screenHeight * 0.02; // 2% of screen height

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).givefeedback),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight - (screenHeight * 0.17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).feedbackquestion,
                    style: TextStyle(fontSize: fontSize),
                  ),
                  SizedBox(height: verticalSpacing),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: index < _rating ? Colors.amber : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    S.of(context).feedbackcare,
                    style: TextStyle(fontSize: fontSize),
                  ),
                  SizedBox(height: verticalSpacing),
                  TextFormField(
                    controller: _feedbackController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: S.of(context).yourfeedback,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).feedbackwarning;
                      }
                      return null;
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _submitFeedback();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: verticalSpacing),
                      textStyle: TextStyle(fontSize: fontSize * 0.8),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).publishfeedback,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    S.of(context).feedbacksuccessmessage,
                    style: TextStyle(fontSize: fontSize * 0.6, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitFeedback() async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'rating': _rating,
      'review': _feedbackController.text,
      'name': currentUserName,
      'image': imagelink,
    });
    _feedbackController.clear(); // Clear the text field
    _showThankYouDialog(context);
  }

  void _showThankYouDialog(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.05; // 5% of screen width
    double imageHeight = screenWidth * 0.5; // 50% of screen width

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding: EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/image.png',
                height: imageHeight,
              ),
              SizedBox(height: 20),
              Text(
                S.of(context).thanks,
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                S.of(context).feedbacksuccessmessage2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize * 0.8),
              ),
            ],
          ),
        );
      },
    );
  }
}
