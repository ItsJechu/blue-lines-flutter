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

import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteDocumentsForCurrentUser() async {
  // Obtener la referencia del usuario actualmente autenticado
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Obtener la referencia del usuario
    DocumentReference userRef =
        FirebaseFirestore.instance.doc('users/${user.uid}');

    // Consulta para obtener los documentos asociados al usuario
    QuerySnapshot<Map<String, dynamic>> collection = await FirebaseFirestore
        .instance
        .collection("evafitosanitaria")
        .where("eva_usuario", isEqualTo: userRef)
        .get();

    // Crear un lote para eliminar los documentos
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Iterar sobre los documentos y agregarlos al lote para eliminarlos
    collection.docs.forEach((doc) {
      batch.delete(doc.reference);
    });

    // Ejecutar el lote para eliminar los documentos
    await batch.commit();
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
