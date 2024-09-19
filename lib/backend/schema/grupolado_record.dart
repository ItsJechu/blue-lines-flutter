import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrupoladoRecord extends FirestoreRecord {
  GrupoladoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "grupoladoName" field.
  String? _grupoladoName;
  String get grupoladoName => _grupoladoName ?? '';
  bool hasGrupoladoName() => _grupoladoName != null;

  // "lotemodName" field.
  String? _lotemodName;
  String get lotemodName => _lotemodName ?? '';
  bool hasLotemodName() => _lotemodName != null;

  void _initializeFields() {
    _grupoladoName = snapshotData['grupoladoName'] as String?;
    _lotemodName = snapshotData['lotemodName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grupolado');

  static Stream<GrupoladoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoladoRecord.fromSnapshot(s));

  static Future<GrupoladoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrupoladoRecord.fromSnapshot(s));

  static GrupoladoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GrupoladoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoladoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoladoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoladoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoladoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoladoRecordData({
  String? grupoladoName,
  String? lotemodName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'grupoladoName': grupoladoName,
      'lotemodName': lotemodName,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoladoRecordDocumentEquality implements Equality<GrupoladoRecord> {
  const GrupoladoRecordDocumentEquality();

  @override
  bool equals(GrupoladoRecord? e1, GrupoladoRecord? e2) {
    return e1?.grupoladoName == e2?.grupoladoName &&
        e1?.lotemodName == e2?.lotemodName;
  }

  @override
  int hash(GrupoladoRecord? e) =>
      const ListEquality().hash([e?.grupoladoName, e?.lotemodName]);

  @override
  bool isValidKey(Object? o) => o is GrupoladoRecord;
}
