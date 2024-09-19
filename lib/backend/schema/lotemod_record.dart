import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LotemodRecord extends FirestoreRecord {
  LotemodRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "fundoName" field.
  String? _fundoName;
  String get fundoName => _fundoName ?? '';
  bool hasFundoName() => _fundoName != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _fundoName = snapshotData['fundoName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lotemod');

  static Stream<LotemodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LotemodRecord.fromSnapshot(s));

  static Future<LotemodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LotemodRecord.fromSnapshot(s));

  static LotemodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LotemodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LotemodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LotemodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LotemodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LotemodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLotemodRecordData({
  String? name,
  String? fundoName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'fundoName': fundoName,
    }.withoutNulls,
  );

  return firestoreData;
}

class LotemodRecordDocumentEquality implements Equality<LotemodRecord> {
  const LotemodRecordDocumentEquality();

  @override
  bool equals(LotemodRecord? e1, LotemodRecord? e2) {
    return e1?.name == e2?.name && e1?.fundoName == e2?.fundoName;
  }

  @override
  int hash(LotemodRecord? e) =>
      const ListEquality().hash([e?.name, e?.fundoName]);

  @override
  bool isValidKey(Object? o) => o is LotemodRecord;
}
