import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETALLREGISTROS
Future<List<GetallregistrosRow>> performGetallregistros(
  Database database,
) {
  const query = '''
Select * from registro_fitosanitaria
''';
  return _readQuery(database, query, (d) => GetallregistrosRow(d));
}

class GetallregistrosRow extends SqliteRow {
  GetallregistrosRow(super.data);

  String get tipoVariedad => data['tipo_variedad'] as String;
  String get lote => data['lote'] as String;
  String get valvula => data['valvula'] as String;
  int get id => data['id'] as int;
  String get plagEtapa => data['plag_etapa'] as String;
  String get enfermedadPlaga => data['enfermedad_plaga'] as String;
  double get grado => data['grado'] as double;
  double get nroPlanta => data['nro_planta'] as double;
}

/// END GETALLREGISTROS

/// BEGIN FECHAFORMATEADA
Future<List<FechaformateadaRow>> performFechaformateada(
  Database database,
) {
  const query = '''
SELECT strftime('%d-%m-%Y ', fecha_registro) AS fecha_formateada FROM registro_fitosanitaria; 
''';
  return _readQuery(database, query, (d) => FechaformateadaRow(d));
}

class FechaformateadaRow extends SqliteRow {
  FechaformateadaRow(super.data);
}

/// END FECHAFORMATEADA

/// BEGIN GET ALL ACTIVIDADES
Future<List<GetAllActividadesRow>> performGetAllActividades(
  Database database,
) {
  const query = '''
SELECT * FROM Actividades;
''';
  return _readQuery(database, query, (d) => GetAllActividadesRow(d));
}

class GetAllActividadesRow extends SqliteRow {
  GetAllActividadesRow(super.data);

  String? get nombre => data['nombre'] as String?;
}

/// END GET ALL ACTIVIDADES

/// BEGIN LABORES
Future<List<LaboresRow>> performLabores(
  Database database,
) {
  const query = '''
SELECT * FROM Labores;
''';
  return _readQuery(database, query, (d) => LaboresRow(d));
}

class LaboresRow extends SqliteRow {
  LaboresRow(super.data);

  String? get nombre => data['nombre'] as String?;
}

/// END LABORES

/// BEGIN CENTROS DE COSTO
Future<List<CentrosDeCostoRow>> performCentrosDeCosto(
  Database database,
) {
  const query = '''
SELECT * FROM Centros_de_Costo;
''';
  return _readQuery(database, query, (d) => CentrosDeCostoRow(d));
}

class CentrosDeCostoRow extends SqliteRow {
  CentrosDeCostoRow(super.data);

  String? get nombre => data['nombre'] as String?;
}

/// END CENTROS DE COSTO

/// BEGIN PROYECTOS
Future<List<ProyectosRow>> performProyectos(
  Database database,
) {
  const query = '''
SELECT * FROM Proyectos;
''';
  return _readQuery(database, query, (d) => ProyectosRow(d));
}

class ProyectosRow extends SqliteRow {
  ProyectosRow(super.data);

  String? get nombre => data['nombre'] as String?;
}

/// END PROYECTOS

/// BEGIN GRUPOS
Future<List<GruposRow>> performGrupos(
  Database database,
) {
  const query = '''
SELECT * FROM Grupos;
''';
  return _readQuery(database, query, (d) => GruposRow(d));
}

class GruposRow extends SqliteRow {
  GruposRow(super.data);

  String? get nombre => data['nombre'] as String?;
}

/// END GRUPOS

/// BEGIN PERSONAL
Future<List<PersonalRow>> performPersonal(
  Database database,
) {
  const query = '''
SELECT * FROM Personal;
''';
  return _readQuery(database, query, (d) => PersonalRow(d));
}

class PersonalRow extends SqliteRow {
  PersonalRow(super.data);

  String? get nombre => data['nombre'] as String?;
}

/// END PERSONAL

/// BEGIN GET ALL TAREOS
Future<List<GetAllTareosRow>> performGetAllTareos(
  Database database,
) {
  const query = '''
SELECT 
    Tareo_Grupo.id_tareo, 
    Tareo_Grupo.fecha_tareo, 
    Actividades.nombre AS nombre_actividad, 
    Labores.nombre AS nombre_labor, 
    Centros_de_Costo.nombre AS nombre_centro, 
    Proyectos.nombre AS nombre_proyecto, 
    Tareo_Grupo.es_tarea, 
    Grupos.nombre AS nombre_grupo, 
    Personal.nombre AS nombre_personal, 
    Tareo_Grupo.inicio
FROM 
    Tareo_Grupo
LEFT JOIN 
    Actividades ON Tareo_Grupo.id_actividad = Actividades.id_actividad
LEFT JOIN 
    Labores ON Tareo_Grupo.id_labor = Labores.id_labor
LEFT JOIN 
    Centros_de_Costo ON Tareo_Grupo.id_centro = Centros_de_Costo.id_centro
LEFT JOIN 
    Proyectos ON Tareo_Grupo.id_proyecto = Proyectos.id_proyecto
LEFT JOIN 
    Grupos ON Tareo_Grupo.id_grupo = Grupos.id_grupo
LEFT JOIN 
    Personal ON Tareo_Grupo.id_personal = Personal.id_personal;
''';
  return _readQuery(database, query, (d) => GetAllTareosRow(d));
}

class GetAllTareosRow extends SqliteRow {
  GetAllTareosRow(super.data);

  String? get nombreActividad => data['nombre_actividad'] as String?;
  String? get nombreLabor => data['nombre_labor'] as String?;
  String? get nombreCentro => data['nombre_centro'] as String?;
  String? get nombreProyecto => data['nombre_proyecto'] as String?;
  String? get nombreGrupo => data['nombre_grupo'] as String?;
  String? get nombrePersonal => data['nombre_personal'] as String?;
  String? get fechaTareo => data['fecha_tareo'] as String?;
  String? get inicio => data['inicio'] as String?;
}

/// END GET ALL TAREOS
