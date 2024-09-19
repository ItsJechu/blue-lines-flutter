import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RendimientoCosechaRecord extends FirestoreRecord {
  RendimientoCosechaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "appointmentTime" field.
  DateTime? _appointmentTime;
  DateTime? get appointmentTime => _appointmentTime;
  bool hasAppointmentTime() => _appointmentTime != null;

  // "appointmentJabas" field.
  double? _appointmentJabas;
  double get appointmentJabas => _appointmentJabas ?? 0.0;
  bool hasAppointmentJabas() => _appointmentJabas != null;

  // "appointmentName" field.
  String? _appointmentName;
  String get appointmentName => _appointmentName ?? '';
  bool hasAppointmentName() => _appointmentName != null;

  // "appointmentPerson" field.
  DocumentReference? _appointmentPerson;
  DocumentReference? get appointmentPerson => _appointmentPerson;
  bool hasAppointmentPerson() => _appointmentPerson != null;

  void _initializeFields() {
    _appointmentTime = snapshotData['appointmentTime'] as DateTime?;
    _appointmentJabas = castToType<double>(snapshotData['appointmentJabas']);
    _appointmentName = snapshotData['appointmentName'] as String?;
    _appointmentPerson =
        snapshotData['appointmentPerson'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rendimiento_cosecha');

  static Stream<RendimientoCosechaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RendimientoCosechaRecord.fromSnapshot(s));

  static Future<RendimientoCosechaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RendimientoCosechaRecord.fromSnapshot(s));

  static RendimientoCosechaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RendimientoCosechaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RendimientoCosechaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RendimientoCosechaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RendimientoCosechaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RendimientoCosechaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRendimientoCosechaRecordData({
  DateTime? appointmentTime,
  double? appointmentJabas,
  String? appointmentName,
  DocumentReference? appointmentPerson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'appointmentTime': appointmentTime,
      'appointmentJabas': appointmentJabas,
      'appointmentName': appointmentName,
      'appointmentPerson': appointmentPerson,
    }.withoutNulls,
  );

  return firestoreData;
}

class RendimientoCosechaRecordDocumentEquality
    implements Equality<RendimientoCosechaRecord> {
  const RendimientoCosechaRecordDocumentEquality();

  @override
  bool equals(RendimientoCosechaRecord? e1, RendimientoCosechaRecord? e2) {
    return e1?.appointmentTime == e2?.appointmentTime &&
        e1?.appointmentJabas == e2?.appointmentJabas &&
        e1?.appointmentName == e2?.appointmentName &&
        e1?.appointmentPerson == e2?.appointmentPerson;
  }

  @override
  int hash(RendimientoCosechaRecord? e) => const ListEquality().hash([
        e?.appointmentTime,
        e?.appointmentJabas,
        e?.appointmentName,
        e?.appointmentPerson
      ]);

  @override
  bool isValidKey(Object? o) => o is RendimientoCosechaRecord;
}
