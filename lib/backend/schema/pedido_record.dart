import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidoRecord extends FirestoreRecord {
  PedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "last_edited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url_image" field.
  String? _urlImage;
  String get urlImage => _urlImage ?? '';
  bool hasUrlImage() => _urlImage != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "user_uid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  bool hasUserUid() => _userUid != null;

  // "negociador_uid" field.
  String? _negociadorUid;
  String get negociadorUid => _negociadorUid ?? '';
  bool hasNegociadorUid() => _negociadorUid != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _lastEdited = snapshotData['last_edited'] as DateTime?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _urlImage = snapshotData['url_image'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _tipo = snapshotData['tipo'] as String?;
    _userUid = snapshotData['user_uid'] as String?;
    _negociadorUid = snapshotData['negociador_uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedido');

  static Stream<PedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidoRecord.fromSnapshot(s));

  static Future<PedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidoRecord.fromSnapshot(s));

  static PedidoRecord fromSnapshot(DocumentSnapshot snapshot) => PedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidoRecordData({
  String? description,
  DateTime? lastEdited,
  DateTime? timeCreated,
  String? name,
  String? urlImage,
  int? status,
  String? tipo,
  String? userUid,
  String? negociadorUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'last_edited': lastEdited,
      'time_created': timeCreated,
      'name': name,
      'url_image': urlImage,
      'status': status,
      'tipo': tipo,
      'user_uid': userUid,
      'negociador_uid': negociadorUid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidoRecordDocumentEquality implements Equality<PedidoRecord> {
  const PedidoRecordDocumentEquality();

  @override
  bool equals(PedidoRecord? e1, PedidoRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.name == e2?.name &&
        e1?.urlImage == e2?.urlImage &&
        e1?.status == e2?.status &&
        e1?.tipo == e2?.tipo &&
        e1?.userUid == e2?.userUid &&
        e1?.negociadorUid == e2?.negociadorUid;
  }

  @override
  int hash(PedidoRecord? e) => const ListEquality().hash([
        e?.description,
        e?.lastEdited,
        e?.timeCreated,
        e?.name,
        e?.urlImage,
        e?.status,
        e?.tipo,
        e?.userUid,
        e?.negociadorUid
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidoRecord;
}
