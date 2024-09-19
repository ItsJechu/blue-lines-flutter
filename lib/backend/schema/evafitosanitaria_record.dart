import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EvafitosanitariaRecord extends FirestoreRecord {
  EvafitosanitariaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo_variedad" field.
  String? _tipoVariedad;
  String get tipoVariedad => _tipoVariedad ?? '';
  bool hasTipoVariedad() => _tipoVariedad != null;

  // "lote" field.
  String? _lote;
  String get lote => _lote ?? '';
  bool hasLote() => _lote != null;

  // "valvula" field.
  String? _valvula;
  String get valvula => _valvula ?? '';
  bool hasValvula() => _valvula != null;

  // "plag_etapa" field.
  String? _plagEtapa;
  String get plagEtapa => _plagEtapa ?? '';
  bool hasPlagEtapa() => _plagEtapa != null;

  // "grado" field.
  double? _grado;
  double get grado => _grado ?? 0.0;
  bool hasGrado() => _grado != null;

  // "nro_planta" field.
  int? _nroPlanta;
  int get nroPlanta => _nroPlanta ?? 0;
  bool hasNroPlanta() => _nroPlanta != null;

  // "nro_organos" field.
  int? _nroOrganos;
  int get nroOrganos => _nroOrganos ?? 0;
  bool hasNroOrganos() => _nroOrganos != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "enfermedadplaga" field.
  String? _enfermedadplaga;
  String get enfermedadplaga => _enfermedadplaga ?? '';
  bool hasEnfermedadplaga() => _enfermedadplaga != null;

  // "eva_usuario" field.
  DocumentReference? _evaUsuario;
  DocumentReference? get evaUsuario => _evaUsuario;
  bool hasEvaUsuario() => _evaUsuario != null;

  void _initializeFields() {
    _tipoVariedad = snapshotData['tipo_variedad'] as String?;
    _lote = snapshotData['lote'] as String?;
    _valvula = snapshotData['valvula'] as String?;
    _plagEtapa = snapshotData['plag_etapa'] as String?;
    _grado = castToType<double>(snapshotData['grado']);
    _nroPlanta = castToType<int>(snapshotData['nro_planta']);
    _nroOrganos = castToType<int>(snapshotData['nro_organos']);
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _enfermedadplaga = snapshotData['enfermedadplaga'] as String?;
    _evaUsuario = snapshotData['eva_usuario'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('evafitosanitaria');

  static Stream<EvafitosanitariaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EvafitosanitariaRecord.fromSnapshot(s));

  static Future<EvafitosanitariaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EvafitosanitariaRecord.fromSnapshot(s));

  static EvafitosanitariaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EvafitosanitariaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EvafitosanitariaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EvafitosanitariaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EvafitosanitariaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EvafitosanitariaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEvafitosanitariaRecordData({
  String? tipoVariedad,
  String? lote,
  String? valvula,
  String? plagEtapa,
  double? grado,
  int? nroPlanta,
  int? nroOrganos,
  DateTime? creationTime,
  String? enfermedadplaga,
  DocumentReference? evaUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo_variedad': tipoVariedad,
      'lote': lote,
      'valvula': valvula,
      'plag_etapa': plagEtapa,
      'grado': grado,
      'nro_planta': nroPlanta,
      'nro_organos': nroOrganos,
      'creationTime': creationTime,
      'enfermedadplaga': enfermedadplaga,
      'eva_usuario': evaUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class EvafitosanitariaRecordDocumentEquality
    implements Equality<EvafitosanitariaRecord> {
  const EvafitosanitariaRecordDocumentEquality();

  @override
  bool equals(EvafitosanitariaRecord? e1, EvafitosanitariaRecord? e2) {
    return e1?.tipoVariedad == e2?.tipoVariedad &&
        e1?.lote == e2?.lote &&
        e1?.valvula == e2?.valvula &&
        e1?.plagEtapa == e2?.plagEtapa &&
        e1?.grado == e2?.grado &&
        e1?.nroPlanta == e2?.nroPlanta &&
        e1?.nroOrganos == e2?.nroOrganos &&
        e1?.creationTime == e2?.creationTime &&
        e1?.enfermedadplaga == e2?.enfermedadplaga &&
        e1?.evaUsuario == e2?.evaUsuario;
  }

  @override
  int hash(EvafitosanitariaRecord? e) => const ListEquality().hash([
        e?.tipoVariedad,
        e?.lote,
        e?.valvula,
        e?.plagEtapa,
        e?.grado,
        e?.nroPlanta,
        e?.nroOrganos,
        e?.creationTime,
        e?.enfermedadplaga,
        e?.evaUsuario
      ]);

  @override
  bool isValidKey(Object? o) => o is EvafitosanitariaRecord;
}
