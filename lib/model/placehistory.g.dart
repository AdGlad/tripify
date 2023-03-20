// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placehistory.dart';

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
abstract class CurrentUserCollectionReference
    implements
        CurrentUserQuery,
        FirestoreCollectionReference<CurrentUser, CurrentUserQuerySnapshot> {
  factory CurrentUserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CurrentUserCollectionReference;

  static CurrentUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return CurrentUser.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CurrentUser value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<CurrentUser> get reference;

  @override
  CurrentUserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CurrentUserDocumentReference> add(CurrentUser value);
}

class _$CurrentUserCollectionReference extends _$CurrentUserQuery
    implements CurrentUserCollectionReference {
  factory _$CurrentUserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CurrentUserCollectionReference._(
      firestore.collection('currentuser').withConverter(
            fromFirestore: CurrentUserCollectionReference.fromFirestore,
            toFirestore: CurrentUserCollectionReference.toFirestore,
          ),
    );
  }

  _$CurrentUserCollectionReference._(
    CollectionReference<CurrentUser> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<CurrentUser> get reference =>
      super.reference as CollectionReference<CurrentUser>;

  @override
  CurrentUserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CurrentUserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CurrentUserDocumentReference> add(CurrentUser value) {
    return reference
        .add(value)
        .then((ref) => CurrentUserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CurrentUserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CurrentUserDocumentReference extends FirestoreDocumentReference<
    CurrentUser, CurrentUserDocumentSnapshot> {
  factory CurrentUserDocumentReference(
          DocumentReference<CurrentUser> reference) =
      _$CurrentUserDocumentReference;

  DocumentReference<CurrentUser> get reference;

  /// A reference to the [CurrentUserCollectionReference] containing this document.
  CurrentUserCollectionReference get parent {
    return _$CurrentUserCollectionReference(reference.firestore);
  }

  late final CurrentCountryCollectionReference country =
      _$CurrentCountryCollectionReference(
    reference,
  );

  @override
  Stream<CurrentUserDocumentSnapshot> snapshots();

  @override
  Future<CurrentUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? userId,
    FieldValue userIdFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? displayname,
    FieldValue displaynameFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? userId,
    FieldValue userIdFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? displayname,
    FieldValue displaynameFieldValue,
  });
}

class _$CurrentUserDocumentReference
    extends FirestoreDocumentReference<CurrentUser, CurrentUserDocumentSnapshot>
    implements CurrentUserDocumentReference {
  _$CurrentUserDocumentReference(this.reference);

  @override
  final DocumentReference<CurrentUser> reference;

  /// A reference to the [CurrentUserCollectionReference] containing this document.
  CurrentUserCollectionReference get parent {
    return _$CurrentUserCollectionReference(reference.firestore);
  }

  late final CurrentCountryCollectionReference country =
      _$CurrentCountryCollectionReference(
    reference,
  );

  @override
  Stream<CurrentUserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CurrentUserDocumentSnapshot._);
  }

  @override
  Future<CurrentUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CurrentUserDocumentSnapshot._);
  }

  @override
  Future<CurrentUserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(CurrentUserDocumentSnapshot._);
  }

  Future<void> update({
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? displayname = _sentinel,
    FieldValue? displaynameFieldValue,
  }) async {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      displayname == _sentinel || displaynameFieldValue == null,
      "Cannot specify both displayname and displaynameFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$CurrentUserFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$CurrentUserFieldMap['userId']!: userIdFieldValue,
      if (email != _sentinel) _$CurrentUserFieldMap['email']!: email as String?,
      if (emailFieldValue != null)
        _$CurrentUserFieldMap['email']!: emailFieldValue,
      if (displayname != _sentinel)
        _$CurrentUserFieldMap['displayname']!: displayname as String?,
      if (displaynameFieldValue != null)
        _$CurrentUserFieldMap['displayname']!: displaynameFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? displayname = _sentinel,
    FieldValue? displaynameFieldValue,
  }) {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      displayname == _sentinel || displaynameFieldValue == null,
      "Cannot specify both displayname and displaynameFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$CurrentUserFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$CurrentUserFieldMap['userId']!: userIdFieldValue,
      if (email != _sentinel) _$CurrentUserFieldMap['email']!: email as String?,
      if (emailFieldValue != null)
        _$CurrentUserFieldMap['email']!: emailFieldValue,
      if (displayname != _sentinel)
        _$CurrentUserFieldMap['displayname']!: displayname as String?,
      if (displaynameFieldValue != null)
        _$CurrentUserFieldMap['displayname']!: displaynameFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CurrentUserQuery
    implements QueryReference<CurrentUser, CurrentUserQuerySnapshot> {
  @override
  CurrentUserQuery limit(int limit);

  @override
  CurrentUserQuery limitToLast(int limit);

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
  CurrentUserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
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
  CurrentUserQuery whereFieldPath(
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

  CurrentUserQuery whereDocumentId({
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
  CurrentUserQuery whereUserId({
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
  CurrentUserQuery whereEmail({
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
  CurrentUserQuery whereDisplayname({
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

  CurrentUserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  });

  CurrentUserQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  });

  CurrentUserQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  });

  CurrentUserQuery orderByDisplayname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  });
}

class _$CurrentUserQuery
    extends QueryReference<CurrentUser, CurrentUserQuerySnapshot>
    implements CurrentUserQuery {
  _$CurrentUserQuery(
    this._collection, {
    required Query<CurrentUser> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CurrentUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(CurrentUserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CurrentUserQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CurrentUserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CurrentUserQuery limit(int limit) {
    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CurrentUserQuery limitToLast(int limit) {
    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  CurrentUserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
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
    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentUserQuery whereFieldPath(
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
    return _$CurrentUserQuery(
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

  CurrentUserQuery whereDocumentId({
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
    return _$CurrentUserQuery(
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

  CurrentUserQuery whereUserId({
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
    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentUserFieldMap['userId']!,
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

  CurrentUserQuery whereEmail({
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
    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentUserFieldMap['email']!,
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

  CurrentUserQuery whereDisplayname({
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
    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentUserFieldMap['displayname']!,
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

  CurrentUserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
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

    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentUserQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentUserFieldMap['userId']!, descending: descending);
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

    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentUserQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentUserFieldMap['email']!, descending: descending);
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

    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentUserQuery orderByDisplayname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentUserDocumentSnapshot? startAtDocument,
    CurrentUserDocumentSnapshot? endAtDocument,
    CurrentUserDocumentSnapshot? endBeforeDocument,
    CurrentUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentUserFieldMap['displayname']!, descending: descending);
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

    return _$CurrentUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CurrentUserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CurrentUserDocumentSnapshot
    extends FirestoreDocumentSnapshot<CurrentUser> {
  CurrentUserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CurrentUser> snapshot;

  @override
  CurrentUserDocumentReference get reference {
    return CurrentUserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CurrentUser? data;
}

class CurrentUserQuerySnapshot extends FirestoreQuerySnapshot<CurrentUser,
    CurrentUserQueryDocumentSnapshot> {
  CurrentUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CurrentUserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CurrentUser> snapshot,
  ) {
    final docs = snapshot.docs.map(CurrentUserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CurrentUserDocumentSnapshot._,
      );
    }).toList();

    return CurrentUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CurrentUserDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CurrentUserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CurrentUserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CurrentUser> snapshot;

  @override
  final List<CurrentUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CurrentUserDocumentSnapshot>> docChanges;
}

class CurrentUserQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<CurrentUser>
    implements CurrentUserDocumentSnapshot {
  CurrentUserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CurrentUser> snapshot;

  @override
  final CurrentUser data;

  @override
  CurrentUserDocumentReference get reference {
    return CurrentUserDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CurrentCountryCollectionReference
    implements
        CurrentCountryQuery,
        FirestoreCollectionReference<CurrentCountry,
            CurrentCountryQuerySnapshot> {
  factory CurrentCountryCollectionReference(
    DocumentReference<CurrentUser> parent,
  ) = _$CurrentCountryCollectionReference;

  static CurrentCountry fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return CurrentCountry.fromJson(
        {'countryCode': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CurrentCountry value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('countryCode');
  }

  @override
  CollectionReference<CurrentCountry> get reference;

  /// A reference to the containing [CurrentUserDocumentReference] if this is a subcollection.
  CurrentUserDocumentReference get parent;

  @override
  CurrentCountryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CurrentCountryDocumentReference> add(CurrentCountry value);
}

class _$CurrentCountryCollectionReference extends _$CurrentCountryQuery
    implements CurrentCountryCollectionReference {
  factory _$CurrentCountryCollectionReference(
    DocumentReference<CurrentUser> parent,
  ) {
    return _$CurrentCountryCollectionReference._(
      CurrentUserDocumentReference(parent),
      parent.collection('country').withConverter(
            fromFirestore: CurrentCountryCollectionReference.fromFirestore,
            toFirestore: CurrentCountryCollectionReference.toFirestore,
          ),
    );
  }

  _$CurrentCountryCollectionReference._(
    this.parent,
    CollectionReference<CurrentCountry> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final CurrentUserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<CurrentCountry> get reference =>
      super.reference as CollectionReference<CurrentCountry>;

  @override
  CurrentCountryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CurrentCountryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CurrentCountryDocumentReference> add(CurrentCountry value) {
    return reference
        .add(value)
        .then((ref) => CurrentCountryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CurrentCountryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CurrentCountryDocumentReference
    extends FirestoreDocumentReference<CurrentCountry,
        CurrentCountryDocumentSnapshot> {
  factory CurrentCountryDocumentReference(
          DocumentReference<CurrentCountry> reference) =
      _$CurrentCountryDocumentReference;

  DocumentReference<CurrentCountry> get reference;

  /// A reference to the [CurrentCountryCollectionReference] containing this document.
  CurrentCountryCollectionReference get parent {
    return _$CurrentCountryCollectionReference(
      reference.parent.parent!.withConverter<CurrentUser>(
        fromFirestore: CurrentUserCollectionReference.fromFirestore,
        toFirestore: CurrentUserCollectionReference.toFirestore,
      ),
    );
  }

  late final RegionCollectionReference region = _$RegionCollectionReference(
    reference,
  );

  @override
  Stream<CurrentCountryDocumentSnapshot> snapshots();

  @override
  Future<CurrentCountryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? countryName,
    FieldValue countryNameFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
    String? alpha3code,
    FieldValue alpha3codeFieldValue,
    String? callingcode,
    FieldValue callingcodeFieldValue,
    String? capital,
    FieldValue capitalFieldValue,
    String? subregion,
    FieldValue subregionFieldValue,
    String? region,
    FieldValue regionFieldValue,
    int? population,
    FieldValue populationFieldValue,
    String? timezones,
    FieldValue timezonesFieldValue,
    String? numericCode,
    FieldValue numericCodeFieldValue,
    String? flag,
    FieldValue flagFieldValue,
    double? longitude,
    FieldValue longitudeFieldValue,
    double? latitude,
    FieldValue latitudeFieldValue,
    String? currencycode,
    FieldValue currencycodeFieldValue,
    String? currencyname,
    FieldValue currencynameFieldValue,
    String? currencysymbol,
    FieldValue currencysymbolFieldValue,
    String? langiso6391,
    FieldValue langiso6391FieldValue,
    String? langname,
    FieldValue langnameFieldValue,
    DateTime? arrivaldate,
    FieldValue arrivaldateFieldValue,
    DateTime? departuredate,
    FieldValue departuredateFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? countryName,
    FieldValue countryNameFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
    String? alpha3code,
    FieldValue alpha3codeFieldValue,
    String? callingcode,
    FieldValue callingcodeFieldValue,
    String? capital,
    FieldValue capitalFieldValue,
    String? subregion,
    FieldValue subregionFieldValue,
    String? region,
    FieldValue regionFieldValue,
    int? population,
    FieldValue populationFieldValue,
    String? timezones,
    FieldValue timezonesFieldValue,
    String? numericCode,
    FieldValue numericCodeFieldValue,
    String? flag,
    FieldValue flagFieldValue,
    double? longitude,
    FieldValue longitudeFieldValue,
    double? latitude,
    FieldValue latitudeFieldValue,
    String? currencycode,
    FieldValue currencycodeFieldValue,
    String? currencyname,
    FieldValue currencynameFieldValue,
    String? currencysymbol,
    FieldValue currencysymbolFieldValue,
    String? langiso6391,
    FieldValue langiso6391FieldValue,
    String? langname,
    FieldValue langnameFieldValue,
    DateTime? arrivaldate,
    FieldValue arrivaldateFieldValue,
    DateTime? departuredate,
    FieldValue departuredateFieldValue,
  });
}

class _$CurrentCountryDocumentReference extends FirestoreDocumentReference<
    CurrentCountry,
    CurrentCountryDocumentSnapshot> implements CurrentCountryDocumentReference {
  _$CurrentCountryDocumentReference(this.reference);

  @override
  final DocumentReference<CurrentCountry> reference;

  /// A reference to the [CurrentCountryCollectionReference] containing this document.
  CurrentCountryCollectionReference get parent {
    return _$CurrentCountryCollectionReference(
      reference.parent.parent!.withConverter<CurrentUser>(
        fromFirestore: CurrentUserCollectionReference.fromFirestore,
        toFirestore: CurrentUserCollectionReference.toFirestore,
      ),
    );
  }

  late final RegionCollectionReference region = _$RegionCollectionReference(
    reference,
  );

  @override
  Stream<CurrentCountryDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CurrentCountryDocumentSnapshot._);
  }

  @override
  Future<CurrentCountryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CurrentCountryDocumentSnapshot._);
  }

  @override
  Future<CurrentCountryDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(CurrentCountryDocumentSnapshot._);
  }

  Future<void> update({
    Object? countryName = _sentinel,
    FieldValue? countryNameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? alpha3code = _sentinel,
    FieldValue? alpha3codeFieldValue,
    Object? callingcode = _sentinel,
    FieldValue? callingcodeFieldValue,
    Object? capital = _sentinel,
    FieldValue? capitalFieldValue,
    Object? subregion = _sentinel,
    FieldValue? subregionFieldValue,
    Object? region = _sentinel,
    FieldValue? regionFieldValue,
    Object? population = _sentinel,
    FieldValue? populationFieldValue,
    Object? timezones = _sentinel,
    FieldValue? timezonesFieldValue,
    Object? numericCode = _sentinel,
    FieldValue? numericCodeFieldValue,
    Object? flag = _sentinel,
    FieldValue? flagFieldValue,
    Object? longitude = _sentinel,
    FieldValue? longitudeFieldValue,
    Object? latitude = _sentinel,
    FieldValue? latitudeFieldValue,
    Object? currencycode = _sentinel,
    FieldValue? currencycodeFieldValue,
    Object? currencyname = _sentinel,
    FieldValue? currencynameFieldValue,
    Object? currencysymbol = _sentinel,
    FieldValue? currencysymbolFieldValue,
    Object? langiso6391 = _sentinel,
    FieldValue? langiso6391FieldValue,
    Object? langname = _sentinel,
    FieldValue? langnameFieldValue,
    Object? arrivaldate = _sentinel,
    FieldValue? arrivaldateFieldValue,
    Object? departuredate = _sentinel,
    FieldValue? departuredateFieldValue,
  }) async {
    assert(
      countryName == _sentinel || countryNameFieldValue == null,
      "Cannot specify both countryName and countryNameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      alpha3code == _sentinel || alpha3codeFieldValue == null,
      "Cannot specify both alpha3code and alpha3codeFieldValue",
    );
    assert(
      callingcode == _sentinel || callingcodeFieldValue == null,
      "Cannot specify both callingcode and callingcodeFieldValue",
    );
    assert(
      capital == _sentinel || capitalFieldValue == null,
      "Cannot specify both capital and capitalFieldValue",
    );
    assert(
      subregion == _sentinel || subregionFieldValue == null,
      "Cannot specify both subregion and subregionFieldValue",
    );
    assert(
      region == _sentinel || regionFieldValue == null,
      "Cannot specify both region and regionFieldValue",
    );
    assert(
      population == _sentinel || populationFieldValue == null,
      "Cannot specify both population and populationFieldValue",
    );
    assert(
      timezones == _sentinel || timezonesFieldValue == null,
      "Cannot specify both timezones and timezonesFieldValue",
    );
    assert(
      numericCode == _sentinel || numericCodeFieldValue == null,
      "Cannot specify both numericCode and numericCodeFieldValue",
    );
    assert(
      flag == _sentinel || flagFieldValue == null,
      "Cannot specify both flag and flagFieldValue",
    );
    assert(
      longitude == _sentinel || longitudeFieldValue == null,
      "Cannot specify both longitude and longitudeFieldValue",
    );
    assert(
      latitude == _sentinel || latitudeFieldValue == null,
      "Cannot specify both latitude and latitudeFieldValue",
    );
    assert(
      currencycode == _sentinel || currencycodeFieldValue == null,
      "Cannot specify both currencycode and currencycodeFieldValue",
    );
    assert(
      currencyname == _sentinel || currencynameFieldValue == null,
      "Cannot specify both currencyname and currencynameFieldValue",
    );
    assert(
      currencysymbol == _sentinel || currencysymbolFieldValue == null,
      "Cannot specify both currencysymbol and currencysymbolFieldValue",
    );
    assert(
      langiso6391 == _sentinel || langiso6391FieldValue == null,
      "Cannot specify both langiso6391 and langiso6391FieldValue",
    );
    assert(
      langname == _sentinel || langnameFieldValue == null,
      "Cannot specify both langname and langnameFieldValue",
    );
    assert(
      arrivaldate == _sentinel || arrivaldateFieldValue == null,
      "Cannot specify both arrivaldate and arrivaldateFieldValue",
    );
    assert(
      departuredate == _sentinel || departuredateFieldValue == null,
      "Cannot specify both departuredate and departuredateFieldValue",
    );
    final json = {
      if (countryName != _sentinel)
        _$CurrentCountryFieldMap['countryName']!: countryName as String?,
      if (countryNameFieldValue != null)
        _$CurrentCountryFieldMap['countryName']!: countryNameFieldValue,
      if (userId != _sentinel)
        _$CurrentCountryFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$CurrentCountryFieldMap['userId']!: userIdFieldValue,
      if (alpha3code != _sentinel)
        _$CurrentCountryFieldMap['alpha3code']!: alpha3code as String?,
      if (alpha3codeFieldValue != null)
        _$CurrentCountryFieldMap['alpha3code']!: alpha3codeFieldValue,
      if (callingcode != _sentinel)
        _$CurrentCountryFieldMap['callingcode']!: callingcode as String?,
      if (callingcodeFieldValue != null)
        _$CurrentCountryFieldMap['callingcode']!: callingcodeFieldValue,
      if (capital != _sentinel)
        _$CurrentCountryFieldMap['capital']!: capital as String?,
      if (capitalFieldValue != null)
        _$CurrentCountryFieldMap['capital']!: capitalFieldValue,
      if (subregion != _sentinel)
        _$CurrentCountryFieldMap['subregion']!: subregion as String?,
      if (subregionFieldValue != null)
        _$CurrentCountryFieldMap['subregion']!: subregionFieldValue,
      if (region != _sentinel)
        _$CurrentCountryFieldMap['region']!: region as String?,
      if (regionFieldValue != null)
        _$CurrentCountryFieldMap['region']!: regionFieldValue,
      if (population != _sentinel)
        _$CurrentCountryFieldMap['population']!: population as int?,
      if (populationFieldValue != null)
        _$CurrentCountryFieldMap['population']!: populationFieldValue,
      if (timezones != _sentinel)
        _$CurrentCountryFieldMap['timezones']!: timezones as String?,
      if (timezonesFieldValue != null)
        _$CurrentCountryFieldMap['timezones']!: timezonesFieldValue,
      if (numericCode != _sentinel)
        _$CurrentCountryFieldMap['numericCode']!: numericCode as String?,
      if (numericCodeFieldValue != null)
        _$CurrentCountryFieldMap['numericCode']!: numericCodeFieldValue,
      if (flag != _sentinel) _$CurrentCountryFieldMap['flag']!: flag as String?,
      if (flagFieldValue != null)
        _$CurrentCountryFieldMap['flag']!: flagFieldValue,
      if (longitude != _sentinel)
        _$CurrentCountryFieldMap['longitude']!: longitude as double?,
      if (longitudeFieldValue != null)
        _$CurrentCountryFieldMap['longitude']!: longitudeFieldValue,
      if (latitude != _sentinel)
        _$CurrentCountryFieldMap['latitude']!: latitude as double?,
      if (latitudeFieldValue != null)
        _$CurrentCountryFieldMap['latitude']!: latitudeFieldValue,
      if (currencycode != _sentinel)
        _$CurrentCountryFieldMap['currencycode']!: currencycode as String?,
      if (currencycodeFieldValue != null)
        _$CurrentCountryFieldMap['currencycode']!: currencycodeFieldValue,
      if (currencyname != _sentinel)
        _$CurrentCountryFieldMap['currencyname']!: currencyname as String?,
      if (currencynameFieldValue != null)
        _$CurrentCountryFieldMap['currencyname']!: currencynameFieldValue,
      if (currencysymbol != _sentinel)
        _$CurrentCountryFieldMap['currencysymbol']!: currencysymbol as String?,
      if (currencysymbolFieldValue != null)
        _$CurrentCountryFieldMap['currencysymbol']!: currencysymbolFieldValue,
      if (langiso6391 != _sentinel)
        _$CurrentCountryFieldMap['langiso6391']!: langiso6391 as String?,
      if (langiso6391FieldValue != null)
        _$CurrentCountryFieldMap['langiso6391']!: langiso6391FieldValue,
      if (langname != _sentinel)
        _$CurrentCountryFieldMap['langname']!: langname as String?,
      if (langnameFieldValue != null)
        _$CurrentCountryFieldMap['langname']!: langnameFieldValue,
      if (arrivaldate != _sentinel)
        _$CurrentCountryFieldMap['arrivaldate']!: arrivaldate as DateTime?,
      if (arrivaldateFieldValue != null)
        _$CurrentCountryFieldMap['arrivaldate']!: arrivaldateFieldValue,
      if (departuredate != _sentinel)
        _$CurrentCountryFieldMap['departuredate']!: departuredate as DateTime?,
      if (departuredateFieldValue != null)
        _$CurrentCountryFieldMap['departuredate']!: departuredateFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? countryName = _sentinel,
    FieldValue? countryNameFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? alpha3code = _sentinel,
    FieldValue? alpha3codeFieldValue,
    Object? callingcode = _sentinel,
    FieldValue? callingcodeFieldValue,
    Object? capital = _sentinel,
    FieldValue? capitalFieldValue,
    Object? subregion = _sentinel,
    FieldValue? subregionFieldValue,
    Object? region = _sentinel,
    FieldValue? regionFieldValue,
    Object? population = _sentinel,
    FieldValue? populationFieldValue,
    Object? timezones = _sentinel,
    FieldValue? timezonesFieldValue,
    Object? numericCode = _sentinel,
    FieldValue? numericCodeFieldValue,
    Object? flag = _sentinel,
    FieldValue? flagFieldValue,
    Object? longitude = _sentinel,
    FieldValue? longitudeFieldValue,
    Object? latitude = _sentinel,
    FieldValue? latitudeFieldValue,
    Object? currencycode = _sentinel,
    FieldValue? currencycodeFieldValue,
    Object? currencyname = _sentinel,
    FieldValue? currencynameFieldValue,
    Object? currencysymbol = _sentinel,
    FieldValue? currencysymbolFieldValue,
    Object? langiso6391 = _sentinel,
    FieldValue? langiso6391FieldValue,
    Object? langname = _sentinel,
    FieldValue? langnameFieldValue,
    Object? arrivaldate = _sentinel,
    FieldValue? arrivaldateFieldValue,
    Object? departuredate = _sentinel,
    FieldValue? departuredateFieldValue,
  }) {
    assert(
      countryName == _sentinel || countryNameFieldValue == null,
      "Cannot specify both countryName and countryNameFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      alpha3code == _sentinel || alpha3codeFieldValue == null,
      "Cannot specify both alpha3code and alpha3codeFieldValue",
    );
    assert(
      callingcode == _sentinel || callingcodeFieldValue == null,
      "Cannot specify both callingcode and callingcodeFieldValue",
    );
    assert(
      capital == _sentinel || capitalFieldValue == null,
      "Cannot specify both capital and capitalFieldValue",
    );
    assert(
      subregion == _sentinel || subregionFieldValue == null,
      "Cannot specify both subregion and subregionFieldValue",
    );
    assert(
      region == _sentinel || regionFieldValue == null,
      "Cannot specify both region and regionFieldValue",
    );
    assert(
      population == _sentinel || populationFieldValue == null,
      "Cannot specify both population and populationFieldValue",
    );
    assert(
      timezones == _sentinel || timezonesFieldValue == null,
      "Cannot specify both timezones and timezonesFieldValue",
    );
    assert(
      numericCode == _sentinel || numericCodeFieldValue == null,
      "Cannot specify both numericCode and numericCodeFieldValue",
    );
    assert(
      flag == _sentinel || flagFieldValue == null,
      "Cannot specify both flag and flagFieldValue",
    );
    assert(
      longitude == _sentinel || longitudeFieldValue == null,
      "Cannot specify both longitude and longitudeFieldValue",
    );
    assert(
      latitude == _sentinel || latitudeFieldValue == null,
      "Cannot specify both latitude and latitudeFieldValue",
    );
    assert(
      currencycode == _sentinel || currencycodeFieldValue == null,
      "Cannot specify both currencycode and currencycodeFieldValue",
    );
    assert(
      currencyname == _sentinel || currencynameFieldValue == null,
      "Cannot specify both currencyname and currencynameFieldValue",
    );
    assert(
      currencysymbol == _sentinel || currencysymbolFieldValue == null,
      "Cannot specify both currencysymbol and currencysymbolFieldValue",
    );
    assert(
      langiso6391 == _sentinel || langiso6391FieldValue == null,
      "Cannot specify both langiso6391 and langiso6391FieldValue",
    );
    assert(
      langname == _sentinel || langnameFieldValue == null,
      "Cannot specify both langname and langnameFieldValue",
    );
    assert(
      arrivaldate == _sentinel || arrivaldateFieldValue == null,
      "Cannot specify both arrivaldate and arrivaldateFieldValue",
    );
    assert(
      departuredate == _sentinel || departuredateFieldValue == null,
      "Cannot specify both departuredate and departuredateFieldValue",
    );
    final json = {
      if (countryName != _sentinel)
        _$CurrentCountryFieldMap['countryName']!: countryName as String?,
      if (countryNameFieldValue != null)
        _$CurrentCountryFieldMap['countryName']!: countryNameFieldValue,
      if (userId != _sentinel)
        _$CurrentCountryFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$CurrentCountryFieldMap['userId']!: userIdFieldValue,
      if (alpha3code != _sentinel)
        _$CurrentCountryFieldMap['alpha3code']!: alpha3code as String?,
      if (alpha3codeFieldValue != null)
        _$CurrentCountryFieldMap['alpha3code']!: alpha3codeFieldValue,
      if (callingcode != _sentinel)
        _$CurrentCountryFieldMap['callingcode']!: callingcode as String?,
      if (callingcodeFieldValue != null)
        _$CurrentCountryFieldMap['callingcode']!: callingcodeFieldValue,
      if (capital != _sentinel)
        _$CurrentCountryFieldMap['capital']!: capital as String?,
      if (capitalFieldValue != null)
        _$CurrentCountryFieldMap['capital']!: capitalFieldValue,
      if (subregion != _sentinel)
        _$CurrentCountryFieldMap['subregion']!: subregion as String?,
      if (subregionFieldValue != null)
        _$CurrentCountryFieldMap['subregion']!: subregionFieldValue,
      if (region != _sentinel)
        _$CurrentCountryFieldMap['region']!: region as String?,
      if (regionFieldValue != null)
        _$CurrentCountryFieldMap['region']!: regionFieldValue,
      if (population != _sentinel)
        _$CurrentCountryFieldMap['population']!: population as int?,
      if (populationFieldValue != null)
        _$CurrentCountryFieldMap['population']!: populationFieldValue,
      if (timezones != _sentinel)
        _$CurrentCountryFieldMap['timezones']!: timezones as String?,
      if (timezonesFieldValue != null)
        _$CurrentCountryFieldMap['timezones']!: timezonesFieldValue,
      if (numericCode != _sentinel)
        _$CurrentCountryFieldMap['numericCode']!: numericCode as String?,
      if (numericCodeFieldValue != null)
        _$CurrentCountryFieldMap['numericCode']!: numericCodeFieldValue,
      if (flag != _sentinel) _$CurrentCountryFieldMap['flag']!: flag as String?,
      if (flagFieldValue != null)
        _$CurrentCountryFieldMap['flag']!: flagFieldValue,
      if (longitude != _sentinel)
        _$CurrentCountryFieldMap['longitude']!: longitude as double?,
      if (longitudeFieldValue != null)
        _$CurrentCountryFieldMap['longitude']!: longitudeFieldValue,
      if (latitude != _sentinel)
        _$CurrentCountryFieldMap['latitude']!: latitude as double?,
      if (latitudeFieldValue != null)
        _$CurrentCountryFieldMap['latitude']!: latitudeFieldValue,
      if (currencycode != _sentinel)
        _$CurrentCountryFieldMap['currencycode']!: currencycode as String?,
      if (currencycodeFieldValue != null)
        _$CurrentCountryFieldMap['currencycode']!: currencycodeFieldValue,
      if (currencyname != _sentinel)
        _$CurrentCountryFieldMap['currencyname']!: currencyname as String?,
      if (currencynameFieldValue != null)
        _$CurrentCountryFieldMap['currencyname']!: currencynameFieldValue,
      if (currencysymbol != _sentinel)
        _$CurrentCountryFieldMap['currencysymbol']!: currencysymbol as String?,
      if (currencysymbolFieldValue != null)
        _$CurrentCountryFieldMap['currencysymbol']!: currencysymbolFieldValue,
      if (langiso6391 != _sentinel)
        _$CurrentCountryFieldMap['langiso6391']!: langiso6391 as String?,
      if (langiso6391FieldValue != null)
        _$CurrentCountryFieldMap['langiso6391']!: langiso6391FieldValue,
      if (langname != _sentinel)
        _$CurrentCountryFieldMap['langname']!: langname as String?,
      if (langnameFieldValue != null)
        _$CurrentCountryFieldMap['langname']!: langnameFieldValue,
      if (arrivaldate != _sentinel)
        _$CurrentCountryFieldMap['arrivaldate']!: arrivaldate as DateTime?,
      if (arrivaldateFieldValue != null)
        _$CurrentCountryFieldMap['arrivaldate']!: arrivaldateFieldValue,
      if (departuredate != _sentinel)
        _$CurrentCountryFieldMap['departuredate']!: departuredate as DateTime?,
      if (departuredateFieldValue != null)
        _$CurrentCountryFieldMap['departuredate']!: departuredateFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentCountryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CurrentCountryQuery
    implements QueryReference<CurrentCountry, CurrentCountryQuerySnapshot> {
  @override
  CurrentCountryQuery limit(int limit);

  @override
  CurrentCountryQuery limitToLast(int limit);

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
  CurrentCountryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
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
  CurrentCountryQuery whereFieldPath(
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

  CurrentCountryQuery whereDocumentId({
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
  CurrentCountryQuery whereCountryName({
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
  CurrentCountryQuery whereUserId({
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
  CurrentCountryQuery whereAlpha3code({
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
  CurrentCountryQuery whereCallingcode({
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
  CurrentCountryQuery whereCapital({
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
  CurrentCountryQuery whereSubregion({
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
  CurrentCountryQuery whereRegion({
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
  CurrentCountryQuery wherePopulation({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  CurrentCountryQuery whereTimezones({
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
  CurrentCountryQuery whereNumericCode({
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
  CurrentCountryQuery whereFlag({
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
  CurrentCountryQuery whereLongitude({
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
  CurrentCountryQuery whereLatitude({
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
  CurrentCountryQuery whereCurrencycode({
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
  CurrentCountryQuery whereCurrencyname({
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
  CurrentCountryQuery whereCurrencysymbol({
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
  CurrentCountryQuery whereLangiso6391({
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
  CurrentCountryQuery whereLangname({
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
  CurrentCountryQuery whereArrivaldate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  CurrentCountryQuery whereDeparturedate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });

  CurrentCountryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByCountryName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByAlpha3code({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByCallingcode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByCapital({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderBySubregion({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByRegion({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByPopulation({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByTimezones({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByNumericCode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByFlag({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByLongitude({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByLatitude({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByCurrencycode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByCurrencyname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByCurrencysymbol({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByLangiso6391({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByLangname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByArrivaldate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });

  CurrentCountryQuery orderByDeparturedate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  });
}

class _$CurrentCountryQuery
    extends QueryReference<CurrentCountry, CurrentCountryQuerySnapshot>
    implements CurrentCountryQuery {
  _$CurrentCountryQuery(
    this._collection, {
    required Query<CurrentCountry> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CurrentCountryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(CurrentCountryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CurrentCountryQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CurrentCountryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CurrentCountryQuery limit(int limit) {
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CurrentCountryQuery limitToLast(int limit) {
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  CurrentCountryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery whereFieldPath(
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
    return _$CurrentCountryQuery(
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

  CurrentCountryQuery whereDocumentId({
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
    return _$CurrentCountryQuery(
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

  CurrentCountryQuery whereCountryName({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['countryName']!,
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

  CurrentCountryQuery whereUserId({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['userId']!,
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

  CurrentCountryQuery whereAlpha3code({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['alpha3code']!,
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

  CurrentCountryQuery whereCallingcode({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['callingcode']!,
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

  CurrentCountryQuery whereCapital({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['capital']!,
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

  CurrentCountryQuery whereSubregion({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['subregion']!,
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

  CurrentCountryQuery whereRegion({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['region']!,
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

  CurrentCountryQuery wherePopulation({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['population']!,
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

  CurrentCountryQuery whereTimezones({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['timezones']!,
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

  CurrentCountryQuery whereNumericCode({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['numericCode']!,
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

  CurrentCountryQuery whereFlag({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['flag']!,
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

  CurrentCountryQuery whereLongitude({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['longitude']!,
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

  CurrentCountryQuery whereLatitude({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['latitude']!,
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

  CurrentCountryQuery whereCurrencycode({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['currencycode']!,
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

  CurrentCountryQuery whereCurrencyname({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['currencyname']!,
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

  CurrentCountryQuery whereCurrencysymbol({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['currencysymbol']!,
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

  CurrentCountryQuery whereLangiso6391({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['langiso6391']!,
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

  CurrentCountryQuery whereLangname({
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
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['langname']!,
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

  CurrentCountryQuery whereArrivaldate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['arrivaldate']!,
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

  CurrentCountryQuery whereDeparturedate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CurrentCountryFieldMap['departuredate']!,
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

  CurrentCountryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByCountryName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['countryName']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentCountryFieldMap['userId']!, descending: descending);
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByAlpha3code({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['alpha3code']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByCallingcode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['callingcode']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByCapital({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentCountryFieldMap['capital']!, descending: descending);
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderBySubregion({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['subregion']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByRegion({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentCountryFieldMap['region']!, descending: descending);
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByPopulation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['population']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByTimezones({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['timezones']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByNumericCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['numericCode']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByFlag({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentCountryFieldMap['flag']!, descending: descending);
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByLongitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['longitude']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByLatitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentCountryFieldMap['latitude']!, descending: descending);
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByCurrencycode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['currencycode']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByCurrencyname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['currencyname']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByCurrencysymbol({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['currencysymbol']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByLangiso6391({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['langiso6391']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByLangname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CurrentCountryFieldMap['langname']!, descending: descending);
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByArrivaldate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['arrivaldate']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CurrentCountryQuery orderByDeparturedate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CurrentCountryDocumentSnapshot? startAtDocument,
    CurrentCountryDocumentSnapshot? endAtDocument,
    CurrentCountryDocumentSnapshot? endBeforeDocument,
    CurrentCountryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$CurrentCountryFieldMap['departuredate']!,
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

    return _$CurrentCountryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CurrentCountryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CurrentCountryDocumentSnapshot
    extends FirestoreDocumentSnapshot<CurrentCountry> {
  CurrentCountryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CurrentCountry> snapshot;

  @override
  CurrentCountryDocumentReference get reference {
    return CurrentCountryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CurrentCountry? data;
}

class CurrentCountryQuerySnapshot extends FirestoreQuerySnapshot<CurrentCountry,
    CurrentCountryQueryDocumentSnapshot> {
  CurrentCountryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CurrentCountryQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CurrentCountry> snapshot,
  ) {
    final docs =
        snapshot.docs.map(CurrentCountryQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CurrentCountryDocumentSnapshot._,
      );
    }).toList();

    return CurrentCountryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CurrentCountryDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CurrentCountryDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CurrentCountryDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CurrentCountry> snapshot;

  @override
  final List<CurrentCountryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CurrentCountryDocumentSnapshot>>
      docChanges;
}

class CurrentCountryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<CurrentCountry>
    implements CurrentCountryDocumentSnapshot {
  CurrentCountryQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CurrentCountry> snapshot;

  @override
  final CurrentCountry data;

  @override
  CurrentCountryDocumentReference get reference {
    return CurrentCountryDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RegionCollectionReference
    implements
        RegionQuery,
        FirestoreCollectionReference<Region, RegionQuerySnapshot> {
  factory RegionCollectionReference(
    DocumentReference<CurrentCountry> parent,
  ) = _$RegionCollectionReference;

  static Region fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Region.fromJson({'regionCode': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Region value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('regionCode');
  }

  @override
  CollectionReference<Region> get reference;

  /// A reference to the containing [CurrentCountryDocumentReference] if this is a subcollection.
  CurrentCountryDocumentReference get parent;

  @override
  RegionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RegionDocumentReference> add(Region value);
}

class _$RegionCollectionReference extends _$RegionQuery
    implements RegionCollectionReference {
  factory _$RegionCollectionReference(
    DocumentReference<CurrentCountry> parent,
  ) {
    return _$RegionCollectionReference._(
      CurrentCountryDocumentReference(parent),
      parent.collection('region').withConverter(
            fromFirestore: RegionCollectionReference.fromFirestore,
            toFirestore: RegionCollectionReference.toFirestore,
          ),
    );
  }

  _$RegionCollectionReference._(
    this.parent,
    CollectionReference<Region> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final CurrentCountryDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Region> get reference =>
      super.reference as CollectionReference<Region>;

  @override
  RegionDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RegionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RegionDocumentReference> add(Region value) {
    return reference.add(value).then((ref) => RegionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RegionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RegionDocumentReference
    extends FirestoreDocumentReference<Region, RegionDocumentSnapshot> {
  factory RegionDocumentReference(DocumentReference<Region> reference) =
      _$RegionDocumentReference;

  DocumentReference<Region> get reference;

  /// A reference to the [RegionCollectionReference] containing this document.
  RegionCollectionReference get parent {
    return _$RegionCollectionReference(
      reference.parent.parent!.withConverter<CurrentCountry>(
        fromFirestore: CurrentCountryCollectionReference.fromFirestore,
        toFirestore: CurrentCountryCollectionReference.toFirestore,
      ),
    );
  }

  late final PlaceHistoryCollectionReference placehistory =
      _$PlaceHistoryCollectionReference(
    reference,
  );

  @override
  Stream<RegionDocumentSnapshot> snapshots();

  @override
  Future<RegionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? region,
    FieldValue regionFieldValue,
    String? countryCode,
    FieldValue countryCodeFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? region,
    FieldValue regionFieldValue,
    String? countryCode,
    FieldValue countryCodeFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
  });
}

class _$RegionDocumentReference
    extends FirestoreDocumentReference<Region, RegionDocumentSnapshot>
    implements RegionDocumentReference {
  _$RegionDocumentReference(this.reference);

  @override
  final DocumentReference<Region> reference;

  /// A reference to the [RegionCollectionReference] containing this document.
  RegionCollectionReference get parent {
    return _$RegionCollectionReference(
      reference.parent.parent!.withConverter<CurrentCountry>(
        fromFirestore: CurrentCountryCollectionReference.fromFirestore,
        toFirestore: CurrentCountryCollectionReference.toFirestore,
      ),
    );
  }

  late final PlaceHistoryCollectionReference placehistory =
      _$PlaceHistoryCollectionReference(
    reference,
  );

  @override
  Stream<RegionDocumentSnapshot> snapshots() {
    return reference.snapshots().map(RegionDocumentSnapshot._);
  }

  @override
  Future<RegionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RegionDocumentSnapshot._);
  }

  @override
  Future<RegionDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RegionDocumentSnapshot._);
  }

  Future<void> update({
    Object? region = _sentinel,
    FieldValue? regionFieldValue,
    Object? countryCode = _sentinel,
    FieldValue? countryCodeFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
  }) async {
    assert(
      region == _sentinel || regionFieldValue == null,
      "Cannot specify both region and regionFieldValue",
    );
    assert(
      countryCode == _sentinel || countryCodeFieldValue == null,
      "Cannot specify both countryCode and countryCodeFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    final json = {
      if (region != _sentinel) _$RegionFieldMap['region']!: region as String?,
      if (regionFieldValue != null)
        _$RegionFieldMap['region']!: regionFieldValue,
      if (countryCode != _sentinel)
        _$RegionFieldMap['countryCode']!: countryCode as String?,
      if (countryCodeFieldValue != null)
        _$RegionFieldMap['countryCode']!: countryCodeFieldValue,
      if (userId != _sentinel) _$RegionFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$RegionFieldMap['userId']!: userIdFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? region = _sentinel,
    FieldValue? regionFieldValue,
    Object? countryCode = _sentinel,
    FieldValue? countryCodeFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
  }) {
    assert(
      region == _sentinel || regionFieldValue == null,
      "Cannot specify both region and regionFieldValue",
    );
    assert(
      countryCode == _sentinel || countryCodeFieldValue == null,
      "Cannot specify both countryCode and countryCodeFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    final json = {
      if (region != _sentinel) _$RegionFieldMap['region']!: region as String?,
      if (regionFieldValue != null)
        _$RegionFieldMap['region']!: regionFieldValue,
      if (countryCode != _sentinel)
        _$RegionFieldMap['countryCode']!: countryCode as String?,
      if (countryCodeFieldValue != null)
        _$RegionFieldMap['countryCode']!: countryCodeFieldValue,
      if (userId != _sentinel) _$RegionFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$RegionFieldMap['userId']!: userIdFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is RegionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class RegionQuery
    implements QueryReference<Region, RegionQuerySnapshot> {
  @override
  RegionQuery limit(int limit);

  @override
  RegionQuery limitToLast(int limit);

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
  RegionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
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
  RegionQuery whereFieldPath(
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

  RegionQuery whereDocumentId({
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
  RegionQuery whereRegion({
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
  RegionQuery whereCountryCode({
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
  RegionQuery whereUserId({
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

  RegionQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  });

  RegionQuery orderByRegion({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  });

  RegionQuery orderByCountryCode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  });

  RegionQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  });
}

class _$RegionQuery extends QueryReference<Region, RegionQuerySnapshot>
    implements RegionQuery {
  _$RegionQuery(
    this._collection, {
    required Query<Region> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RegionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(RegionQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RegionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RegionQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RegionQuery limit(int limit) {
    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RegionQuery limitToLast(int limit) {
    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  RegionQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
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
    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RegionQuery whereFieldPath(
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
    return _$RegionQuery(
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

  RegionQuery whereDocumentId({
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
    return _$RegionQuery(
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

  RegionQuery whereRegion({
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
    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RegionFieldMap['region']!,
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

  RegionQuery whereCountryCode({
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
    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RegionFieldMap['countryCode']!,
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

  RegionQuery whereUserId({
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
    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$RegionFieldMap['userId']!,
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

  RegionQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
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

    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RegionQuery orderByRegion({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RegionFieldMap['region']!,
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

    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RegionQuery orderByCountryCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$RegionFieldMap['countryCode']!, descending: descending);
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

    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  RegionQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RegionDocumentSnapshot? startAtDocument,
    RegionDocumentSnapshot? endAtDocument,
    RegionDocumentSnapshot? endBeforeDocument,
    RegionDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$RegionFieldMap['userId']!,
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

    return _$RegionQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RegionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RegionDocumentSnapshot extends FirestoreDocumentSnapshot<Region> {
  RegionDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Region> snapshot;

  @override
  RegionDocumentReference get reference {
    return RegionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Region? data;
}

class RegionQuerySnapshot
    extends FirestoreQuerySnapshot<Region, RegionQueryDocumentSnapshot> {
  RegionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RegionQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Region> snapshot,
  ) {
    final docs = snapshot.docs.map(RegionQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RegionDocumentSnapshot._,
      );
    }).toList();

    return RegionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RegionDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RegionDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RegionDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Region> snapshot;

  @override
  final List<RegionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RegionDocumentSnapshot>> docChanges;
}

class RegionQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Region>
    implements RegionDocumentSnapshot {
  RegionQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Region> snapshot;

  @override
  final Region data;

  @override
  RegionDocumentReference get reference {
    return RegionDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PlaceHistoryCollectionReference
    implements
        PlaceHistoryQuery,
        FirestoreCollectionReference<PlaceHistory, PlaceHistoryQuerySnapshot> {
  factory PlaceHistoryCollectionReference(
    DocumentReference<Region> parent,
  ) = _$PlaceHistoryCollectionReference;

  static PlaceHistory fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return PlaceHistory.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    PlaceHistory value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<PlaceHistory> get reference;

  /// A reference to the containing [RegionDocumentReference] if this is a subcollection.
  RegionDocumentReference get parent;

  @override
  PlaceHistoryDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PlaceHistoryDocumentReference> add(PlaceHistory value);
}

class _$PlaceHistoryCollectionReference extends _$PlaceHistoryQuery
    implements PlaceHistoryCollectionReference {
  factory _$PlaceHistoryCollectionReference(
    DocumentReference<Region> parent,
  ) {
    return _$PlaceHistoryCollectionReference._(
      RegionDocumentReference(parent),
      parent.collection('placehistory').withConverter(
            fromFirestore: PlaceHistoryCollectionReference.fromFirestore,
            toFirestore: PlaceHistoryCollectionReference.toFirestore,
          ),
    );
  }

  _$PlaceHistoryCollectionReference._(
    this.parent,
    CollectionReference<PlaceHistory> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final RegionDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<PlaceHistory> get reference =>
      super.reference as CollectionReference<PlaceHistory>;

  @override
  PlaceHistoryDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PlaceHistoryDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PlaceHistoryDocumentReference> add(PlaceHistory value) {
    return reference
        .add(value)
        .then((ref) => PlaceHistoryDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlaceHistoryCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PlaceHistoryDocumentReference extends FirestoreDocumentReference<
    PlaceHistory, PlaceHistoryDocumentSnapshot> {
  factory PlaceHistoryDocumentReference(
          DocumentReference<PlaceHistory> reference) =
      _$PlaceHistoryDocumentReference;

  DocumentReference<PlaceHistory> get reference;

  /// A reference to the [PlaceHistoryCollectionReference] containing this document.
  PlaceHistoryCollectionReference get parent {
    return _$PlaceHistoryCollectionReference(
      reference.parent.parent!.withConverter<Region>(
        fromFirestore: RegionCollectionReference.fromFirestore,
        toFirestore: RegionCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<PlaceHistoryDocumentSnapshot> snapshots();

  @override
  Future<PlaceHistoryDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? name,
    FieldValue nameFieldValue,
    String? location,
    FieldValue locationFieldValue,
    double? latitude,
    FieldValue latitudeFieldValue,
    double? longitude,
    FieldValue longitudeFieldValue,
    double? distance,
    FieldValue distanceFieldValue,
    String? streetAddress,
    FieldValue streetAddressFieldValue,
    String? city,
    FieldValue cityFieldValue,
    String? countryName,
    FieldValue countryNameFieldValue,
    String? countryCode,
    FieldValue countryCodeFieldValue,
    String? postal,
    FieldValue postalFieldValue,
    String? region,
    FieldValue regionFieldValue,
    String? regionCode,
    FieldValue regionCodeFieldValue,
    String? timezone,
    FieldValue timezoneFieldValue,
    int? elevation,
    FieldValue elevationFieldValue,
    int? timestamp,
    FieldValue timestampFieldValue,
    DateTime? arrivaldate,
    FieldValue arrivaldateFieldValue,
    int? visitnumber,
    FieldValue visitnumberFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? name,
    FieldValue nameFieldValue,
    String? location,
    FieldValue locationFieldValue,
    double? latitude,
    FieldValue latitudeFieldValue,
    double? longitude,
    FieldValue longitudeFieldValue,
    double? distance,
    FieldValue distanceFieldValue,
    String? streetAddress,
    FieldValue streetAddressFieldValue,
    String? city,
    FieldValue cityFieldValue,
    String? countryName,
    FieldValue countryNameFieldValue,
    String? countryCode,
    FieldValue countryCodeFieldValue,
    String? postal,
    FieldValue postalFieldValue,
    String? region,
    FieldValue regionFieldValue,
    String? regionCode,
    FieldValue regionCodeFieldValue,
    String? timezone,
    FieldValue timezoneFieldValue,
    int? elevation,
    FieldValue elevationFieldValue,
    int? timestamp,
    FieldValue timestampFieldValue,
    DateTime? arrivaldate,
    FieldValue arrivaldateFieldValue,
    int? visitnumber,
    FieldValue visitnumberFieldValue,
    String? userId,
    FieldValue userIdFieldValue,
  });
}

class _$PlaceHistoryDocumentReference extends FirestoreDocumentReference<
    PlaceHistory,
    PlaceHistoryDocumentSnapshot> implements PlaceHistoryDocumentReference {
  _$PlaceHistoryDocumentReference(this.reference);

  @override
  final DocumentReference<PlaceHistory> reference;

  /// A reference to the [PlaceHistoryCollectionReference] containing this document.
  PlaceHistoryCollectionReference get parent {
    return _$PlaceHistoryCollectionReference(
      reference.parent.parent!.withConverter<Region>(
        fromFirestore: RegionCollectionReference.fromFirestore,
        toFirestore: RegionCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<PlaceHistoryDocumentSnapshot> snapshots() {
    return reference.snapshots().map(PlaceHistoryDocumentSnapshot._);
  }

  @override
  Future<PlaceHistoryDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(PlaceHistoryDocumentSnapshot._);
  }

  @override
  Future<PlaceHistoryDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(PlaceHistoryDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? latitude = _sentinel,
    FieldValue? latitudeFieldValue,
    Object? longitude = _sentinel,
    FieldValue? longitudeFieldValue,
    Object? distance = _sentinel,
    FieldValue? distanceFieldValue,
    Object? streetAddress = _sentinel,
    FieldValue? streetAddressFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? countryName = _sentinel,
    FieldValue? countryNameFieldValue,
    Object? countryCode = _sentinel,
    FieldValue? countryCodeFieldValue,
    Object? postal = _sentinel,
    FieldValue? postalFieldValue,
    Object? region = _sentinel,
    FieldValue? regionFieldValue,
    Object? regionCode = _sentinel,
    FieldValue? regionCodeFieldValue,
    Object? timezone = _sentinel,
    FieldValue? timezoneFieldValue,
    Object? elevation = _sentinel,
    FieldValue? elevationFieldValue,
    Object? timestamp = _sentinel,
    FieldValue? timestampFieldValue,
    Object? arrivaldate = _sentinel,
    FieldValue? arrivaldateFieldValue,
    Object? visitnumber = _sentinel,
    FieldValue? visitnumberFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      latitude == _sentinel || latitudeFieldValue == null,
      "Cannot specify both latitude and latitudeFieldValue",
    );
    assert(
      longitude == _sentinel || longitudeFieldValue == null,
      "Cannot specify both longitude and longitudeFieldValue",
    );
    assert(
      distance == _sentinel || distanceFieldValue == null,
      "Cannot specify both distance and distanceFieldValue",
    );
    assert(
      streetAddress == _sentinel || streetAddressFieldValue == null,
      "Cannot specify both streetAddress and streetAddressFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      countryName == _sentinel || countryNameFieldValue == null,
      "Cannot specify both countryName and countryNameFieldValue",
    );
    assert(
      countryCode == _sentinel || countryCodeFieldValue == null,
      "Cannot specify both countryCode and countryCodeFieldValue",
    );
    assert(
      postal == _sentinel || postalFieldValue == null,
      "Cannot specify both postal and postalFieldValue",
    );
    assert(
      region == _sentinel || regionFieldValue == null,
      "Cannot specify both region and regionFieldValue",
    );
    assert(
      regionCode == _sentinel || regionCodeFieldValue == null,
      "Cannot specify both regionCode and regionCodeFieldValue",
    );
    assert(
      timezone == _sentinel || timezoneFieldValue == null,
      "Cannot specify both timezone and timezoneFieldValue",
    );
    assert(
      elevation == _sentinel || elevationFieldValue == null,
      "Cannot specify both elevation and elevationFieldValue",
    );
    assert(
      timestamp == _sentinel || timestampFieldValue == null,
      "Cannot specify both timestamp and timestampFieldValue",
    );
    assert(
      arrivaldate == _sentinel || arrivaldateFieldValue == null,
      "Cannot specify both arrivaldate and arrivaldateFieldValue",
    );
    assert(
      visitnumber == _sentinel || visitnumberFieldValue == null,
      "Cannot specify both visitnumber and visitnumberFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    final json = {
      if (name != _sentinel) _$PlaceHistoryFieldMap['name']!: name as String?,
      if (nameFieldValue != null)
        _$PlaceHistoryFieldMap['name']!: nameFieldValue,
      if (location != _sentinel)
        _$PlaceHistoryFieldMap['location']!: location as String?,
      if (locationFieldValue != null)
        _$PlaceHistoryFieldMap['location']!: locationFieldValue,
      if (latitude != _sentinel)
        _$PlaceHistoryFieldMap['latitude']!: latitude as double?,
      if (latitudeFieldValue != null)
        _$PlaceHistoryFieldMap['latitude']!: latitudeFieldValue,
      if (longitude != _sentinel)
        _$PlaceHistoryFieldMap['longitude']!: longitude as double?,
      if (longitudeFieldValue != null)
        _$PlaceHistoryFieldMap['longitude']!: longitudeFieldValue,
      if (distance != _sentinel)
        _$PlaceHistoryFieldMap['distance']!: distance as double?,
      if (distanceFieldValue != null)
        _$PlaceHistoryFieldMap['distance']!: distanceFieldValue,
      if (streetAddress != _sentinel)
        _$PlaceHistoryFieldMap['streetAddress']!: streetAddress as String?,
      if (streetAddressFieldValue != null)
        _$PlaceHistoryFieldMap['streetAddress']!: streetAddressFieldValue,
      if (city != _sentinel) _$PlaceHistoryFieldMap['city']!: city as String?,
      if (cityFieldValue != null)
        _$PlaceHistoryFieldMap['city']!: cityFieldValue,
      if (countryName != _sentinel)
        _$PlaceHistoryFieldMap['countryName']!: countryName as String?,
      if (countryNameFieldValue != null)
        _$PlaceHistoryFieldMap['countryName']!: countryNameFieldValue,
      if (countryCode != _sentinel)
        _$PlaceHistoryFieldMap['countryCode']!: countryCode as String?,
      if (countryCodeFieldValue != null)
        _$PlaceHistoryFieldMap['countryCode']!: countryCodeFieldValue,
      if (postal != _sentinel)
        _$PlaceHistoryFieldMap['postal']!: postal as String?,
      if (postalFieldValue != null)
        _$PlaceHistoryFieldMap['postal']!: postalFieldValue,
      if (region != _sentinel)
        _$PlaceHistoryFieldMap['region']!: region as String?,
      if (regionFieldValue != null)
        _$PlaceHistoryFieldMap['region']!: regionFieldValue,
      if (regionCode != _sentinel)
        _$PlaceHistoryFieldMap['regionCode']!: regionCode as String?,
      if (regionCodeFieldValue != null)
        _$PlaceHistoryFieldMap['regionCode']!: regionCodeFieldValue,
      if (timezone != _sentinel)
        _$PlaceHistoryFieldMap['timezone']!: timezone as String?,
      if (timezoneFieldValue != null)
        _$PlaceHistoryFieldMap['timezone']!: timezoneFieldValue,
      if (elevation != _sentinel)
        _$PlaceHistoryFieldMap['elevation']!: elevation as int?,
      if (elevationFieldValue != null)
        _$PlaceHistoryFieldMap['elevation']!: elevationFieldValue,
      if (timestamp != _sentinel)
        _$PlaceHistoryFieldMap['timestamp']!: timestamp as int?,
      if (timestampFieldValue != null)
        _$PlaceHistoryFieldMap['timestamp']!: timestampFieldValue,
      if (arrivaldate != _sentinel)
        _$PlaceHistoryFieldMap['arrivaldate']!: arrivaldate as DateTime?,
      if (arrivaldateFieldValue != null)
        _$PlaceHistoryFieldMap['arrivaldate']!: arrivaldateFieldValue,
      if (visitnumber != _sentinel)
        _$PlaceHistoryFieldMap['visitnumber']!: visitnumber as int?,
      if (visitnumberFieldValue != null)
        _$PlaceHistoryFieldMap['visitnumber']!: visitnumberFieldValue,
      if (userId != _sentinel)
        _$PlaceHistoryFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$PlaceHistoryFieldMap['userId']!: userIdFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? latitude = _sentinel,
    FieldValue? latitudeFieldValue,
    Object? longitude = _sentinel,
    FieldValue? longitudeFieldValue,
    Object? distance = _sentinel,
    FieldValue? distanceFieldValue,
    Object? streetAddress = _sentinel,
    FieldValue? streetAddressFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? countryName = _sentinel,
    FieldValue? countryNameFieldValue,
    Object? countryCode = _sentinel,
    FieldValue? countryCodeFieldValue,
    Object? postal = _sentinel,
    FieldValue? postalFieldValue,
    Object? region = _sentinel,
    FieldValue? regionFieldValue,
    Object? regionCode = _sentinel,
    FieldValue? regionCodeFieldValue,
    Object? timezone = _sentinel,
    FieldValue? timezoneFieldValue,
    Object? elevation = _sentinel,
    FieldValue? elevationFieldValue,
    Object? timestamp = _sentinel,
    FieldValue? timestampFieldValue,
    Object? arrivaldate = _sentinel,
    FieldValue? arrivaldateFieldValue,
    Object? visitnumber = _sentinel,
    FieldValue? visitnumberFieldValue,
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      latitude == _sentinel || latitudeFieldValue == null,
      "Cannot specify both latitude and latitudeFieldValue",
    );
    assert(
      longitude == _sentinel || longitudeFieldValue == null,
      "Cannot specify both longitude and longitudeFieldValue",
    );
    assert(
      distance == _sentinel || distanceFieldValue == null,
      "Cannot specify both distance and distanceFieldValue",
    );
    assert(
      streetAddress == _sentinel || streetAddressFieldValue == null,
      "Cannot specify both streetAddress and streetAddressFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      countryName == _sentinel || countryNameFieldValue == null,
      "Cannot specify both countryName and countryNameFieldValue",
    );
    assert(
      countryCode == _sentinel || countryCodeFieldValue == null,
      "Cannot specify both countryCode and countryCodeFieldValue",
    );
    assert(
      postal == _sentinel || postalFieldValue == null,
      "Cannot specify both postal and postalFieldValue",
    );
    assert(
      region == _sentinel || regionFieldValue == null,
      "Cannot specify both region and regionFieldValue",
    );
    assert(
      regionCode == _sentinel || regionCodeFieldValue == null,
      "Cannot specify both regionCode and regionCodeFieldValue",
    );
    assert(
      timezone == _sentinel || timezoneFieldValue == null,
      "Cannot specify both timezone and timezoneFieldValue",
    );
    assert(
      elevation == _sentinel || elevationFieldValue == null,
      "Cannot specify both elevation and elevationFieldValue",
    );
    assert(
      timestamp == _sentinel || timestampFieldValue == null,
      "Cannot specify both timestamp and timestampFieldValue",
    );
    assert(
      arrivaldate == _sentinel || arrivaldateFieldValue == null,
      "Cannot specify both arrivaldate and arrivaldateFieldValue",
    );
    assert(
      visitnumber == _sentinel || visitnumberFieldValue == null,
      "Cannot specify both visitnumber and visitnumberFieldValue",
    );
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    final json = {
      if (name != _sentinel) _$PlaceHistoryFieldMap['name']!: name as String?,
      if (nameFieldValue != null)
        _$PlaceHistoryFieldMap['name']!: nameFieldValue,
      if (location != _sentinel)
        _$PlaceHistoryFieldMap['location']!: location as String?,
      if (locationFieldValue != null)
        _$PlaceHistoryFieldMap['location']!: locationFieldValue,
      if (latitude != _sentinel)
        _$PlaceHistoryFieldMap['latitude']!: latitude as double?,
      if (latitudeFieldValue != null)
        _$PlaceHistoryFieldMap['latitude']!: latitudeFieldValue,
      if (longitude != _sentinel)
        _$PlaceHistoryFieldMap['longitude']!: longitude as double?,
      if (longitudeFieldValue != null)
        _$PlaceHistoryFieldMap['longitude']!: longitudeFieldValue,
      if (distance != _sentinel)
        _$PlaceHistoryFieldMap['distance']!: distance as double?,
      if (distanceFieldValue != null)
        _$PlaceHistoryFieldMap['distance']!: distanceFieldValue,
      if (streetAddress != _sentinel)
        _$PlaceHistoryFieldMap['streetAddress']!: streetAddress as String?,
      if (streetAddressFieldValue != null)
        _$PlaceHistoryFieldMap['streetAddress']!: streetAddressFieldValue,
      if (city != _sentinel) _$PlaceHistoryFieldMap['city']!: city as String?,
      if (cityFieldValue != null)
        _$PlaceHistoryFieldMap['city']!: cityFieldValue,
      if (countryName != _sentinel)
        _$PlaceHistoryFieldMap['countryName']!: countryName as String?,
      if (countryNameFieldValue != null)
        _$PlaceHistoryFieldMap['countryName']!: countryNameFieldValue,
      if (countryCode != _sentinel)
        _$PlaceHistoryFieldMap['countryCode']!: countryCode as String?,
      if (countryCodeFieldValue != null)
        _$PlaceHistoryFieldMap['countryCode']!: countryCodeFieldValue,
      if (postal != _sentinel)
        _$PlaceHistoryFieldMap['postal']!: postal as String?,
      if (postalFieldValue != null)
        _$PlaceHistoryFieldMap['postal']!: postalFieldValue,
      if (region != _sentinel)
        _$PlaceHistoryFieldMap['region']!: region as String?,
      if (regionFieldValue != null)
        _$PlaceHistoryFieldMap['region']!: regionFieldValue,
      if (regionCode != _sentinel)
        _$PlaceHistoryFieldMap['regionCode']!: regionCode as String?,
      if (regionCodeFieldValue != null)
        _$PlaceHistoryFieldMap['regionCode']!: regionCodeFieldValue,
      if (timezone != _sentinel)
        _$PlaceHistoryFieldMap['timezone']!: timezone as String?,
      if (timezoneFieldValue != null)
        _$PlaceHistoryFieldMap['timezone']!: timezoneFieldValue,
      if (elevation != _sentinel)
        _$PlaceHistoryFieldMap['elevation']!: elevation as int?,
      if (elevationFieldValue != null)
        _$PlaceHistoryFieldMap['elevation']!: elevationFieldValue,
      if (timestamp != _sentinel)
        _$PlaceHistoryFieldMap['timestamp']!: timestamp as int?,
      if (timestampFieldValue != null)
        _$PlaceHistoryFieldMap['timestamp']!: timestampFieldValue,
      if (arrivaldate != _sentinel)
        _$PlaceHistoryFieldMap['arrivaldate']!: arrivaldate as DateTime?,
      if (arrivaldateFieldValue != null)
        _$PlaceHistoryFieldMap['arrivaldate']!: arrivaldateFieldValue,
      if (visitnumber != _sentinel)
        _$PlaceHistoryFieldMap['visitnumber']!: visitnumber as int?,
      if (visitnumberFieldValue != null)
        _$PlaceHistoryFieldMap['visitnumber']!: visitnumberFieldValue,
      if (userId != _sentinel)
        _$PlaceHistoryFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$PlaceHistoryFieldMap['userId']!: userIdFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaceHistoryDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class PlaceHistoryQuery
    implements QueryReference<PlaceHistory, PlaceHistoryQuerySnapshot> {
  @override
  PlaceHistoryQuery limit(int limit);

  @override
  PlaceHistoryQuery limitToLast(int limit);

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
  PlaceHistoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
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
  PlaceHistoryQuery whereFieldPath(
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

  PlaceHistoryQuery whereDocumentId({
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
  PlaceHistoryQuery whereName({
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
  PlaceHistoryQuery whereLocation({
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
  PlaceHistoryQuery whereLatitude({
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
  PlaceHistoryQuery whereLongitude({
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
  PlaceHistoryQuery whereDistance({
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
  PlaceHistoryQuery whereStreetAddress({
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
  PlaceHistoryQuery whereCity({
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
  PlaceHistoryQuery whereCountryName({
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
  PlaceHistoryQuery whereCountryCode({
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
  PlaceHistoryQuery wherePostal({
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
  PlaceHistoryQuery whereRegion({
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
  PlaceHistoryQuery whereRegionCode({
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
  PlaceHistoryQuery whereTimezone({
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
  PlaceHistoryQuery whereElevation({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  PlaceHistoryQuery whereTimestamp({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  PlaceHistoryQuery whereArrivaldate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  PlaceHistoryQuery whereVisitnumber({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  PlaceHistoryQuery whereUserId({
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

  PlaceHistoryQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByLocation({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByLatitude({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByLongitude({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByDistance({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByStreetAddress({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByCity({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByCountryName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByCountryCode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByPostal({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByRegion({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByRegionCode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByTimezone({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByElevation({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByTimestamp({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByArrivaldate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByVisitnumber({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });

  PlaceHistoryQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  });
}

class _$PlaceHistoryQuery
    extends QueryReference<PlaceHistory, PlaceHistoryQuerySnapshot>
    implements PlaceHistoryQuery {
  _$PlaceHistoryQuery(
    this._collection, {
    required Query<PlaceHistory> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<PlaceHistoryQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(PlaceHistoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<PlaceHistoryQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(PlaceHistoryQuerySnapshot._fromQuerySnapshot);
  }

  @override
  PlaceHistoryQuery limit(int limit) {
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  PlaceHistoryQuery limitToLast(int limit) {
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  PlaceHistoryQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery whereFieldPath(
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
    return _$PlaceHistoryQuery(
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

  PlaceHistoryQuery whereDocumentId({
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
    return _$PlaceHistoryQuery(
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

  PlaceHistoryQuery whereName({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['name']!,
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

  PlaceHistoryQuery whereLocation({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['location']!,
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

  PlaceHistoryQuery whereLatitude({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['latitude']!,
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

  PlaceHistoryQuery whereLongitude({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['longitude']!,
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

  PlaceHistoryQuery whereDistance({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['distance']!,
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

  PlaceHistoryQuery whereStreetAddress({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['streetAddress']!,
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

  PlaceHistoryQuery whereCity({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['city']!,
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

  PlaceHistoryQuery whereCountryName({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['countryName']!,
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

  PlaceHistoryQuery whereCountryCode({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['countryCode']!,
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

  PlaceHistoryQuery wherePostal({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['postal']!,
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

  PlaceHistoryQuery whereRegion({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['region']!,
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

  PlaceHistoryQuery whereRegionCode({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['regionCode']!,
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

  PlaceHistoryQuery whereTimezone({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['timezone']!,
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

  PlaceHistoryQuery whereElevation({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['elevation']!,
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

  PlaceHistoryQuery whereTimestamp({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['timestamp']!,
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

  PlaceHistoryQuery whereArrivaldate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['arrivaldate']!,
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

  PlaceHistoryQuery whereVisitnumber({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['visitnumber']!,
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

  PlaceHistoryQuery whereUserId({
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
    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$PlaceHistoryFieldMap['userId']!,
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

  PlaceHistoryQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['name']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['location']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByLatitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['latitude']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByLongitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['longitude']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByDistance({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['distance']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByStreetAddress({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlaceHistoryFieldMap['streetAddress']!,
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByCity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['city']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByCountryName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlaceHistoryFieldMap['countryName']!,
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByCountryCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlaceHistoryFieldMap['countryCode']!,
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByPostal({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['postal']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByRegion({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['region']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByRegionCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['regionCode']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByTimezone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['timezone']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByElevation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['elevation']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByTimestamp({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['timestamp']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByArrivaldate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlaceHistoryFieldMap['arrivaldate']!,
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByVisitnumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$PlaceHistoryFieldMap['visitnumber']!,
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  PlaceHistoryQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlaceHistoryDocumentSnapshot? startAtDocument,
    PlaceHistoryDocumentSnapshot? endAtDocument,
    PlaceHistoryDocumentSnapshot? endBeforeDocument,
    PlaceHistoryDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$PlaceHistoryFieldMap['userId']!, descending: descending);
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

    return _$PlaceHistoryQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlaceHistoryQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PlaceHistoryDocumentSnapshot
    extends FirestoreDocumentSnapshot<PlaceHistory> {
  PlaceHistoryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<PlaceHistory> snapshot;

  @override
  PlaceHistoryDocumentReference get reference {
    return PlaceHistoryDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final PlaceHistory? data;
}

class PlaceHistoryQuerySnapshot extends FirestoreQuerySnapshot<PlaceHistory,
    PlaceHistoryQueryDocumentSnapshot> {
  PlaceHistoryQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory PlaceHistoryQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<PlaceHistory> snapshot,
  ) {
    final docs =
        snapshot.docs.map(PlaceHistoryQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        PlaceHistoryDocumentSnapshot._,
      );
    }).toList();

    return PlaceHistoryQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<PlaceHistoryDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    PlaceHistoryDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<PlaceHistoryDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<PlaceHistory> snapshot;

  @override
  final List<PlaceHistoryQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PlaceHistoryDocumentSnapshot>> docChanges;
}

class PlaceHistoryQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<PlaceHistory>
    implements PlaceHistoryDocumentSnapshot {
  PlaceHistoryQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<PlaceHistory> snapshot;

  @override
  final PlaceHistory data;

  @override
  PlaceHistoryDocumentReference get reference {
    return PlaceHistoryDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) => CurrentUser(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      displayname: json['displayname'] as String?,
    );

const _$CurrentUserFieldMap = <String, String>{
  'id': 'id',
  'userId': 'userId',
  'email': 'email',
  'displayname': 'displayname',
};

Map<String, dynamic> _$CurrentUserToJson(CurrentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'displayname': instance.displayname,
    };

CurrentCountry _$CurrentCountryFromJson(Map<String, dynamic> json) =>
    CurrentCountry(
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String?,
      userId: json['userId'] as String?,
      alpha3code: json['alpha3code'] as String?,
      callingcode: json['callingcode'] as String?,
      capital: json['capital'] as String?,
      subregion: json['subregion'] as String?,
      region: json['region'] as String?,
      population: json['population'] as int?,
      timezones: json['timezones'] as String?,
      numericCode: json['numericCode'] as String?,
      flag: json['flag'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      currencycode: json['currencycode'] as String?,
      currencyname: json['currencyname'] as String?,
      currencysymbol: json['currencysymbol'] as String?,
      langiso6391: json['langiso6391'] as String?,
      langname: json['langname'] as String?,
      arrivaldate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['arrivaldate'], const FirestoreDateTimeConverter().fromJson),
      departuredate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['departuredate'], const FirestoreDateTimeConverter().fromJson),
    );

const _$CurrentCountryFieldMap = <String, String>{
  'countryCode': 'countryCode',
  'countryName': 'countryName',
  'userId': 'userId',
  'alpha3code': 'alpha3code',
  'callingcode': 'callingcode',
  'capital': 'capital',
  'subregion': 'subregion',
  'region': 'region',
  'population': 'population',
  'timezones': 'timezones',
  'numericCode': 'numericCode',
  'flag': 'flag',
  'longitude': 'longitude',
  'latitude': 'latitude',
  'currencycode': 'currencycode',
  'currencyname': 'currencyname',
  'currencysymbol': 'currencysymbol',
  'langiso6391': 'langiso6391',
  'langname': 'langname',
  'arrivaldate': 'arrivaldate',
  'departuredate': 'departuredate',
};

Map<String, dynamic> _$CurrentCountryToJson(CurrentCountry instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'userId': instance.userId,
      'alpha3code': instance.alpha3code,
      'callingcode': instance.callingcode,
      'capital': instance.capital,
      'subregion': instance.subregion,
      'region': instance.region,
      'population': instance.population,
      'timezones': instance.timezones,
      'numericCode': instance.numericCode,
      'flag': instance.flag,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'currencycode': instance.currencycode,
      'currencyname': instance.currencyname,
      'currencysymbol': instance.currencysymbol,
      'langiso6391': instance.langiso6391,
      'langname': instance.langname,
      'arrivaldate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.arrivaldate, const FirestoreDateTimeConverter().toJson),
      'departuredate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.departuredate, const FirestoreDateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      regionCode: json['regionCode'] as String,
      region: json['region'] as String?,
      countryCode: json['countryCode'] as String?,
      userId: json['userId'] as String?,
    );

const _$RegionFieldMap = <String, String>{
  'regionCode': 'regionCode',
  'region': 'region',
  'countryCode': 'countryCode',
  'userId': 'userId',
};

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'regionCode': instance.regionCode,
      'region': instance.region,
      'countryCode': instance.countryCode,
      'userId': instance.userId,
    };

PlaceHistory _$PlaceHistoryFromJson(Map<String, dynamic> json) => PlaceHistory(
      name: json['name'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      streetAddress: json['streetAddress'] as String?,
      city: json['city'] as String?,
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      postal: json['postal'] as String?,
      region: json['region'] as String?,
      regionCode: json['regionCode'] as String?,
      timezone: json['timezone'] as String?,
      elevation: json['elevation'] as int?,
      timestamp: json['timestamp'] as int?,
      arrivaldate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['arrivaldate'], const FirestoreDateTimeConverter().fromJson),
      visitnumber: json['visitnumber'] as int?,
      userId: json['userId'] as String?,
    );

const _$PlaceHistoryFieldMap = <String, String>{
  'name': 'name',
  'location': 'location',
  'latitude': 'latitude',
  'longitude': 'longitude',
  'distance': 'distance',
  'streetAddress': 'streetAddress',
  'city': 'city',
  'countryName': 'countryName',
  'countryCode': 'countryCode',
  'postal': 'postal',
  'region': 'region',
  'regionCode': 'regionCode',
  'timezone': 'timezone',
  'elevation': 'elevation',
  'timestamp': 'timestamp',
  'arrivaldate': 'arrivaldate',
  'visitnumber': 'visitnumber',
  'userId': 'userId',
};

Map<String, dynamic> _$PlaceHistoryToJson(PlaceHistory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distance': instance.distance,
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'postal': instance.postal,
      'region': instance.region,
      'regionCode': instance.regionCode,
      'timezone': instance.timezone,
      'elevation': instance.elevation,
      'timestamp': instance.timestamp,
      'arrivaldate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.arrivaldate, const FirestoreDateTimeConverter().toJson),
      'visitnumber': instance.visitnumber,
      'userId': instance.userId,
    };
