// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi-to-visit.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PoiToVisitCollectionReference
    implements
        PoiToVisitQuery,
        FirestoreCollectionReference<PoiToVisit, PoiToVisitQuerySnapshot> {
  factory PoiToVisitCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PoiToVisitCollectionReference;

  static PoiToVisit fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return PoiToVisit.fromJson({'groupId': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    PoiToVisit value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('groupId');
  }

  @override
  CollectionReference<PoiToVisit> get reference;

  @override
  PoiToVisitDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PoiToVisitDocumentReference> add(PoiToVisit value);
}

class _$PoiToVisitCollectionReference extends _$PoiToVisitQuery
    implements PoiToVisitCollectionReference {
  factory _$PoiToVisitCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PoiToVisitCollectionReference._(
      firestore.collection('poi-to-visit').withConverter(
            fromFirestore: PoiToVisitCollectionReference.fromFirestore,
            toFirestore: PoiToVisitCollectionReference.toFirestore,
          ),
    );
  }

  _$PoiToVisitCollectionReference._(
    CollectionReference<PoiToVisit> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<PoiToVisit> get reference =>
      super.reference as CollectionReference<PoiToVisit>;

  @override
  PoiToVisitDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PoiToVisitDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PoiToVisitDocumentReference> add(PoiToVisit value) {
    return reference.add(value).then((ref) => PoiToVisitDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PoiToVisitCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PoiToVisitDocumentReference
    extends FirestoreDocumentReference<PoiToVisit, PoiToVisitDocumentSnapshot> {
  factory PoiToVisitDocumentReference(DocumentReference<PoiToVisit> reference) =
      _$PoiToVisitDocumentReference;

  DocumentReference<PoiToVisit> get reference;

  /// A reference to the [PoiToVisitCollectionReference] containing this document.
  PoiToVisitCollectionReference get parent {
    return _$PoiToVisitCollectionReference(reference.firestore);
  }

  late final PoiCollectionReference poi = _$PoiCollectionReference(
    reference,
  );

  @override
  Stream<PoiToVisitDocumentSnapshot> snapshots();

  @override
  Future<PoiToVisitDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? description,
    FieldValue descriptionFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? description,
    FieldValue descriptionFieldValue,
  });
}

class _$PoiToVisitDocumentReference
    extends FirestoreDocumentReference<PoiToVisit, PoiToVisitDocumentSnapshot>
    implements PoiToVisitDocumentReference {
  _$PoiToVisitDocumentReference(this.reference);

  @override
  final DocumentReference<PoiToVisit> reference;

  /// A reference to the [PoiToVisitCollectionReference] containing this document.
  PoiToVisitCollectionReference get parent {
    return _$PoiToVisitCollectionReference(reference.firestore);
  }

  late final PoiCollectionReference poi = _$PoiCollectionReference(
    reference,
  );

  @override
  Stream<PoiToVisitDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PoiToVisitDocumentSnapshot._);
  }

  @override
  Future<PoiToVisitDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PoiToVisitDocumentSnapshot._);
  }

  @override
  Future<PoiToVisitDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PoiToVisitDocumentSnapshot._);
  }

  Future<void> update({
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
  }) async {
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    final json = {
      if (description != _sentinel)
        _$PoiToVisitFieldMap['description']!: description as String?,
      if (descriptionFieldValue != null)
        _$PoiToVisitFieldMap['description']!: descriptionFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
  }) {
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    final json = {
      if (description != _sentinel)
        _$PoiToVisitFieldMap['description']!: description as String?,
      if (descriptionFieldValue != null)
        _$PoiToVisitFieldMap['description']!: descriptionFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PoiToVisitDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PoiToVisitQuery
    implements QueryReference<PoiToVisit, PoiToVisitQuerySnapshot> {
  @override
  PoiToVisitQuery limit(int limit);

  @override
  PoiToVisitQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  PoiToVisitQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    PoiToVisitDocumentSnapshot? startAtDocument,
    PoiToVisitDocumentSnapshot? endAtDocument,
    PoiToVisitDocumentSnapshot? endBeforeDocument,
    PoiToVisitDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  PoiToVisitQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  PoiToVisitQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PoiToVisitQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  PoiToVisitQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PoiToVisitDocumentSnapshot? startAtDocument,
    PoiToVisitDocumentSnapshot? endAtDocument,
    PoiToVisitDocumentSnapshot? endBeforeDocument,
    PoiToVisitDocumentSnapshot? startAfterDocument,
  });

  PoiToVisitQuery orderByDescription({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiToVisitDocumentSnapshot? startAtDocument,
    PoiToVisitDocumentSnapshot? endAtDocument,
    PoiToVisitDocumentSnapshot? endBeforeDocument,
    PoiToVisitDocumentSnapshot? startAfterDocument,
  });
}

class _$PoiToVisitQuery
    extends QueryReference<PoiToVisit, PoiToVisitQuerySnapshot>
    implements PoiToVisitQuery {
  _$PoiToVisitQuery(
    this._collection, {
    required Query<PoiToVisit> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PoiToVisitQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(PoiToVisitQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PoiToVisitQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(PoiToVisitQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PoiToVisitQuery limit(int limit) {
    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PoiToVisitQuery limitToLast(int limit) {
    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  PoiToVisitQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiToVisitDocumentSnapshot? startAtDocument,
    PoiToVisitDocumentSnapshot? endAtDocument,
    PoiToVisitDocumentSnapshot? endBeforeDocument,
    PoiToVisitDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiToVisitQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiToVisitQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiToVisitQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiToVisitFieldMap['description']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiToVisitQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiToVisitDocumentSnapshot? startAtDocument,
    PoiToVisitDocumentSnapshot? endAtDocument,
    PoiToVisitDocumentSnapshot? endBeforeDocument,
    PoiToVisitDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiToVisitQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiToVisitDocumentSnapshot? startAtDocument,
    PoiToVisitDocumentSnapshot? endAtDocument,
    PoiToVisitDocumentSnapshot? endBeforeDocument,
    PoiToVisitDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PoiToVisitFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiToVisitQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PoiToVisitQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PoiToVisitDocumentSnapshot extends FirestoreDocumentSnapshot<PoiToVisit> {
  PoiToVisitDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<PoiToVisit> snapshot;

  @override
  PoiToVisitDocumentReference get reference {
    return PoiToVisitDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final PoiToVisit? data;
}

class PoiToVisitQuerySnapshot extends FirestoreQuerySnapshot<PoiToVisit,
    PoiToVisitQueryDocumentSnapshot> {
  PoiToVisitQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PoiToVisitQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<PoiToVisit> snapshot,
  ) {
    final docs = snapshot.docs.map(PoiToVisitQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PoiToVisitDocumentSnapshot._,
      );
    }).toList();

    return PoiToVisitQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PoiToVisitDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PoiToVisitDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PoiToVisitDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<PoiToVisit> snapshot;

  @override
  final List<PoiToVisitQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PoiToVisitDocumentSnapshot>> docChanges;
}

class PoiToVisitQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<PoiToVisit>
    implements PoiToVisitDocumentSnapshot {
  PoiToVisitQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<PoiToVisit> snapshot;

  @override
  final PoiToVisit data;

  @override
  PoiToVisitDocumentReference get reference {
    return PoiToVisitDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PoiCollectionReference
    implements PoiQuery, FirestoreCollectionReference<Poi, PoiQuerySnapshot> {
  factory PoiCollectionReference(
    DocumentReference<PoiToVisit> parent,
  ) = _$PoiCollectionReference;

  static Poi fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Poi.fromJson({'poiId': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Poi value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('poiId');
  }

  @override
  CollectionReference<Poi> get reference;

  /// A reference to the containing [PoiToVisitDocumentReference] if this is a subcollection.
  PoiToVisitDocumentReference get parent;

  @override
  PoiDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PoiDocumentReference> add(Poi value);
}

class _$PoiCollectionReference extends _$PoiQuery
    implements PoiCollectionReference {
  factory _$PoiCollectionReference(
    DocumentReference<PoiToVisit> parent,
  ) {
    return _$PoiCollectionReference._(
      PoiToVisitDocumentReference(parent),
      parent.collection('poi').withConverter(
            fromFirestore: PoiCollectionReference.fromFirestore,
            toFirestore: PoiCollectionReference.toFirestore,
          ),
    );
  }

  _$PoiCollectionReference._(
    this.parent,
    CollectionReference<Poi> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final PoiToVisitDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Poi> get reference =>
      super.reference as CollectionReference<Poi>;

  @override
  PoiDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PoiDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PoiDocumentReference> add(Poi value) {
    return reference.add(value).then((ref) => PoiDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PoiCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PoiDocumentReference
    extends FirestoreDocumentReference<Poi, PoiDocumentSnapshot> {
  factory PoiDocumentReference(DocumentReference<Poi> reference) =
      _$PoiDocumentReference;

  DocumentReference<Poi> get reference;

  /// A reference to the [PoiCollectionReference] containing this document.
  PoiCollectionReference get parent {
    return _$PoiCollectionReference(
      reference.parent.parent!.withConverter<PoiToVisit>(
        fromFirestore: PoiToVisitCollectionReference.fromFirestore,
        toFirestore: PoiToVisitCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<PoiDocumentSnapshot> snapshots();

  @override
  Future<PoiDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    double? latitude,
    FieldValue latitudeFieldValue,
    double? longitude,
    FieldValue longitudeFieldValue,
    num? id,
    FieldValue idFieldValue,
    String? category,
    FieldValue categoryFieldValue,
    String? poiclass,
    FieldValue poiclassFieldValue,
    String? iso_3166_1,
    FieldValue iso_3166_1FieldValue,
    String? iso_3166_2,
    FieldValue iso_3166_2FieldValue,
    String? maki,
    FieldValue makiFieldValue,
    String? name,
    FieldValue nameFieldValue,
    String? type,
    FieldValue typeFieldValue,
    String? imagePath,
    FieldValue imagePathFieldValue,
    num? poiRadius,
    FieldValue poiRadiusFieldValue,
    String? groupId,
    FieldValue groupIdFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    double? latitude,
    FieldValue latitudeFieldValue,
    double? longitude,
    FieldValue longitudeFieldValue,
    num? id,
    FieldValue idFieldValue,
    String? category,
    FieldValue categoryFieldValue,
    String? poiclass,
    FieldValue poiclassFieldValue,
    String? iso_3166_1,
    FieldValue iso_3166_1FieldValue,
    String? iso_3166_2,
    FieldValue iso_3166_2FieldValue,
    String? maki,
    FieldValue makiFieldValue,
    String? name,
    FieldValue nameFieldValue,
    String? type,
    FieldValue typeFieldValue,
    String? imagePath,
    FieldValue imagePathFieldValue,
    num? poiRadius,
    FieldValue poiRadiusFieldValue,
    String? groupId,
    FieldValue groupIdFieldValue,
  });
}

class _$PoiDocumentReference
    extends FirestoreDocumentReference<Poi, PoiDocumentSnapshot>
    implements PoiDocumentReference {
  _$PoiDocumentReference(this.reference);

  @override
  final DocumentReference<Poi> reference;

  /// A reference to the [PoiCollectionReference] containing this document.
  PoiCollectionReference get parent {
    return _$PoiCollectionReference(
      reference.parent.parent!.withConverter<PoiToVisit>(
        fromFirestore: PoiToVisitCollectionReference.fromFirestore,
        toFirestore: PoiToVisitCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<PoiDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PoiDocumentSnapshot._);
  }

  @override
  Future<PoiDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PoiDocumentSnapshot._);
  }

  @override
  Future<PoiDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PoiDocumentSnapshot._);
  }

  Future<void> update({
    Object? latitude = _sentinel,
    FieldValue? latitudeFieldValue,
    Object? longitude = _sentinel,
    FieldValue? longitudeFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? category = _sentinel,
    FieldValue? categoryFieldValue,
    Object? poiclass = _sentinel,
    FieldValue? poiclassFieldValue,
    Object? iso_3166_1 = _sentinel,
    FieldValue? iso_3166_1FieldValue,
    Object? iso_3166_2 = _sentinel,
    FieldValue? iso_3166_2FieldValue,
    Object? maki = _sentinel,
    FieldValue? makiFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? imagePath = _sentinel,
    FieldValue? imagePathFieldValue,
    Object? poiRadius = _sentinel,
    FieldValue? poiRadiusFieldValue,
    Object? groupId = _sentinel,
    FieldValue? groupIdFieldValue,
  }) async {
    assert(
      latitude == _sentinel || latitudeFieldValue == null,
      "Cannot specify both latitude and latitudeFieldValue",
    );
    assert(
      longitude == _sentinel || longitudeFieldValue == null,
      "Cannot specify both longitude and longitudeFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      category == _sentinel || categoryFieldValue == null,
      "Cannot specify both category and categoryFieldValue",
    );
    assert(
      poiclass == _sentinel || poiclassFieldValue == null,
      "Cannot specify both poiclass and poiclassFieldValue",
    );
    assert(
      iso_3166_1 == _sentinel || iso_3166_1FieldValue == null,
      "Cannot specify both iso_3166_1 and iso_3166_1FieldValue",
    );
    assert(
      iso_3166_2 == _sentinel || iso_3166_2FieldValue == null,
      "Cannot specify both iso_3166_2 and iso_3166_2FieldValue",
    );
    assert(
      maki == _sentinel || makiFieldValue == null,
      "Cannot specify both maki and makiFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      imagePath == _sentinel || imagePathFieldValue == null,
      "Cannot specify both imagePath and imagePathFieldValue",
    );
    assert(
      poiRadius == _sentinel || poiRadiusFieldValue == null,
      "Cannot specify both poiRadius and poiRadiusFieldValue",
    );
    assert(
      groupId == _sentinel || groupIdFieldValue == null,
      "Cannot specify both groupId and groupIdFieldValue",
    );
    final json = {
      if (latitude != _sentinel)
        _$PoiFieldMap['latitude']!: latitude as double?,
      if (latitudeFieldValue != null)
        _$PoiFieldMap['latitude']!: latitudeFieldValue,
      if (longitude != _sentinel)
        _$PoiFieldMap['longitude']!: longitude as double?,
      if (longitudeFieldValue != null)
        _$PoiFieldMap['longitude']!: longitudeFieldValue,
      if (id != _sentinel) _$PoiFieldMap['id']!: id as num?,
      if (idFieldValue != null) _$PoiFieldMap['id']!: idFieldValue,
      if (category != _sentinel)
        _$PoiFieldMap['category']!: category as String?,
      if (categoryFieldValue != null)
        _$PoiFieldMap['category']!: categoryFieldValue,
      if (poiclass != _sentinel)
        _$PoiFieldMap['poiclass']!: poiclass as String?,
      if (poiclassFieldValue != null)
        _$PoiFieldMap['poiclass']!: poiclassFieldValue,
      if (iso_3166_1 != _sentinel)
        _$PoiFieldMap['iso_3166_1']!: iso_3166_1 as String?,
      if (iso_3166_1FieldValue != null)
        _$PoiFieldMap['iso_3166_1']!: iso_3166_1FieldValue,
      if (iso_3166_2 != _sentinel)
        _$PoiFieldMap['iso_3166_2']!: iso_3166_2 as String?,
      if (iso_3166_2FieldValue != null)
        _$PoiFieldMap['iso_3166_2']!: iso_3166_2FieldValue,
      if (maki != _sentinel) _$PoiFieldMap['maki']!: maki as String?,
      if (makiFieldValue != null) _$PoiFieldMap['maki']!: makiFieldValue,
      if (name != _sentinel) _$PoiFieldMap['name']!: name as String?,
      if (nameFieldValue != null) _$PoiFieldMap['name']!: nameFieldValue,
      if (type != _sentinel) _$PoiFieldMap['type']!: type as String?,
      if (typeFieldValue != null) _$PoiFieldMap['type']!: typeFieldValue,
      if (imagePath != _sentinel)
        _$PoiFieldMap['imagePath']!: imagePath as String?,
      if (imagePathFieldValue != null)
        _$PoiFieldMap['imagePath']!: imagePathFieldValue,
      if (poiRadius != _sentinel)
        _$PoiFieldMap['poiRadius']!: poiRadius as num?,
      if (poiRadiusFieldValue != null)
        _$PoiFieldMap['poiRadius']!: poiRadiusFieldValue,
      if (groupId != _sentinel) _$PoiFieldMap['groupId']!: groupId as String?,
      if (groupIdFieldValue != null)
        _$PoiFieldMap['groupId']!: groupIdFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? latitude = _sentinel,
    FieldValue? latitudeFieldValue,
    Object? longitude = _sentinel,
    FieldValue? longitudeFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? category = _sentinel,
    FieldValue? categoryFieldValue,
    Object? poiclass = _sentinel,
    FieldValue? poiclassFieldValue,
    Object? iso_3166_1 = _sentinel,
    FieldValue? iso_3166_1FieldValue,
    Object? iso_3166_2 = _sentinel,
    FieldValue? iso_3166_2FieldValue,
    Object? maki = _sentinel,
    FieldValue? makiFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? type = _sentinel,
    FieldValue? typeFieldValue,
    Object? imagePath = _sentinel,
    FieldValue? imagePathFieldValue,
    Object? poiRadius = _sentinel,
    FieldValue? poiRadiusFieldValue,
    Object? groupId = _sentinel,
    FieldValue? groupIdFieldValue,
  }) {
    assert(
      latitude == _sentinel || latitudeFieldValue == null,
      "Cannot specify both latitude and latitudeFieldValue",
    );
    assert(
      longitude == _sentinel || longitudeFieldValue == null,
      "Cannot specify both longitude and longitudeFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      category == _sentinel || categoryFieldValue == null,
      "Cannot specify both category and categoryFieldValue",
    );
    assert(
      poiclass == _sentinel || poiclassFieldValue == null,
      "Cannot specify both poiclass and poiclassFieldValue",
    );
    assert(
      iso_3166_1 == _sentinel || iso_3166_1FieldValue == null,
      "Cannot specify both iso_3166_1 and iso_3166_1FieldValue",
    );
    assert(
      iso_3166_2 == _sentinel || iso_3166_2FieldValue == null,
      "Cannot specify both iso_3166_2 and iso_3166_2FieldValue",
    );
    assert(
      maki == _sentinel || makiFieldValue == null,
      "Cannot specify both maki and makiFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      type == _sentinel || typeFieldValue == null,
      "Cannot specify both type and typeFieldValue",
    );
    assert(
      imagePath == _sentinel || imagePathFieldValue == null,
      "Cannot specify both imagePath and imagePathFieldValue",
    );
    assert(
      poiRadius == _sentinel || poiRadiusFieldValue == null,
      "Cannot specify both poiRadius and poiRadiusFieldValue",
    );
    assert(
      groupId == _sentinel || groupIdFieldValue == null,
      "Cannot specify both groupId and groupIdFieldValue",
    );
    final json = {
      if (latitude != _sentinel)
        _$PoiFieldMap['latitude']!: latitude as double?,
      if (latitudeFieldValue != null)
        _$PoiFieldMap['latitude']!: latitudeFieldValue,
      if (longitude != _sentinel)
        _$PoiFieldMap['longitude']!: longitude as double?,
      if (longitudeFieldValue != null)
        _$PoiFieldMap['longitude']!: longitudeFieldValue,
      if (id != _sentinel) _$PoiFieldMap['id']!: id as num?,
      if (idFieldValue != null) _$PoiFieldMap['id']!: idFieldValue,
      if (category != _sentinel)
        _$PoiFieldMap['category']!: category as String?,
      if (categoryFieldValue != null)
        _$PoiFieldMap['category']!: categoryFieldValue,
      if (poiclass != _sentinel)
        _$PoiFieldMap['poiclass']!: poiclass as String?,
      if (poiclassFieldValue != null)
        _$PoiFieldMap['poiclass']!: poiclassFieldValue,
      if (iso_3166_1 != _sentinel)
        _$PoiFieldMap['iso_3166_1']!: iso_3166_1 as String?,
      if (iso_3166_1FieldValue != null)
        _$PoiFieldMap['iso_3166_1']!: iso_3166_1FieldValue,
      if (iso_3166_2 != _sentinel)
        _$PoiFieldMap['iso_3166_2']!: iso_3166_2 as String?,
      if (iso_3166_2FieldValue != null)
        _$PoiFieldMap['iso_3166_2']!: iso_3166_2FieldValue,
      if (maki != _sentinel) _$PoiFieldMap['maki']!: maki as String?,
      if (makiFieldValue != null) _$PoiFieldMap['maki']!: makiFieldValue,
      if (name != _sentinel) _$PoiFieldMap['name']!: name as String?,
      if (nameFieldValue != null) _$PoiFieldMap['name']!: nameFieldValue,
      if (type != _sentinel) _$PoiFieldMap['type']!: type as String?,
      if (typeFieldValue != null) _$PoiFieldMap['type']!: typeFieldValue,
      if (imagePath != _sentinel)
        _$PoiFieldMap['imagePath']!: imagePath as String?,
      if (imagePathFieldValue != null)
        _$PoiFieldMap['imagePath']!: imagePathFieldValue,
      if (poiRadius != _sentinel)
        _$PoiFieldMap['poiRadius']!: poiRadius as num?,
      if (poiRadiusFieldValue != null)
        _$PoiFieldMap['poiRadius']!: poiRadiusFieldValue,
      if (groupId != _sentinel) _$PoiFieldMap['groupId']!: groupId as String?,
      if (groupIdFieldValue != null)
        _$PoiFieldMap['groupId']!: groupIdFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PoiDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PoiQuery implements QueryReference<Poi, PoiQuerySnapshot> {
  @override
  PoiQuery limit(int limit);

  @override
  PoiQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  PoiQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  PoiQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  PoiQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PoiQuery whereLatitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });
  PoiQuery whereLongitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });
  PoiQuery whereId({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  PoiQuery whereCategory({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery wherePoiclass({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery whereIso_3166_1({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery whereIso_3166_2({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery whereMaki({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery whereImagePath({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  PoiQuery wherePoiRadius({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  PoiQuery whereGroupId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  PoiQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByLatitude({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByLongitude({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderById({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByCategory({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByPoiclass({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByIso_3166_1({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByIso_3166_2({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByMaki({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByType({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByImagePath({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByPoiRadius({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });

  PoiQuery orderByGroupId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  });
}

class _$PoiQuery extends QueryReference<Poi, PoiQuerySnapshot>
    implements PoiQuery {
  _$PoiQuery(
    this._collection, {
    required Query<Poi> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PoiQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(PoiQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PoiQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PoiQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PoiQuery limit(int limit) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PoiQuery limitToLast(int limit) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereLatitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['latitude']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereLongitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['longitude']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereId({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['id']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereCategory({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['category']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery wherePoiclass({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['poiclass']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereIso_3166_1({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['iso_3166_1']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereIso_3166_2({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['iso_3166_2']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereMaki({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['maki']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereType({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['type']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereImagePath({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['imagePath']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery wherePoiRadius({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['poiRadius']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery whereGroupId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PoiFieldMap['groupId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  PoiQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByLatitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['latitude']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByLongitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['longitude']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['id']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByCategory({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['category']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByPoiclass({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['poiclass']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByIso_3166_1({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['iso_3166_1']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByIso_3166_2({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['iso_3166_2']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByMaki({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['maki']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['type']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByImagePath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['imagePath']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByPoiRadius({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['poiRadius']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PoiQuery orderByGroupId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PoiDocumentSnapshot? startAtDocument,
    PoiDocumentSnapshot? endAtDocument,
    PoiDocumentSnapshot? endBeforeDocument,
    PoiDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$PoiFieldMap['groupId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$PoiQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PoiQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PoiDocumentSnapshot extends FirestoreDocumentSnapshot<Poi> {
  PoiDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Poi> snapshot;

  @override
  PoiDocumentReference get reference {
    return PoiDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Poi? data;
}

class PoiQuerySnapshot
    extends FirestoreQuerySnapshot<Poi, PoiQueryDocumentSnapshot> {
  PoiQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PoiQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Poi> snapshot,
  ) {
    final docs = snapshot.docs.map(PoiQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PoiDocumentSnapshot._,
      );
    }).toList();

    return PoiQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PoiDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PoiDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PoiDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Poi> snapshot;

  @override
  final List<PoiQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PoiDocumentSnapshot>> docChanges;
}

class PoiQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Poi>
    implements PoiDocumentSnapshot {
  PoiQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Poi> snapshot;

  @override
  final Poi data;

  @override
  PoiDocumentReference get reference {
    return PoiDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiToVisit _$PoiToVisitFromJson(Map<String, dynamic> json) => PoiToVisit(
      groupId: json['groupId'] as String,
      description: json['description'] as String?,
    );

const _$PoiToVisitFieldMap = <String, String>{
  'groupId': 'groupId',
  'description': 'description',
};

Map<String, dynamic> _$PoiToVisitToJson(PoiToVisit instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'description': instance.description,
    };

Poi _$PoiFromJson(Map<String, dynamic> json) => Poi(
      poiId: json['poiId'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      geometry: json['geometry'] as Map<String, dynamic>?,
      id: json['id'] as num?,
      properties: json['properties'] as Map<String, dynamic>?,
      category: json['category'] as String?,
      poiclass: json['poiclass'] as String?,
      iso_3166_1: json['iso_3166_1'] as String?,
      iso_3166_2: json['iso_3166_2'] as String?,
      maki: json['maki'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      imagePath: json['imagePath'] as String?,
      poiRadius: json['poiRadius'] as num?,
      groupId: json['groupId'] as String?,
    );

const _$PoiFieldMap = <String, String>{
  'poiId': 'poiId',
  'latitude': 'latitude',
  'longitude': 'longitude',
  'geometry': 'geometry',
  'id': 'id',
  'properties': 'properties',
  'category': 'category',
  'poiclass': 'poiclass',
  'iso_3166_1': 'iso_3166_1',
  'iso_3166_2': 'iso_3166_2',
  'maki': 'maki',
  'name': 'name',
  'type': 'type',
  'imagePath': 'imagePath',
  'poiRadius': 'poiRadius',
  'groupId': 'groupId',
};

Map<String, dynamic> _$PoiToJson(Poi instance) => <String, dynamic>{
      'poiId': instance.poiId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'geometry': instance.geometry,
      'id': instance.id,
      'properties': instance.properties,
      'category': instance.category,
      'poiclass': instance.poiclass,
      'iso_3166_1': instance.iso_3166_1,
      'iso_3166_2': instance.iso_3166_2,
      'maki': instance.maki,
      'name': instance.name,
      'type': instance.type,
      'imagePath': instance.imagePath,
      'poiRadius': instance.poiRadius,
      'groupId': instance.groupId,
    };
