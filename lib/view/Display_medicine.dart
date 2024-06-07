import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umla_project/model/Display_medicine_Model.dart';

class MedicineDisplayScreen extends StatelessWidget {
  const MedicineDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine List')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('medicines').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<Medicine> medicines = snapshot.data!.docs
              .map((DocumentSnapshot document) => Medicine.fromFirestore(document))
              .toList();

          return ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              Medicine medicine = medicines[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(medicine.name),
                    trailing: Text('Quantity: ${medicine.quantity.toStringAsFixed(2)}'),
                    tileColor: Color.fromARGB(255, 244, 214, 235),
                    horizontalTitleGap: 3,
                  ),
                  const SizedBox(height: 16.0), // Add vertical space
                ],
              );
            },
          );
        },
      ),
    );
  }
}
