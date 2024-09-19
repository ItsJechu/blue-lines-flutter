import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AsistenciaRecord extends FirestoreRecord {
  AsistenciaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "checkin" field.
  DateTime? _checkin;
  DateTime? get checkin => _checkin;
  bool hasCheckin() => _checkin != null;

  // "checkout" field.
  DateTime? _checkout;
  DateTime? get checkout => _checkout;
  bool hasCheckout() => _checkout != null;

  // "cosechadores" field.
  String? _cosechadores;
  String get cosechadores => _cosechadores ?? '';
  bool hasCosechadores() => _cosechadores != null;

  // "asistenciapersona" field.
  DocumentReference? _asistenciapersona;
  DocumentReference? get asistenciapersona => _asistenciapersona;
  bool hasAsistenciapersona() => _asistenciapersona != null;

  // "creationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "fundo" field.
  String? _fundo;
  String get fundo => _fundo ?? '';
  bool hasFundo() => _fundo != null;

  // "dnicosechador" field.
  String? _dnicosechador;
  String get dnicosechador => _dnicosechador ?? '';
  bool hasDnicosechador() => _dnicosechador != null;

  void _initializeFields() {
    _checkin = snapshotData['checkin'] as DateTime?;
    _checkout = snapshotData['checkout'] as DateTime?;
    _cosechadores = snapshotData['cosechadores'] as String?;
    _asistenciapersona =
        snapshotData['asistenciapersona'] as DocumentReference?;
    _creationTime = snapshotData['creationTime'] as DateTime?;
    _fundo = snapshotData['fundo'] as String?;
    _dnicosechador = snapshotData['dnicosechador'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('asistencia');

  static Stream<AsistenciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AsistenciaRecord.fromSnapshot(s));

  static Future<AsistenciaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AsistenciaRecord.fromSnapshot(s));

  static AsistenciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AsistenciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AsistenciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AsistenciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AsistenciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AsistenciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAsistenciaRecordData({
  DateTime? checkin,
  DateTime? checkout,
  String? cosechadores,
  DocumentReference? asistenciapersona,
  DateTime? creationTime,
  String? fundo,
  String? dnicosechador,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checkin': checkin,
      'checkout': checkout,
      'cosechadores': cosechadores,
      'asistenciapersona': asistenciapersona,
      'creationTime': creationTime,
      'fundo': fundo,
      'dnicosechador': dnicosechador,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciaRecordDocumentEquality implements Equality<AsistenciaRecord> {
  const AsistenciaRecordDocumentEquality();

  @override
  bool equals(AsistenciaRecord? e1, AsistenciaRecord? e2) {
    return e1?.checkin == e2?.checkin &&
        e1?.checkout == e2?.checkout &&
        e1?.cosechadores == e2?.cosechadores &&
        e1?.asistenciapersona == e2?.asistenciapersona &&
        e1?.creationTime == e2?.creationTime &&
        e1?.fundo == e2?.fundo &&
        e1?.dnicosechador == e2?.dnicosechador;
  }

  @override
  int hash(AsistenciaRecord? e) => const ListEquality().hash([
        e?.checkin,
        e?.checkout,
        e?.cosechadores,
        e?.asistenciapersona,
        e?.creationTime,
        e?.fundo,
        e?.dnicosechador
      ]);

  @override
  bool isValidKey(Object? o) => o is AsistenciaRecord;
}
