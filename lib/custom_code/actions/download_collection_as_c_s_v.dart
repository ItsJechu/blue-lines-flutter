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

import 'dart:io';
import 'dart:convert' show utf8;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:download/download.dart';

// Define la función para obtener el ID de usuario de la referencia
String? getUserIdFromReference(DocumentReference<Object?>? reference) {
  if (reference == null) {
    return null; // Devuelve null si la referencia es nula
  }
  return reference.id; // Devuelve el ID del usuario como una cadena
}

Future<List<EvafitosanitariaRecord>> downloadCollectionAsCSV(
  List<EvafitosanitariaRecord>? docs,
  String evausuario,
) async {
  docs = docs ?? [];

  // Filtrar los registros según el usuario actual
  docs = docs.where((record) {
    String? userId = getUserIdFromReference(record.evaUsuario);
    return userId == evausuario;
  }).toList();

  // Add the company name and address as a header
  docs.sort((a, b) => a.creationTime!.compareTo(b.creationTime!));

  String companyName = "Lista de Registro Fitosanitaria";
  String header = "$companyName,\n";

  String fileContent = header +
      "Fecha, Variedad, Lote , Grupo, Valvula , Num_Planta , Num_Individuos , Plaga-Enfermedad\n";

  docs.asMap().forEach((index, record) => fileContent = fileContent +
      "" +
      DateFormat('dd/MM/yyyy').format(record.creationTime ?? DateTime.now()) +
      "," +
      record.tipoVariedad.toString() +
      "," +
      record.lote.toString() +
      "," +
      record.valvula.toString() +
      "," +
      record.plagEtapa.toString() +
      "," +
      record.nroPlanta.toString() +
      "," +
      record.grado.toString() +
      "," +
      record.enfermedadplaga.toString());

  final fileName = "FF" + DateTime.now().toString() + ".csv";

  Directory? appDir;

  // Encode the string as a List<int> of UTF-8 bytes
  List<int> bytes = utf8.encode(fileContent);

  Stream<int> stream = Stream.fromIterable(bytes);

  if (kIsWeb) {
    await download(stream, fileName);
    //return [
    //  {'fileName': Asistencia},
    //  {'filePath': Download}
    //];
  } else if (Platform.isAndroid) {
    appDir = await getExternalStorageDirectory();
  } else if (Platform.isIOS) {
    appDir = await getApplicationDocumentsDirectory();
  } else {
    appDir = await getDownloadsDirectory();
  }
  String pathName = appDir?.path ?? "";
  String destinationPath = await getDestinationPathName(fileName, pathName,
      isBackwardSlash: Platform.isWindows);
  await download(stream, destinationPath);

  return [];
}

Future<String> getDestinationPathName(String fileName, String pathName,
    {bool isBackwardSlash = true}) async {
  String destinationPath =
      pathName + "${isBackwardSlash ? "\\" : "/"}${fileName}";
  int i = 1;
  bool _isFileExists = await File(destinationPath).exists();
  while (_isFileExists) {
    _isFileExists =
        await File(pathName + "${isBackwardSlash ? "\\" : "/"}($i)${fileName}")
            .exists();
    if (_isFileExists == false) {
      destinationPath =
          pathName + "${isBackwardSlash ? "\\" : "/"}($i)${fileName}";
      break;
    }
    i++;
  }
  return destinationPath;
}
