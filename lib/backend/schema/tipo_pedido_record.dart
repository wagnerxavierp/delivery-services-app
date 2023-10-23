import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipoPedidoRecord extends FirestoreRecord {
  TipoPedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tipo_pedido');

  static Stream<TipoPedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoPedidoRecord.fromSnapshot(s));

  static Future<TipoPedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipoPedidoRecord.fromSnapshot(s));

  static TipoPedidoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoPedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoPedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoPedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoPedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoPedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoPedidoRecordData({
  String? nome,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoPedidoRecordDocumentEquality implements Equality<TipoPedidoRecord> {
  const TipoPedidoRecordDocumentEquality();

  @override
  bool equals(TipoPedidoRecord? e1, TipoPedidoRecord? e2) {
    return e1?.nome == e2?.nome;
  }

  @override
  int hash(TipoPedidoRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is TipoPedidoRecord;
}
