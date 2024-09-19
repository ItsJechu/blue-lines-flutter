import 'package:sqflite/sqflite.dart';

/// BEGIN AGREGAR REGISTRO
Future performAgregarRegistro(
  Database database, {
  String? tipovariedad,
  String? lote,
  String? valvula,
  String? plagetapa,
  String? grado,
  String? nroplanta,
  String? enfermedad,
}) {
  final query = '''
INSERT INTO registro_fitosanitaria(tipo_variedad, lote, valvula, plag_etapa, grado, nro_planta, enfermedad_plaga) VALUES ('$tipovariedad', '$lote', '$valvula', ' $plagetapa', '$grado', '$nroplanta','$enfermedad');
''';
  return database.rawQuery(query);
}

/// END AGREGAR REGISTRO

/// BEGIN ELIMINARREGISTRO
Future performEliminarregistro(
  Database database,
) {
  const query = '''
DELETE FROM registro_fitosanitaria;
''';
  return database.rawQuery(query);
}

/// END ELIMINARREGISTRO

/// BEGIN AGREGARREGISTRODRENAJE
Future performAgregarregistrodrenaje(
  Database database, {
  String? linea,
  String? valvula,
  String? sfrvalvu,
  String? lixiviadovalvu,
  String? sfrph,
  String? lixiadoph,
  String? drenaje,
  String? estaca,
  String? tiempo,
}) {
  final query = '''
INSERT INTO drenaje_manchaverde(linea,valvula,sfrvalvu,lixiviadovalvu,sfrph,lixiviadoph,drenaje,estaca,tiempo) VALUES ('$linea', '$valvula', '$sfrvalvu', '$lixiviadovalvu', '$sfrph', '$lixiadoph', '$drenaje', '$estaca', '$tiempo');
''';
  return database.rawQuery(query);
}

/// END AGREGARREGISTRODRENAJE

/// BEGIN ELIMINARDRENAJE
Future performEliminardrenaje(
  Database database,
) {
  const query = '''
DELETE FROM drenaje_manchaverde;
''';
  return database.rawQuery(query);
}

/// END ELIMINARDRENAJE

/// BEGIN AGREGARREGISTROFENOLOGIA
Future performAgregarregistrofenologia(
  Database database, {
  String? tipovariedadf,
  String? lotef,
  String? valvulaf,
  String? plagetapaf,
  String? cantidadf,
  String? nroplantaf,
  String? fenologiaf,
}) {
  final query = '''
INSERT INTO registro_fenologia(tipo_variedadf, lotef, valvulaf, plag_etapaf, cantidadf, nro_plantaf, fenologiaf) VALUES ('$tipovariedadf', '$lotef', '$valvulaf', ' $plagetapaf', '$cantidadf', '$nroplantaf','$fenologiaf');
''';
  return database.rawQuery(query);
}

/// END AGREGARREGISTROFENOLOGIA

/// BEGIN ELIMINARFENOLOGIA
Future performEliminarfenologia(
  Database database,
) {
  const query = '''
DELETE FROM registro_fenologia;
''';
  return database.rawQuery(query);
}

/// END ELIMINARFENOLOGIA

/// BEGIN AGREGAR TAREO
Future performAgregarTareo(
  Database database, {
  String? fechatareo,
  String? idactividad,
  String? idlabor,
  String? idcentro,
  String? idproyecto,
  String? estarea,
  String? idgrupo,
  String? idpersonal,
  String? inicio,
}) {
  final query = '''
INSERT INTO Tareo_Grupo (fecha_tareo, id_actividad, id_labor, id_centro, id_proyecto, es_tarea, id_grupo, id_personal, inicio) VALUES ('$fechatareo', '$idactividad', '$idlabor', ' $idcentro', '$idproyecto', '$estarea','$idgrupo','$idpersonal','$inicio');
''';
  return database.rawQuery(query);
}

/// END AGREGAR TAREO
