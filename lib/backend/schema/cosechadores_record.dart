import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CosechadoresRecord extends FirestoreRecord {
  CosechadoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dnicosechador" field.
  String? _dnicosechador;
  String get dnicosechador => _dnicosechador ?? '';
  bool hasDnicosechador() => _dnicosechador != null;

  // "nombrescosechador" field.
  String? _nombrescosechador;
  String get nombrescosechador => _nombrescosechador ?? '';
  bool hasNombrescosechador() => _nombrescosechador != null;

  // "photo_url_trabajador" field.
  String? _photoUrlTrabajador;
  String get photoUrlTrabajador => _photoUrlTrabajador ?? '';
  bool hasPhotoUrlTrabajador() => _photoUrlTrabajador != null;

  // "cosechapersona" field.
  DocumentReference? _cosechapersona;
  DocumentReference? get cosechapersona => _cosechapersona;
  bool hasCosechapersona() => _cosechapersona != null;

  void _initializeFields() {
    _dnicosechador = snapshotData['dnicosechador'] as String?;
    _nombrescosechador = snapshotData['nombrescosechador'] as String?;
    _photoUrlTrabajador = snapshotData['photo_url_trabajador'] as String?;
    _cosechapersona = snapshotData['cosechapersona'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cosechadores');

  static Stream<CosechadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CosechadoresRecord.fromSnapshot(s));

  static Future<CosechadoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CosechadoresRecord.fromSnapshot(s));

  static CosechadoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CosechadoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CosechadoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CosechadoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CosechadoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CosechadoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCosechadoresRecordData({
  String? dnicosechador,
  String? nombrescosechador,
  String? photoUrlTrabajador,
  DocumentReference? cosechapersona,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dnicosechador': dnicosechador,
      'nombrescosechador': nombrescosechador,
      'photo_url_trabajador': photoUrlTrabajador,
      'cosechapersona': cosechapersona,
    }.withoutNulls,
  );

  return firestoreData;
}

class CosechadoresRecordDocumentEquality
    implements Equality<CosechadoresRecord> {
  const CosechadoresRecordDocumentEquality();

  @override
  bool equals(CosechadoresRecord? e1, CosechadoresRecord? e2) {
    return e1?.dnicosechador == e2?.dnicosechador &&
        e1?.nombrescosechador == e2?.nombrescosechador &&
        e1?.photoUrlTrabajador == e2?.photoUrlTrabajador &&
        e1?.cosechapersona == e2?.cosechapersona;
  }

  @override
  int hash(CosechadoresRecord? e) => const ListEquality().hash([
        e?.dnicosechador,
        e?.nombrescosechador,
        e?.photoUrlTrabajador,
        e?.cosechapersona
      ]);

  @override
  bool isValidKey(Object? o) => o is CosechadoresRecord;
}
