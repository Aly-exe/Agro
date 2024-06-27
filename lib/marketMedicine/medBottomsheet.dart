import 'package:agro/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MedicineBottomSheet extends StatefulWidget {
  @override
  _MedicineBottomSheetState createState() => _MedicineBottomSheetState();
}

class _MedicineBottomSheetState extends State<MedicineBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> field1Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field2Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field3Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field4Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> field5Key = GlobalKey<FormFieldState<String>>();

  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();
  final TextEditingController field5Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SizedBox(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          screenSize.width * 0.03, // 3% of screen width
          screenSize.height * 0.07, // 7% of screen height
          screenSize.width * 0.03, // 3% of screen width
          screenSize.height * 0.01, // 1% of screen height
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
              SizedBox(height: screenSize.height * 0.01), // 1% of screen height
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
              SizedBox(height: screenSize.height * 0.01), // 1% of screen height
              TextFormField(
                key: field5Key,
                controller: field5Controller,
                decoration: InputDecoration(
                  labelText: S.of(context).ProductName,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).medicineplease;
                  }
                  return null;
                },
              ),
              SizedBox(height: screenSize.height * 0.01), // 1% of screen height
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
              SizedBox(height: screenSize.height * 0.01), // 1% of screen height
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
              SizedBox(height: screenSize.height * 0.015), // 1.5% of screen height
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit data to Firestore
                    FirebaseFirestore.instance.collection('medicine_Item').add({
                      'name': field1Controller.text,
                      'phone': field2Controller.text,
                      'price': field3Controller.text,
                      'productName': field5Controller.text,
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
