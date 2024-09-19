// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> eliminarDocumentos() async {
  final instance = FirebaseFirestore.instance;
  final batch = instance.batch();
  var collection = instance.collection('evafitosanitaria');
  var snapshots = await collection.get();
  for (var doc in snapshots.docs) {
    batch.delete(doc.reference);
  }
  await batch.commit();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
