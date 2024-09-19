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

Future<List<AsistenciaRecord>> downloadCollectionAsCSVCopyCopy(
  List<AsistenciaRecord>? docs,
  String asistenciapersona,
) async {
  docs = docs ?? [];

  // Agregar el nombre de la empresa como encabezado
  String companyName = "Lista de Asistencia";
  String header = "$companyName,\n";

  // Modificar el encabezado para agregar la columna 'DNI'
  String fileContent = header +
      "Fecha, Trabajador, DNI, Hora de Ingreso , Hora de Salida, Fundo\n";

  docs.asMap().forEach((index, record) {
    String checkoutTime = record.checkout != null
        ? DateFormat('HH:mm').format(record.checkout!)
        : '-.-'; // Mostrar -.- si el checkout es null

    // Incluir el campo 'dnicosechador' en la fila del archivo CSV
    String dniCosechador =
        record.dnicosechador ?? '-.-'; // Mostrar -.- si el DNI es null

    fileContent +=
        "${DateFormat('dd/MM/yyyy').format(record.creationTime ?? DateTime.now())}," +
            "${record.cosechadores.toString()}," + // Nombre del cosechador
            "$dniCosechador," + // DNI del cosechador
            "${DateFormat('HH:mm').format(record.checkin ?? DateTime.now())}," +
            "$checkoutTime," +
            "${record.fundo ?? ''}\n";
  });

  final fileName = "Asistencia_" + DateTime.now().toString() + ".csv";

  Directory? appDir;

  // Convertir el contenido a bytes UTF-8
  List<int> bytes = utf8.encode(fileContent);

  // Crear un stream con los bytes
  Stream<int> stream = Stream.fromIterable(bytes);

  if (kIsWeb) {
    await download(stream, fileName);
    //return [
    // {'fileName': fileName},
    //  {'filePath': fileName}
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
