import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umla_project/controller/showNetworkDialog.dart';

Future<void> addMedicine(String name, int quantity) async {
  CollectionReference medicines = FirebaseFirestore.instance.collection('medicines');
  await medicines.add({
    'name': name,
    'quantity': quantity,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

class AddMedicineDetails extends StatefulWidget {
  const AddMedicineDetails({super.key});

  @override
  State<AddMedicineDetails> createState() => _AddMedicineDetails();
}

class _AddMedicineDetails extends State<AddMedicineDetails> {
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController medicineQuantityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: medicineNameController,
                decoration: InputDecoration(
                  hintText: 'Medicine Name',
                  label: const Text('Enter Medicine Name'),
                  prefixIcon: const Icon(Icons.medication_liquid, color: Colors.blue),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a medicine name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: medicineQuantityController,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  label: const Text('Enter Quantity'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                height: 30,
                width: 200,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isConnected = await checkNetworkAvailability(context);
                      if (isConnected) {
                        await addMedicine(
                          medicineNameController.text,
                          int.parse(medicineQuantityController.text),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added successfully")),
                        );
                        // Clear the text fields after successful addition
                        medicineNameController.clear();
                        medicineQuantityController.clear();
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error while adding medicine")),
                      );
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
