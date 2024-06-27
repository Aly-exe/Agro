import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'medicineitem.dart';
import 'medicineitemModel.dart';
import 'medBottomsheet.dart';

class ShowMedItems extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference medicineItem =
  FirebaseFirestore.instance.collection('medicine_Item');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: medicineItem.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Medicine> medicineItemsList = [];
        snapshot.data!.docs.forEach((doc) {
          medicineItemsList.add(
            Medicine.fromJson(doc.data() as Map<String, dynamic>),
          );
        });

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal[500],
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return MedicineBottomSheet();
                },
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey,
          body: ListView.builder(
            itemCount: medicineItemsList.length,
            itemBuilder: (context, index) {
              return MedicineItem(
                medicine: medicineItemsList[index],
              );
            },
          ),
        );
      },
    );
  }
}
