import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "appointmentDescription" field.
  String? _appointmentDescription;
  String get appointmentDescription => _appointmentDescription ?? '';
  bool hasAppointmentDescription() => _appointmentDescription != null;

  // "appointmentPerson" field.
  DocumentReference? _appointmentPerson;
  DocumentReference? get appointmentPerson => _appointmentPerson;
  bool hasAppointmentPerson() => _appointmentPerson != null;

  // "appointmentTime" field.
  DateTime? _appointmentTime;
  DateTime? get appointmentTime => _appointmentTime;
  bool hasAppointmentTime() => _appointmentTime != null;

  // "appointmentType" field.
  String? _appointmentType;
  String get appointmentType => _appointmentType ?? '';
  bool hasAppointmentType() => _appointmentType != null;

  // "appointmentEmail" field.
  String? _appointmentEmail;
  String get appointmentEmail => _appointmentEmail ?? '';
  bool hasAppointmentEmail() => _appointmentEmail != null;

  // "appointmentJabas" field.
  double? _appointmentJabas;
  double get appointmentJabas => _appointmentJabas ?? 0.0;
  bool hasAppointmentJabas() => _appointmentJabas != null;

  // "appointmentPromjab" field.
  double? _appointmentPromjab;
  double get appointmentPromjab => _appointmentPromjab ?? 0.0;
  bool hasAppointmentPromjab() => _appointmentPromjab != null;

  // "appointmentKilos" field.
  double? _appointmentKilos;
  double get appointmentKilos => _appointmentKilos ?? 0.0;
  bool hasAppointmentKilos() => _appointmentKilos != null;

  // "appointmentHoras" field.
  double? _appointmentHoras;
  double get appointmentHoras => _appointmentHoras ?? 0.0;
  bool hasAppointmentHoras() => _appointmentHoras != null;

  // "appointmentName" field.
  String? _appointmentName;
  String get appointmentName => _appointmentName ?? '';
  bool hasAppointmentName() => _appointmentName != null;

  // "appointmentJabero" field.
  String? _appointmentJabero;
  String get appointmentJabero => _appointmentJabero ?? '';
  bool hasAppointmentJabero() => _appointmentJabero != null;

  void _initializeFields() {
    _appointmentDescription = snapshotData['appointmentDescription'] as String?;
    _appointmentPerson =
        snapshotData['appointmentPerson'] as DocumentReference?;
    _appointmentTime = snapshotData['appointmentTime'] as DateTime?;
    _appointmentType = snapshotData['appointmentType'] as String?;
    _appointmentEmail = snapshotData['appointmentEmail'] as String?;
    _appointmentJabas = castToType<double>(snapshotData['appointmentJabas']);
    _appointmentPromjab =
        castToType<double>(snapshotData['appointmentPromjab']);
    _appointmentKilos = castToType<double>(snapshotData['appointmentKilos']);
    _appointmentHoras = castToType<double>(snapshotData['appointmentHoras']);
    _appointmentName = snapshotData['appointmentName'] as String?;
    _appointmentJabero = snapshotData['appointmentJabero'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  String? appointmentDescription,
  DocumentReference? appointmentPerson,
  DateTime? appointmentTime,
  String? appointmentType,
  String? appointmentEmail,
  double? appointmentJabas,
  double? appointmentPromjab,
  double? appointmentKilos,
  double? appointmentHoras,
  String? appointmentName,
  String? appointmentJabero,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'appointmentDescription': appointmentDescription,
      'appointmentPerson': appointmentPerson,
      'appointmentTime': appointmentTime,
      'appointmentType': appointmentType,
      'appointmentEmail': appointmentEmail,
      'appointmentJabas': appointmentJabas,
      'appointmentPromjab': appointmentPromjab,
      'appointmentKilos': appointmentKilos,
      'appointmentHoras': appointmentHoras,
      'appointmentName': appointmentName,
      'appointmentJabero': appointmentJabero,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.appointmentDescription == e2?.appointmentDescription &&
        e1?.appointmentPerson == e2?.appointmentPerson &&
        e1?.appointmentTime == e2?.appointmentTime &&
        e1?.appointmentType == e2?.appointmentType &&
        e1?.appointmentEmail == e2?.appointmentEmail &&
        e1?.appointmentJabas == e2?.appointmentJabas &&
        e1?.appointmentPromjab == e2?.appointmentPromjab &&
        e1?.appointmentKilos == e2?.appointmentKilos &&
        e1?.appointmentHoras == e2?.appointmentHoras &&
        e1?.appointmentName == e2?.appointmentName &&
        e1?.appointmentJabero == e2?.appointmentJabero;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.appointmentDescription,
        e?.appointmentPerson,
        e?.appointmentTime,
        e?.appointmentType,
        e?.appointmentEmail,
        e?.appointmentJabas,
        e?.appointmentPromjab,
        e?.appointmentKilos,
        e?.appointmentHoras,
        e?.appointmentName,
        e?.appointmentJabero
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
