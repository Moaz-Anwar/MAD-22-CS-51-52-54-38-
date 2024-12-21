import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadMedicinesToFirestore() async {
  final firestore = FirebaseFirestore.instance;

  // Load JSON file from assets
  final String response = await rootBundle.loadString('assets/updated_medicines_with_updated_companies.json');
  final List<dynamic> medicines = jsonDecode(response);

  // Upload to Firestore
  for (var medicine in medicines) {
    await firestore.collection('medicines').add(medicine);
  }
}


