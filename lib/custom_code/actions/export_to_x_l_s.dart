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

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:excel/excel.dart';
import 'dart:io';

Future<void> exportToXLS() async {
  // Obtener la ruta del directorio de documentos
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = '${documentsDirectory.path}/data.xls';

  // Abrir la base de datos
  Database database = await openDatabase('evafitosanitaria');

  // Obtener los registros de la base de datos
  List<Map> records =
      await database.rawQuery('SELECT * FROM registro_fitosanitaria');

  // Crear un libro de Excel
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  // Escribir los registros en el libro de Excel
  for (int i = 0; i < records.length; i++) {
    var record = records[i];
    // Suponiendo que tienes campos 'campo1' y 'campo2'
    sheet
        .appendRow([record['tipovariedad'], record['lote'], record['valvula']]);
  }

  // Guardar el archivo Excel
  List<int>? xlsBytes = excel.encode();
  if (xlsBytes != null) {
    File(path).writeAsBytesSync(xlsBytes);
    print('Archivo XLS exportado en: $path');
  } else {
    print('Error al codificar el archivo Excel.');
  }
}
