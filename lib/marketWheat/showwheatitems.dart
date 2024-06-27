import 'package:agro/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import 'marketitem.dart';
import 'wheatmarketitemModel.dart'; // Assuming MarketItem is defined in market.dart

class ShowWheatItems extends StatelessWidget {
  final CollectionReference wheat_Item =
  FirebaseFirestore.instance.collection('wheat_Item');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: wheat_Item.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<WheatItem> wheatItemsList = [];
          snapshot.data!.docs.forEach((doc) {
            wheatItemsList.add(WheatItem.fromJson(doc.data() as Map<String, dynamic>));
          });
          return Scaffold(
            backgroundColor: Colors.grey,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.teal[500],
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return MyBottomSheet();
                  },
                );
              },
              child: Icon(Icons.add,
              color:Colors.white ,),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: wheatItemsList.length,
                    itemBuilder: (context, index) {
                      return MarketItem(wheatItem: wheatItemsList[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}



class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> field1Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field2Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field3Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field4Key = GlobalKey<FormFieldState<String>>();

  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          screenSize.width * 0.03,
          screenSize.height * 0.1,
          screenSize.width * 0.03,
          screenSize.height * 0.01,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                key: field1Key,
                controller: field1Controller,
                decoration: InputDecoration(
                  labelText: S.of(context).Name,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).nameplease;
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height * 0.01),
              TextFormField(
                key: field2Key,
                controller: field2Controller,
                decoration: InputDecoration(
                  labelText: S.of(context).mobile,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).mobileplease;
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height * 0.01),
              TextFormField(
                key: field3Key,
                controller: field3Controller,
                decoration: InputDecoration(
                  labelText: S.of(context).Price,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).priceplease;
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height * 0.01),
              TextFormField(
                key: field4Key,
                controller: field4Controller,
                decoration: InputDecoration(
                  labelText: S.of(context).available,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).weightplease;
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height * 0.01),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit data to Firestore
                    FirebaseFirestore.instance.collection('wheat_Item').add({
                      'name': field1Controller.text,
                      'phone': field2Controller.text,
                      'price': field3Controller.text,
                      'quantity': field4Controller.text,
                    });

                    Navigator.pop(context); // Close the bottom sheet
                  }
                },
                child: Text(S.of(context).add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
