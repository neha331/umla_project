import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define a model class to represent medicine data
class Medicine {
  final String name;
 // final String description;
  final int quantity;

  Medicine({
    required this.name,
    //required this.description,
    required this.quantity,
  });

  // Factory method to create Medicine instance from Firestore document
  factory Medicine.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Medicine(
      name: data['name'],
    //  description: data['description'],
      quantity: data['quantity'],
    );
  }
}

