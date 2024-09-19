import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'evafitosanitaria',
      'evafitosanitaria.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetallregistrosRow>> getallregistros() => performGetallregistros(
        _database,
      );

  Future<List<FechaformateadaRow>> fechaformateada() => performFechaformateada(
        _database,
      );

  Future<List<GetAllActividadesRow>> getAllActividades() =>
      performGetAllActividades(
        _database,
      );

  Future<List<LaboresRow>> labores() => performLabores(
        _database,
      );

  Future<List<CentrosDeCostoRow>> centrosDeCosto() => performCentrosDeCosto(
        _database,
      );

  Future<List<ProyectosRow>> proyectos() => performProyectos(
        _database,
      );

  Future<List<GruposRow>> grupos() => performGrupos(
        _database,
      );

  Future<List<PersonalRow>> personal() => performPersonal(
        _database,
      );

  Future<List<GetAllTareosRow>> getAllTareos() => performGetAllTareos(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future agregarRegistro({
    String? tipovariedad,
    String? lote,
    String? valvula,
    String? plagetapa,
    String? grado,
    String? nroplanta,
    String? enfermedad,
  }) =>
      performAgregarRegistro(
        _database,
        tipovariedad: tipovariedad,
        lote: lote,
        valvula: valvula,
        plagetapa: plagetapa,
        grado: grado,
        nroplanta: nroplanta,
        enfermedad: enfermedad,
      );

  Future eliminarregistro() => performEliminarregistro(
        _database,
      );

  Future agregarregistrodrenaje({
    String? linea,
    String? valvula,
    String? sfrvalvu,
    String? lixiviadovalvu,
    String? sfrph,
    String? lixiadoph,
    String? drenaje,
    String? estaca,
    String? tiempo,
  }) =>
      performAgregarregistrodrenaje(
        _database,
        linea: linea,
        valvula: valvula,
        sfrvalvu: sfrvalvu,
        lixiviadovalvu: lixiviadovalvu,
        sfrph: sfrph,
        lixiadoph: lixiadoph,
        drenaje: drenaje,
        estaca: estaca,
        tiempo: tiempo,
      );

  Future eliminardrenaje() => performEliminardrenaje(
        _database,
      );

  Future agregarregistrofenologia({
    String? tipovariedadf,
    String? lotef,
    String? valvulaf,
    String? plagetapaf,
    String? cantidadf,
    String? nroplantaf,
    String? fenologiaf,
  }) =>
      performAgregarregistrofenologia(
        _database,
        tipovariedadf: tipovariedadf,
        lotef: lotef,
        valvulaf: valvulaf,
        plagetapaf: plagetapaf,
        cantidadf: cantidadf,
        nroplantaf: nroplantaf,
        fenologiaf: fenologiaf,
      );

  Future eliminarfenologia() => performEliminarfenologia(
        _database,
      );

  Future agregarTareo({
    String? fechatareo,
    String? idactividad,
    String? idlabor,
    String? idcentro,
    String? idproyecto,
    String? estarea,
    String? idgrupo,
    String? idpersonal,
    String? inicio,
  }) =>
      performAgregarTareo(
        _database,
        fechatareo: fechatareo,
        idactividad: idactividad,
        idlabor: idlabor,
        idcentro: idcentro,
        idproyecto: idproyecto,
        estarea: estarea,
        idgrupo: idgrupo,
        idpersonal: idpersonal,
        inicio: inicio,
      );

  /// END UPDATE QUERY CALLS
}
