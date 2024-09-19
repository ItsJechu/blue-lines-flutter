import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectorvalvuRecord extends FirestoreRecord {
  SectorvalvuRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sectorvalvuName" field.
  String? _sectorvalvuName;
  String get sectorvalvuName => _sectorvalvuName ?? '';
  bool hasSectorvalvuName() => _sectorvalvuName != null;

  // "grupoladoName" field.
  String? _grupoladoName;
  String get grupoladoName => _grupoladoName ?? '';
  bool hasGrupoladoName() => _grupoladoName != null;

  // "lotemodName" field.
  String? _lotemodName;
  String get lotemodName => _lotemodName ?? '';
  bool hasLotemodName() => _lotemodName != null;

  void _initializeFields() {
    _sectorvalvuName = snapshotData['sectorvalvuName'] as String?;
    _grupoladoName = snapshotData['grupoladoName'] as String?;
    _lotemodName = snapshotData['lotemodName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sectorvalvu');

  static Stream<SectorvalvuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SectorvalvuRecord.fromSnapshot(s));

  static Future<SectorvalvuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SectorvalvuRecord.fromSnapshot(s));

  static SectorvalvuRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SectorvalvuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SectorvalvuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SectorvalvuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SectorvalvuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SectorvalvuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSectorvalvuRecordData({
  String? sectorvalvuName,
  String? grupoladoName,
  String? lotemodName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sectorvalvuName': sectorvalvuName,
      'grupoladoName': grupoladoName,
      'lotemodName': lotemodName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SectorvalvuRecordDocumentEquality implements Equality<SectorvalvuRecord> {
  const SectorvalvuRecordDocumentEquality();

  @override
  bool equals(SectorvalvuRecord? e1, SectorvalvuRecord? e2) {
    return e1?.sectorvalvuName == e2?.sectorvalvuName &&
        e1?.grupoladoName == e2?.grupoladoName &&
        e1?.lotemodName == e2?.lotemodName;
  }

  @override
  int hash(SectorvalvuRecord? e) => const ListEquality()
      .hash([e?.sectorvalvuName, e?.grupoladoName, e?.lotemodName]);

  @override
  bool isValidKey(Object? o) => o is SectorvalvuRecord;
}
