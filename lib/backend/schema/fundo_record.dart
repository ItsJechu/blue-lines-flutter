import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FundoRecord extends FirestoreRecord {
  FundoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fundo');

  static Stream<FundoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FundoRecord.fromSnapshot(s));

  static Future<FundoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FundoRecord.fromSnapshot(s));

  static FundoRecord fromSnapshot(DocumentSnapshot snapshot) => FundoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FundoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FundoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FundoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FundoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFundoRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class FundoRecordDocumentEquality implements Equality<FundoRecord> {
  const FundoRecordDocumentEquality();

  @override
  bool equals(FundoRecord? e1, FundoRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(FundoRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is FundoRecord;
}
