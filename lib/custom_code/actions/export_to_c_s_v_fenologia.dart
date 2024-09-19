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

import 'package:path_provider/path_provider.dart';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

int exportCounter = 0;

Future<void> exportToCSVFenologia() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Obtener el valor actual de exportCounter o establecerlo en 0 si es nulo
    exportCounter = prefs.getInt('exportCounter') ?? 0;

    // Incrementar exportCounter
    exportCounter++;

    // Guardar el nuevo valor de exportCounter en SharedPreferences
    await prefs.setInt('exportCounter', exportCounter);

    // Obtener la ruta de la base de datos SQLite
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'evafitosanitaria.db');

    // Abrir la base de datos
    Database database = await openDatabase(path);

    // Consultar todos los registros de la tabla 'registro_fitosanitaria'
    List<Map> registros = await database.query('registro_fenologia');

    // Convertir los datos a formato CSV
    String csv = convertToCSV(registros);

    // Obtener la ruta del directorio de documentos
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String filePath =
        '${documentsDirectory.path}/registro_fenologia_$exportCounter.csv';

    // Escribir el archivo CSV
    File file = File(filePath);
    await file.writeAsString(csv);

    // Mover el archivo al directorio de descargas para que sea accesible para el usuario
    final String newFilePath =
        '/storage/emulated/0/Download/registro_fenologia_$exportCounter.csv';
    await file.copy(newFilePath);

    // Reabrir la base de datos para permitir agregar nuevos registros
    database = await openDatabase(path);

    // Notificar al usuario que la exportación se ha completado
    // Puedes utilizar un SnackBar o un diálogo para esto
  } catch (e) {
    print('Error al exportar el archivo CSV: $e');
  }
}

String convertToCSV(List<Map> registros) {
  // Encabezado CSV
  String csv =
      'Fecha,Variedad,Lote,Grupo,Valvula,Nro_Planta,Cantidad,Fenologia\n';

  // Convertir cada registro a una línea CSV
  for (var registro in registros) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.year}-${now.month}-${now.day}';

    // Eliminar el espacio en blanco antes de "Sector"
    String plagEtapa = registro['plag_etapaf'].trim();

    csv +=
        '$formattedDate,${registro['tipo_variedadf']},${registro['lotef']},${registro['valvulaf']},$plagEtapa,${registro['nro_plantaf']},${registro['cantidadf']},${registro['fenologiaf']}';
  }

  return csv;
}
