// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

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
abstract class UserProfileCollectionReference
    implements
        UserProfileQuery,
        FirestoreCollectionReference<UserProfile, UserProfileQuerySnapshot> {
  factory UserProfileCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserProfileCollectionReference;

  static UserProfile fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return UserProfile.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    UserProfile value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<UserProfile> get reference;

  @override
  UserProfileDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserProfileDocumentReference> add(UserProfile value);
}

class _$UserProfileCollectionReference extends _$UserProfileQuery
    implements UserProfileCollectionReference {
  factory _$UserProfileCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserProfileCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserProfileCollectionReference.fromFirestore,
            toFirestore: UserProfileCollectionReference.toFirestore,
          ),
    );
  }

  _$UserProfileCollectionReference._(
    CollectionReference<UserProfile> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserProfile> get reference =>
      super.reference as CollectionReference<UserProfile>;

  @override
  UserProfileDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserProfileDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserProfileDocumentReference> add(UserProfile value) {
    return reference
        .add(value)
        .then((ref) => UserProfileDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserProfileCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserProfileDocumentReference extends FirestoreDocumentReference<
    UserProfile, UserProfileDocumentSnapshot> {
  factory UserProfileDocumentReference(
          DocumentReference<UserProfile> reference) =
      _$UserProfileDocumentReference;

  DocumentReference<UserProfile> get reference;

  /// A reference to the [UserProfileCollectionReference] containing this document.
  UserProfileCollectionReference get parent {
    return _$UserProfileCollectionReference(reference.firestore);
  }

  late final FriendRequestCollectionReference friendRequests =
      _$FriendRequestCollectionReference(
    reference,
  );

  late final FriendCollectionReference friends = _$FriendCollectionReference(
    reference,
  );

  @override
  Stream<UserProfileDocumentSnapshot> snapshots();

  @override
  Future<UserProfileDocumentSnapshot> get([GetOptions? options]);

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
    String? nickname,
    FieldValue nicknameFieldValue,
    String? avatar,
    FieldValue avatarFieldValue,
    String? photo,
    FieldValue photoFieldValue,
    String? language,
    FieldValue languageFieldValue,
    DateTime? joinDate,
    FieldValue joinDateFieldValue,
    int? friend,
    FieldValue friendFieldValue,
    int? league,
    FieldValue leagueFieldValue,
    int? countrycount,
    FieldValue countrycountFieldValue,
    int? visitcount,
    FieldValue visitcountFieldValue,
    int? distancetotal,
    FieldValue distancetotalFieldValue,
    int? regioncount,
    FieldValue regioncountFieldValue,
    int? placescount,
    FieldValue placescountFieldValue,
    int? currentstreak,
    FieldValue currentstreakFieldValue,
    DateTime? lastRecordedDate,
    FieldValue lastRecordedDateFieldValue,
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
    String? nickname,
    FieldValue nicknameFieldValue,
    String? avatar,
    FieldValue avatarFieldValue,
    String? photo,
    FieldValue photoFieldValue,
    String? language,
    FieldValue languageFieldValue,
    DateTime? joinDate,
    FieldValue joinDateFieldValue,
    int? friend,
    FieldValue friendFieldValue,
    int? league,
    FieldValue leagueFieldValue,
    int? countrycount,
    FieldValue countrycountFieldValue,
    int? visitcount,
    FieldValue visitcountFieldValue,
    int? distancetotal,
    FieldValue distancetotalFieldValue,
    int? regioncount,
    FieldValue regioncountFieldValue,
    int? placescount,
    FieldValue placescountFieldValue,
    int? currentstreak,
    FieldValue currentstreakFieldValue,
    DateTime? lastRecordedDate,
    FieldValue lastRecordedDateFieldValue,
  });
}

class _$UserProfileDocumentReference
    extends FirestoreDocumentReference<UserProfile, UserProfileDocumentSnapshot>
    implements UserProfileDocumentReference {
  _$UserProfileDocumentReference(this.reference);

  @override
  final DocumentReference<UserProfile> reference;

  /// A reference to the [UserProfileCollectionReference] containing this document.
  UserProfileCollectionReference get parent {
    return _$UserProfileCollectionReference(reference.firestore);
  }

  late final FriendRequestCollectionReference friendRequests =
      _$FriendRequestCollectionReference(
    reference,
  );

  late final FriendCollectionReference friends = _$FriendCollectionReference(
    reference,
  );

  @override
  Stream<UserProfileDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserProfileDocumentSnapshot._);
  }

  @override
  Future<UserProfileDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserProfileDocumentSnapshot._);
  }

  @override
  Future<UserProfileDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserProfileDocumentSnapshot._);
  }

  Future<void> update({
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? nickname = _sentinel,
    FieldValue? nicknameFieldValue,
    Object? avatar = _sentinel,
    FieldValue? avatarFieldValue,
    Object? photo = _sentinel,
    FieldValue? photoFieldValue,
    Object? language = _sentinel,
    FieldValue? languageFieldValue,
    Object? joinDate = _sentinel,
    FieldValue? joinDateFieldValue,
    Object? friend = _sentinel,
    FieldValue? friendFieldValue,
    Object? league = _sentinel,
    FieldValue? leagueFieldValue,
    Object? countrycount = _sentinel,
    FieldValue? countrycountFieldValue,
    Object? visitcount = _sentinel,
    FieldValue? visitcountFieldValue,
    Object? distancetotal = _sentinel,
    FieldValue? distancetotalFieldValue,
    Object? regioncount = _sentinel,
    FieldValue? regioncountFieldValue,
    Object? placescount = _sentinel,
    FieldValue? placescountFieldValue,
    Object? currentstreak = _sentinel,
    FieldValue? currentstreakFieldValue,
    Object? lastRecordedDate = _sentinel,
    FieldValue? lastRecordedDateFieldValue,
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
      nickname == _sentinel || nicknameFieldValue == null,
      "Cannot specify both nickname and nicknameFieldValue",
    );
    assert(
      avatar == _sentinel || avatarFieldValue == null,
      "Cannot specify both avatar and avatarFieldValue",
    );
    assert(
      photo == _sentinel || photoFieldValue == null,
      "Cannot specify both photo and photoFieldValue",
    );
    assert(
      language == _sentinel || languageFieldValue == null,
      "Cannot specify both language and languageFieldValue",
    );
    assert(
      joinDate == _sentinel || joinDateFieldValue == null,
      "Cannot specify both joinDate and joinDateFieldValue",
    );
    assert(
      friend == _sentinel || friendFieldValue == null,
      "Cannot specify both friend and friendFieldValue",
    );
    assert(
      league == _sentinel || leagueFieldValue == null,
      "Cannot specify both league and leagueFieldValue",
    );
    assert(
      countrycount == _sentinel || countrycountFieldValue == null,
      "Cannot specify both countrycount and countrycountFieldValue",
    );
    assert(
      visitcount == _sentinel || visitcountFieldValue == null,
      "Cannot specify both visitcount and visitcountFieldValue",
    );
    assert(
      distancetotal == _sentinel || distancetotalFieldValue == null,
      "Cannot specify both distancetotal and distancetotalFieldValue",
    );
    assert(
      regioncount == _sentinel || regioncountFieldValue == null,
      "Cannot specify both regioncount and regioncountFieldValue",
    );
    assert(
      placescount == _sentinel || placescountFieldValue == null,
      "Cannot specify both placescount and placescountFieldValue",
    );
    assert(
      currentstreak == _sentinel || currentstreakFieldValue == null,
      "Cannot specify both currentstreak and currentstreakFieldValue",
    );
    assert(
      lastRecordedDate == _sentinel || lastRecordedDateFieldValue == null,
      "Cannot specify both lastRecordedDate and lastRecordedDateFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$UserProfileFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$UserProfileFieldMap['userId']!: userIdFieldValue,
      if (email != _sentinel) _$UserProfileFieldMap['email']!: email as String?,
      if (emailFieldValue != null)
        _$UserProfileFieldMap['email']!: emailFieldValue,
      if (nickname != _sentinel)
        _$UserProfileFieldMap['nickname']!: nickname as String?,
      if (nicknameFieldValue != null)
        _$UserProfileFieldMap['nickname']!: nicknameFieldValue,
      if (avatar != _sentinel)
        _$UserProfileFieldMap['avatar']!: avatar as String?,
      if (avatarFieldValue != null)
        _$UserProfileFieldMap['avatar']!: avatarFieldValue,
      if (photo != _sentinel) _$UserProfileFieldMap['photo']!: photo as String?,
      if (photoFieldValue != null)
        _$UserProfileFieldMap['photo']!: photoFieldValue,
      if (language != _sentinel)
        _$UserProfileFieldMap['language']!: language as String?,
      if (languageFieldValue != null)
        _$UserProfileFieldMap['language']!: languageFieldValue,
      if (joinDate != _sentinel)
        _$UserProfileFieldMap['joinDate']!: joinDate as DateTime?,
      if (joinDateFieldValue != null)
        _$UserProfileFieldMap['joinDate']!: joinDateFieldValue,
      if (friend != _sentinel) _$UserProfileFieldMap['friend']!: friend as int?,
      if (friendFieldValue != null)
        _$UserProfileFieldMap['friend']!: friendFieldValue,
      if (league != _sentinel) _$UserProfileFieldMap['league']!: league as int?,
      if (leagueFieldValue != null)
        _$UserProfileFieldMap['league']!: leagueFieldValue,
      if (countrycount != _sentinel)
        _$UserProfileFieldMap['countrycount']!: countrycount as int?,
      if (countrycountFieldValue != null)
        _$UserProfileFieldMap['countrycount']!: countrycountFieldValue,
      if (visitcount != _sentinel)
        _$UserProfileFieldMap['visitcount']!: visitcount as int?,
      if (visitcountFieldValue != null)
        _$UserProfileFieldMap['visitcount']!: visitcountFieldValue,
      if (distancetotal != _sentinel)
        _$UserProfileFieldMap['distancetotal']!: distancetotal as int?,
      if (distancetotalFieldValue != null)
        _$UserProfileFieldMap['distancetotal']!: distancetotalFieldValue,
      if (regioncount != _sentinel)
        _$UserProfileFieldMap['regioncount']!: regioncount as int?,
      if (regioncountFieldValue != null)
        _$UserProfileFieldMap['regioncount']!: regioncountFieldValue,
      if (placescount != _sentinel)
        _$UserProfileFieldMap['placescount']!: placescount as int?,
      if (placescountFieldValue != null)
        _$UserProfileFieldMap['placescount']!: placescountFieldValue,
      if (currentstreak != _sentinel)
        _$UserProfileFieldMap['currentstreak']!: currentstreak as int?,
      if (currentstreakFieldValue != null)
        _$UserProfileFieldMap['currentstreak']!: currentstreakFieldValue,
      if (lastRecordedDate != _sentinel)
        _$UserProfileFieldMap['lastRecordedDate']!:
            lastRecordedDate as DateTime?,
      if (lastRecordedDateFieldValue != null)
        _$UserProfileFieldMap['lastRecordedDate']!: lastRecordedDateFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? nickname = _sentinel,
    FieldValue? nicknameFieldValue,
    Object? avatar = _sentinel,
    FieldValue? avatarFieldValue,
    Object? photo = _sentinel,
    FieldValue? photoFieldValue,
    Object? language = _sentinel,
    FieldValue? languageFieldValue,
    Object? joinDate = _sentinel,
    FieldValue? joinDateFieldValue,
    Object? friend = _sentinel,
    FieldValue? friendFieldValue,
    Object? league = _sentinel,
    FieldValue? leagueFieldValue,
    Object? countrycount = _sentinel,
    FieldValue? countrycountFieldValue,
    Object? visitcount = _sentinel,
    FieldValue? visitcountFieldValue,
    Object? distancetotal = _sentinel,
    FieldValue? distancetotalFieldValue,
    Object? regioncount = _sentinel,
    FieldValue? regioncountFieldValue,
    Object? placescount = _sentinel,
    FieldValue? placescountFieldValue,
    Object? currentstreak = _sentinel,
    FieldValue? currentstreakFieldValue,
    Object? lastRecordedDate = _sentinel,
    FieldValue? lastRecordedDateFieldValue,
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
      nickname == _sentinel || nicknameFieldValue == null,
      "Cannot specify both nickname and nicknameFieldValue",
    );
    assert(
      avatar == _sentinel || avatarFieldValue == null,
      "Cannot specify both avatar and avatarFieldValue",
    );
    assert(
      photo == _sentinel || photoFieldValue == null,
      "Cannot specify both photo and photoFieldValue",
    );
    assert(
      language == _sentinel || languageFieldValue == null,
      "Cannot specify both language and languageFieldValue",
    );
    assert(
      joinDate == _sentinel || joinDateFieldValue == null,
      "Cannot specify both joinDate and joinDateFieldValue",
    );
    assert(
      friend == _sentinel || friendFieldValue == null,
      "Cannot specify both friend and friendFieldValue",
    );
    assert(
      league == _sentinel || leagueFieldValue == null,
      "Cannot specify both league and leagueFieldValue",
    );
    assert(
      countrycount == _sentinel || countrycountFieldValue == null,
      "Cannot specify both countrycount and countrycountFieldValue",
    );
    assert(
      visitcount == _sentinel || visitcountFieldValue == null,
      "Cannot specify both visitcount and visitcountFieldValue",
    );
    assert(
      distancetotal == _sentinel || distancetotalFieldValue == null,
      "Cannot specify both distancetotal and distancetotalFieldValue",
    );
    assert(
      regioncount == _sentinel || regioncountFieldValue == null,
      "Cannot specify both regioncount and regioncountFieldValue",
    );
    assert(
      placescount == _sentinel || placescountFieldValue == null,
      "Cannot specify both placescount and placescountFieldValue",
    );
    assert(
      currentstreak == _sentinel || currentstreakFieldValue == null,
      "Cannot specify both currentstreak and currentstreakFieldValue",
    );
    assert(
      lastRecordedDate == _sentinel || lastRecordedDateFieldValue == null,
      "Cannot specify both lastRecordedDate and lastRecordedDateFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$UserProfileFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$UserProfileFieldMap['userId']!: userIdFieldValue,
      if (email != _sentinel) _$UserProfileFieldMap['email']!: email as String?,
      if (emailFieldValue != null)
        _$UserProfileFieldMap['email']!: emailFieldValue,
      if (nickname != _sentinel)
        _$UserProfileFieldMap['nickname']!: nickname as String?,
      if (nicknameFieldValue != null)
        _$UserProfileFieldMap['nickname']!: nicknameFieldValue,
      if (avatar != _sentinel)
        _$UserProfileFieldMap['avatar']!: avatar as String?,
      if (avatarFieldValue != null)
        _$UserProfileFieldMap['avatar']!: avatarFieldValue,
      if (photo != _sentinel) _$UserProfileFieldMap['photo']!: photo as String?,
      if (photoFieldValue != null)
        _$UserProfileFieldMap['photo']!: photoFieldValue,
      if (language != _sentinel)
        _$UserProfileFieldMap['language']!: language as String?,
      if (languageFieldValue != null)
        _$UserProfileFieldMap['language']!: languageFieldValue,
      if (joinDate != _sentinel)
        _$UserProfileFieldMap['joinDate']!: joinDate as DateTime?,
      if (joinDateFieldValue != null)
        _$UserProfileFieldMap['joinDate']!: joinDateFieldValue,
      if (friend != _sentinel) _$UserProfileFieldMap['friend']!: friend as int?,
      if (friendFieldValue != null)
        _$UserProfileFieldMap['friend']!: friendFieldValue,
      if (league != _sentinel) _$UserProfileFieldMap['league']!: league as int?,
      if (leagueFieldValue != null)
        _$UserProfileFieldMap['league']!: leagueFieldValue,
      if (countrycount != _sentinel)
        _$UserProfileFieldMap['countrycount']!: countrycount as int?,
      if (countrycountFieldValue != null)
        _$UserProfileFieldMap['countrycount']!: countrycountFieldValue,
      if (visitcount != _sentinel)
        _$UserProfileFieldMap['visitcount']!: visitcount as int?,
      if (visitcountFieldValue != null)
        _$UserProfileFieldMap['visitcount']!: visitcountFieldValue,
      if (distancetotal != _sentinel)
        _$UserProfileFieldMap['distancetotal']!: distancetotal as int?,
      if (distancetotalFieldValue != null)
        _$UserProfileFieldMap['distancetotal']!: distancetotalFieldValue,
      if (regioncount != _sentinel)
        _$UserProfileFieldMap['regioncount']!: regioncount as int?,
      if (regioncountFieldValue != null)
        _$UserProfileFieldMap['regioncount']!: regioncountFieldValue,
      if (placescount != _sentinel)
        _$UserProfileFieldMap['placescount']!: placescount as int?,
      if (placescountFieldValue != null)
        _$UserProfileFieldMap['placescount']!: placescountFieldValue,
      if (currentstreak != _sentinel)
        _$UserProfileFieldMap['currentstreak']!: currentstreak as int?,
      if (currentstreakFieldValue != null)
        _$UserProfileFieldMap['currentstreak']!: currentstreakFieldValue,
      if (lastRecordedDate != _sentinel)
        _$UserProfileFieldMap['lastRecordedDate']!:
            lastRecordedDate as DateTime?,
      if (lastRecordedDateFieldValue != null)
        _$UserProfileFieldMap['lastRecordedDate']!: lastRecordedDateFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserProfileQuery
    implements QueryReference<UserProfile, UserProfileQuerySnapshot> {
  @override
  UserProfileQuery limit(int limit);

  @override
  UserProfileQuery limitToLast(int limit);

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
  UserProfileQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
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
  UserProfileQuery whereFieldPath(
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

  UserProfileQuery whereDocumentId({
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
  UserProfileQuery whereUserId({
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
  UserProfileQuery whereEmail({
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
  UserProfileQuery whereNickname({
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
  UserProfileQuery whereAvatar({
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
  UserProfileQuery wherePhoto({
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
  UserProfileQuery whereLanguage({
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
  UserProfileQuery whereJoinDate({
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
  UserProfileQuery whereFriend({
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
  UserProfileQuery whereLeague({
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
  UserProfileQuery whereCountrycount({
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
  UserProfileQuery whereVisitcount({
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
  UserProfileQuery whereDistancetotal({
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
  UserProfileQuery whereRegioncount({
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
  UserProfileQuery wherePlacescount({
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
  UserProfileQuery whereCurrentstreak({
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
  UserProfileQuery whereLastRecordedDate({
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

  UserProfileQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByNickname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByAvatar({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByPhoto({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByLanguage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByJoinDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByFriend({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByLeague({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByCountrycount({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByVisitcount({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByDistancetotal({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByRegioncount({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByPlacescount({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByCurrentstreak({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });

  UserProfileQuery orderByLastRecordedDate({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  });
}

class _$UserProfileQuery
    extends QueryReference<UserProfile, UserProfileQuerySnapshot>
    implements UserProfileQuery {
  _$UserProfileQuery(
    this._collection, {
    required Query<UserProfile> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserProfileQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(UserProfileQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserProfileQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserProfileQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserProfileQuery limit(int limit) {
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserProfileQuery limitToLast(int limit) {
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserProfileQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery whereFieldPath(
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
    return _$UserProfileQuery(
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

  UserProfileQuery whereDocumentId({
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
    return _$UserProfileQuery(
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

  UserProfileQuery whereUserId({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['userId']!,
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

  UserProfileQuery whereEmail({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['email']!,
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

  UserProfileQuery whereNickname({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['nickname']!,
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

  UserProfileQuery whereAvatar({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['avatar']!,
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

  UserProfileQuery wherePhoto({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['photo']!,
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

  UserProfileQuery whereLanguage({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['language']!,
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

  UserProfileQuery whereJoinDate({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['joinDate']!,
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

  UserProfileQuery whereFriend({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['friend']!,
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

  UserProfileQuery whereLeague({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['league']!,
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

  UserProfileQuery whereCountrycount({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['countrycount']!,
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

  UserProfileQuery whereVisitcount({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['visitcount']!,
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

  UserProfileQuery whereDistancetotal({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['distancetotal']!,
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

  UserProfileQuery whereRegioncount({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['regioncount']!,
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

  UserProfileQuery wherePlacescount({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['placescount']!,
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

  UserProfileQuery whereCurrentstreak({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['currentstreak']!,
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

  UserProfileQuery whereLastRecordedDate({
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
    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserProfileFieldMap['lastRecordedDate']!,
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

  UserProfileQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['userId']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['email']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByNickname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['nickname']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByAvatar({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['avatar']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByPhoto({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['photo']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByLanguage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['language']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByJoinDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['joinDate']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByFriend({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['friend']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByLeague({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['league']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByCountrycount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserProfileFieldMap['countrycount']!,
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByVisitcount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['visitcount']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByDistancetotal({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserProfileFieldMap['distancetotal']!,
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByRegioncount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['regioncount']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByPlacescount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserProfileFieldMap['placescount']!, descending: descending);
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByCurrentstreak({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserProfileFieldMap['currentstreak']!,
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserProfileQuery orderByLastRecordedDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserProfileDocumentSnapshot? startAtDocument,
    UserProfileDocumentSnapshot? endAtDocument,
    UserProfileDocumentSnapshot? endBeforeDocument,
    UserProfileDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$UserProfileFieldMap['lastRecordedDate']!,
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

    return _$UserProfileQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserProfileQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserProfileDocumentSnapshot
    extends FirestoreDocumentSnapshot<UserProfile> {
  UserProfileDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserProfile> snapshot;

  @override
  UserProfileDocumentReference get reference {
    return UserProfileDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserProfile? data;
}

class UserProfileQuerySnapshot extends FirestoreQuerySnapshot<UserProfile,
    UserProfileQueryDocumentSnapshot> {
  UserProfileQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserProfileQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserProfile> snapshot,
  ) {
    final docs = snapshot.docs.map(UserProfileQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserProfileDocumentSnapshot._,
      );
    }).toList();

    return UserProfileQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserProfileDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserProfileDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserProfileDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserProfile> snapshot;

  @override
  final List<UserProfileQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserProfileDocumentSnapshot>> docChanges;
}

class UserProfileQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserProfile>
    implements UserProfileDocumentSnapshot {
  UserProfileQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserProfile> snapshot;

  @override
  final UserProfile data;

  @override
  UserProfileDocumentReference get reference {
    return UserProfileDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class FriendRequestCollectionReference
    implements
        FriendRequestQuery,
        FirestoreCollectionReference<FriendRequest,
            FriendRequestQuerySnapshot> {
  factory FriendRequestCollectionReference(
    DocumentReference<UserProfile> parent,
  ) = _$FriendRequestCollectionReference;

  static FriendRequest fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return FriendRequest.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    FriendRequest value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<FriendRequest> get reference;

  /// A reference to the containing [UserProfileDocumentReference] if this is a subcollection.
  UserProfileDocumentReference get parent;

  @override
  FriendRequestDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FriendRequestDocumentReference> add(FriendRequest value);
}

class _$FriendRequestCollectionReference extends _$FriendRequestQuery
    implements FriendRequestCollectionReference {
  factory _$FriendRequestCollectionReference(
    DocumentReference<UserProfile> parent,
  ) {
    return _$FriendRequestCollectionReference._(
      UserProfileDocumentReference(parent),
      parent.collection('friendRequests').withConverter(
            fromFirestore: FriendRequestCollectionReference.fromFirestore,
            toFirestore: FriendRequestCollectionReference.toFirestore,
          ),
    );
  }

  _$FriendRequestCollectionReference._(
    this.parent,
    CollectionReference<FriendRequest> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserProfileDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<FriendRequest> get reference =>
      super.reference as CollectionReference<FriendRequest>;

  @override
  FriendRequestDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FriendRequestDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FriendRequestDocumentReference> add(FriendRequest value) {
    return reference
        .add(value)
        .then((ref) => FriendRequestDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FriendRequestCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FriendRequestDocumentReference
    extends FirestoreDocumentReference<FriendRequest,
        FriendRequestDocumentSnapshot> {
  factory FriendRequestDocumentReference(
          DocumentReference<FriendRequest> reference) =
      _$FriendRequestDocumentReference;

  DocumentReference<FriendRequest> get reference;

  /// A reference to the [FriendRequestCollectionReference] containing this document.
  FriendRequestCollectionReference get parent {
    return _$FriendRequestCollectionReference(
      reference.parent.parent!.withConverter<UserProfile>(
        fromFirestore: UserProfileCollectionReference.fromFirestore,
        toFirestore: UserProfileCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FriendRequestDocumentSnapshot> snapshots();

  @override
  Future<FriendRequestDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? userId,
    FieldValue userIdFieldValue,
    String? requesterId,
    FieldValue requesterIdFieldValue,
    String? requesterNickname,
    FieldValue requesterNicknameFieldValue,
    String? requesterEmail,
    FieldValue requesterEmailFieldValue,
    String? requesterAvatar,
    FieldValue requesterAvatarFieldValue,
    String? status,
    FieldValue statusFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? userId,
    FieldValue userIdFieldValue,
    String? requesterId,
    FieldValue requesterIdFieldValue,
    String? requesterNickname,
    FieldValue requesterNicknameFieldValue,
    String? requesterEmail,
    FieldValue requesterEmailFieldValue,
    String? requesterAvatar,
    FieldValue requesterAvatarFieldValue,
    String? status,
    FieldValue statusFieldValue,
  });
}

class _$FriendRequestDocumentReference extends FirestoreDocumentReference<
    FriendRequest,
    FriendRequestDocumentSnapshot> implements FriendRequestDocumentReference {
  _$FriendRequestDocumentReference(this.reference);

  @override
  final DocumentReference<FriendRequest> reference;

  /// A reference to the [FriendRequestCollectionReference] containing this document.
  FriendRequestCollectionReference get parent {
    return _$FriendRequestCollectionReference(
      reference.parent.parent!.withConverter<UserProfile>(
        fromFirestore: UserProfileCollectionReference.fromFirestore,
        toFirestore: UserProfileCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FriendRequestDocumentSnapshot> snapshots() {
    return reference.snapshots().map(FriendRequestDocumentSnapshot._);
  }

  @override
  Future<FriendRequestDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(FriendRequestDocumentSnapshot._);
  }

  @override
  Future<FriendRequestDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(FriendRequestDocumentSnapshot._);
  }

  Future<void> update({
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? requesterId = _sentinel,
    FieldValue? requesterIdFieldValue,
    Object? requesterNickname = _sentinel,
    FieldValue? requesterNicknameFieldValue,
    Object? requesterEmail = _sentinel,
    FieldValue? requesterEmailFieldValue,
    Object? requesterAvatar = _sentinel,
    FieldValue? requesterAvatarFieldValue,
    Object? status = _sentinel,
    FieldValue? statusFieldValue,
  }) async {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      requesterId == _sentinel || requesterIdFieldValue == null,
      "Cannot specify both requesterId and requesterIdFieldValue",
    );
    assert(
      requesterNickname == _sentinel || requesterNicknameFieldValue == null,
      "Cannot specify both requesterNickname and requesterNicknameFieldValue",
    );
    assert(
      requesterEmail == _sentinel || requesterEmailFieldValue == null,
      "Cannot specify both requesterEmail and requesterEmailFieldValue",
    );
    assert(
      requesterAvatar == _sentinel || requesterAvatarFieldValue == null,
      "Cannot specify both requesterAvatar and requesterAvatarFieldValue",
    );
    assert(
      status == _sentinel || statusFieldValue == null,
      "Cannot specify both status and statusFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$FriendRequestFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$FriendRequestFieldMap['userId']!: userIdFieldValue,
      if (requesterId != _sentinel)
        _$FriendRequestFieldMap['requesterId']!: requesterId as String?,
      if (requesterIdFieldValue != null)
        _$FriendRequestFieldMap['requesterId']!: requesterIdFieldValue,
      if (requesterNickname != _sentinel)
        _$FriendRequestFieldMap['requesterNickname']!:
            requesterNickname as String?,
      if (requesterNicknameFieldValue != null)
        _$FriendRequestFieldMap['requesterNickname']!:
            requesterNicknameFieldValue,
      if (requesterEmail != _sentinel)
        _$FriendRequestFieldMap['requesterEmail']!: requesterEmail as String?,
      if (requesterEmailFieldValue != null)
        _$FriendRequestFieldMap['requesterEmail']!: requesterEmailFieldValue,
      if (requesterAvatar != _sentinel)
        _$FriendRequestFieldMap['requesterAvatar']!: requesterAvatar as String?,
      if (requesterAvatarFieldValue != null)
        _$FriendRequestFieldMap['requesterAvatar']!: requesterAvatarFieldValue,
      if (status != _sentinel)
        _$FriendRequestFieldMap['status']!: status as String?,
      if (statusFieldValue != null)
        _$FriendRequestFieldMap['status']!: statusFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? requesterId = _sentinel,
    FieldValue? requesterIdFieldValue,
    Object? requesterNickname = _sentinel,
    FieldValue? requesterNicknameFieldValue,
    Object? requesterEmail = _sentinel,
    FieldValue? requesterEmailFieldValue,
    Object? requesterAvatar = _sentinel,
    FieldValue? requesterAvatarFieldValue,
    Object? status = _sentinel,
    FieldValue? statusFieldValue,
  }) {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      requesterId == _sentinel || requesterIdFieldValue == null,
      "Cannot specify both requesterId and requesterIdFieldValue",
    );
    assert(
      requesterNickname == _sentinel || requesterNicknameFieldValue == null,
      "Cannot specify both requesterNickname and requesterNicknameFieldValue",
    );
    assert(
      requesterEmail == _sentinel || requesterEmailFieldValue == null,
      "Cannot specify both requesterEmail and requesterEmailFieldValue",
    );
    assert(
      requesterAvatar == _sentinel || requesterAvatarFieldValue == null,
      "Cannot specify both requesterAvatar and requesterAvatarFieldValue",
    );
    assert(
      status == _sentinel || statusFieldValue == null,
      "Cannot specify both status and statusFieldValue",
    );
    final json = {
      if (userId != _sentinel)
        _$FriendRequestFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$FriendRequestFieldMap['userId']!: userIdFieldValue,
      if (requesterId != _sentinel)
        _$FriendRequestFieldMap['requesterId']!: requesterId as String?,
      if (requesterIdFieldValue != null)
        _$FriendRequestFieldMap['requesterId']!: requesterIdFieldValue,
      if (requesterNickname != _sentinel)
        _$FriendRequestFieldMap['requesterNickname']!:
            requesterNickname as String?,
      if (requesterNicknameFieldValue != null)
        _$FriendRequestFieldMap['requesterNickname']!:
            requesterNicknameFieldValue,
      if (requesterEmail != _sentinel)
        _$FriendRequestFieldMap['requesterEmail']!: requesterEmail as String?,
      if (requesterEmailFieldValue != null)
        _$FriendRequestFieldMap['requesterEmail']!: requesterEmailFieldValue,
      if (requesterAvatar != _sentinel)
        _$FriendRequestFieldMap['requesterAvatar']!: requesterAvatar as String?,
      if (requesterAvatarFieldValue != null)
        _$FriendRequestFieldMap['requesterAvatar']!: requesterAvatarFieldValue,
      if (status != _sentinel)
        _$FriendRequestFieldMap['status']!: status as String?,
      if (statusFieldValue != null)
        _$FriendRequestFieldMap['status']!: statusFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is FriendRequestDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class FriendRequestQuery
    implements QueryReference<FriendRequest, FriendRequestQuerySnapshot> {
  @override
  FriendRequestQuery limit(int limit);

  @override
  FriendRequestQuery limitToLast(int limit);

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
  FriendRequestQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
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
  FriendRequestQuery whereFieldPath(
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

  FriendRequestQuery whereDocumentId({
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
  FriendRequestQuery whereUserId({
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
  FriendRequestQuery whereRequesterId({
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
  FriendRequestQuery whereRequesterNickname({
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
  FriendRequestQuery whereRequesterEmail({
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
  FriendRequestQuery whereRequesterAvatar({
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
  FriendRequestQuery whereStatus({
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

  FriendRequestQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });

  FriendRequestQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });

  FriendRequestQuery orderByRequesterId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });

  FriendRequestQuery orderByRequesterNickname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });

  FriendRequestQuery orderByRequesterEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });

  FriendRequestQuery orderByRequesterAvatar({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });

  FriendRequestQuery orderByStatus({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  });
}

class _$FriendRequestQuery
    extends QueryReference<FriendRequest, FriendRequestQuerySnapshot>
    implements FriendRequestQuery {
  _$FriendRequestQuery(
    this._collection, {
    required Query<FriendRequest> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<FriendRequestQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(FriendRequestQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<FriendRequestQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(FriendRequestQuerySnapshot._fromQuerySnapshot);
  }

  @override
  FriendRequestQuery limit(int limit) {
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FriendRequestQuery limitToLast(int limit) {
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  FriendRequestQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery whereFieldPath(
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
    return _$FriendRequestQuery(
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

  FriendRequestQuery whereDocumentId({
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
    return _$FriendRequestQuery(
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

  FriendRequestQuery whereUserId({
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendRequestFieldMap['userId']!,
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

  FriendRequestQuery whereRequesterId({
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendRequestFieldMap['requesterId']!,
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

  FriendRequestQuery whereRequesterNickname({
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendRequestFieldMap['requesterNickname']!,
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

  FriendRequestQuery whereRequesterEmail({
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendRequestFieldMap['requesterEmail']!,
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

  FriendRequestQuery whereRequesterAvatar({
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendRequestFieldMap['requesterAvatar']!,
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

  FriendRequestQuery whereStatus({
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
    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendRequestFieldMap['status']!,
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

  FriendRequestQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FriendRequestFieldMap['userId']!, descending: descending);
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery orderByRequesterId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$FriendRequestFieldMap['requesterId']!,
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery orderByRequesterNickname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$FriendRequestFieldMap['requesterNickname']!,
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery orderByRequesterEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$FriendRequestFieldMap['requesterEmail']!,
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery orderByRequesterAvatar({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$FriendRequestFieldMap['requesterAvatar']!,
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendRequestQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendRequestDocumentSnapshot? startAtDocument,
    FriendRequestDocumentSnapshot? endAtDocument,
    FriendRequestDocumentSnapshot? endBeforeDocument,
    FriendRequestDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FriendRequestFieldMap['status']!, descending: descending);
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

    return _$FriendRequestQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$FriendRequestQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FriendRequestDocumentSnapshot
    extends FirestoreDocumentSnapshot<FriendRequest> {
  FriendRequestDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<FriendRequest> snapshot;

  @override
  FriendRequestDocumentReference get reference {
    return FriendRequestDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FriendRequest? data;
}

class FriendRequestQuerySnapshot extends FirestoreQuerySnapshot<FriendRequest,
    FriendRequestQueryDocumentSnapshot> {
  FriendRequestQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory FriendRequestQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<FriendRequest> snapshot,
  ) {
    final docs =
        snapshot.docs.map(FriendRequestQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        FriendRequestDocumentSnapshot._,
      );
    }).toList();

    return FriendRequestQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<FriendRequestDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    FriendRequestDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<FriendRequestDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<FriendRequest> snapshot;

  @override
  final List<FriendRequestQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FriendRequestDocumentSnapshot>> docChanges;
}

class FriendRequestQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<FriendRequest>
    implements FriendRequestDocumentSnapshot {
  FriendRequestQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<FriendRequest> snapshot;

  @override
  final FriendRequest data;

  @override
  FriendRequestDocumentReference get reference {
    return FriendRequestDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class FriendCollectionReference
    implements
        FriendQuery,
        FirestoreCollectionReference<Friend, FriendQuerySnapshot> {
  factory FriendCollectionReference(
    DocumentReference<UserProfile> parent,
  ) = _$FriendCollectionReference;

  static Friend fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Friend.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Friend value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Friend> get reference;

  /// A reference to the containing [UserProfileDocumentReference] if this is a subcollection.
  UserProfileDocumentReference get parent;

  @override
  FriendDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FriendDocumentReference> add(Friend value);
}

class _$FriendCollectionReference extends _$FriendQuery
    implements FriendCollectionReference {
  factory _$FriendCollectionReference(
    DocumentReference<UserProfile> parent,
  ) {
    return _$FriendCollectionReference._(
      UserProfileDocumentReference(parent),
      parent.collection('friends').withConverter(
            fromFirestore: FriendCollectionReference.fromFirestore,
            toFirestore: FriendCollectionReference.toFirestore,
          ),
    );
  }

  _$FriendCollectionReference._(
    this.parent,
    CollectionReference<Friend> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final UserProfileDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Friend> get reference =>
      super.reference as CollectionReference<Friend>;

  @override
  FriendDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FriendDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FriendDocumentReference> add(Friend value) {
    return reference.add(value).then((ref) => FriendDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FriendCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FriendDocumentReference
    extends FirestoreDocumentReference<Friend, FriendDocumentSnapshot> {
  factory FriendDocumentReference(DocumentReference<Friend> reference) =
      _$FriendDocumentReference;

  DocumentReference<Friend> get reference;

  /// A reference to the [FriendCollectionReference] containing this document.
  FriendCollectionReference get parent {
    return _$FriendCollectionReference(
      reference.parent.parent!.withConverter<UserProfile>(
        fromFirestore: UserProfileCollectionReference.fromFirestore,
        toFirestore: UserProfileCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FriendDocumentSnapshot> snapshots();

  @override
  Future<FriendDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? userId,
    FieldValue userIdFieldValue,
    String? friendId,
    FieldValue friendIdFieldValue,
    String? friendNickname,
    FieldValue friendNicknameFieldValue,
    String? friendEmail,
    FieldValue friendEmailFieldValue,
    String? friendAvatar,
    FieldValue friendAvatarFieldValue,
    String? status,
    FieldValue statusFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? userId,
    FieldValue userIdFieldValue,
    String? friendId,
    FieldValue friendIdFieldValue,
    String? friendNickname,
    FieldValue friendNicknameFieldValue,
    String? friendEmail,
    FieldValue friendEmailFieldValue,
    String? friendAvatar,
    FieldValue friendAvatarFieldValue,
    String? status,
    FieldValue statusFieldValue,
  });
}

class _$FriendDocumentReference
    extends FirestoreDocumentReference<Friend, FriendDocumentSnapshot>
    implements FriendDocumentReference {
  _$FriendDocumentReference(this.reference);

  @override
  final DocumentReference<Friend> reference;

  /// A reference to the [FriendCollectionReference] containing this document.
  FriendCollectionReference get parent {
    return _$FriendCollectionReference(
      reference.parent.parent!.withConverter<UserProfile>(
        fromFirestore: UserProfileCollectionReference.fromFirestore,
        toFirestore: UserProfileCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FriendDocumentSnapshot> snapshots() {
    return reference.snapshots().map(FriendDocumentSnapshot._);
  }

  @override
  Future<FriendDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(FriendDocumentSnapshot._);
  }

  @override
  Future<FriendDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(FriendDocumentSnapshot._);
  }

  Future<void> update({
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? friendId = _sentinel,
    FieldValue? friendIdFieldValue,
    Object? friendNickname = _sentinel,
    FieldValue? friendNicknameFieldValue,
    Object? friendEmail = _sentinel,
    FieldValue? friendEmailFieldValue,
    Object? friendAvatar = _sentinel,
    FieldValue? friendAvatarFieldValue,
    Object? status = _sentinel,
    FieldValue? statusFieldValue,
  }) async {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      friendId == _sentinel || friendIdFieldValue == null,
      "Cannot specify both friendId and friendIdFieldValue",
    );
    assert(
      friendNickname == _sentinel || friendNicknameFieldValue == null,
      "Cannot specify both friendNickname and friendNicknameFieldValue",
    );
    assert(
      friendEmail == _sentinel || friendEmailFieldValue == null,
      "Cannot specify both friendEmail and friendEmailFieldValue",
    );
    assert(
      friendAvatar == _sentinel || friendAvatarFieldValue == null,
      "Cannot specify both friendAvatar and friendAvatarFieldValue",
    );
    assert(
      status == _sentinel || statusFieldValue == null,
      "Cannot specify both status and statusFieldValue",
    );
    final json = {
      if (userId != _sentinel) _$FriendFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$FriendFieldMap['userId']!: userIdFieldValue,
      if (friendId != _sentinel)
        _$FriendFieldMap['friendId']!: friendId as String?,
      if (friendIdFieldValue != null)
        _$FriendFieldMap['friendId']!: friendIdFieldValue,
      if (friendNickname != _sentinel)
        _$FriendFieldMap['friendNickname']!: friendNickname as String?,
      if (friendNicknameFieldValue != null)
        _$FriendFieldMap['friendNickname']!: friendNicknameFieldValue,
      if (friendEmail != _sentinel)
        _$FriendFieldMap['friendEmail']!: friendEmail as String?,
      if (friendEmailFieldValue != null)
        _$FriendFieldMap['friendEmail']!: friendEmailFieldValue,
      if (friendAvatar != _sentinel)
        _$FriendFieldMap['friendAvatar']!: friendAvatar as String?,
      if (friendAvatarFieldValue != null)
        _$FriendFieldMap['friendAvatar']!: friendAvatarFieldValue,
      if (status != _sentinel) _$FriendFieldMap['status']!: status as String?,
      if (statusFieldValue != null)
        _$FriendFieldMap['status']!: statusFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? userId = _sentinel,
    FieldValue? userIdFieldValue,
    Object? friendId = _sentinel,
    FieldValue? friendIdFieldValue,
    Object? friendNickname = _sentinel,
    FieldValue? friendNicknameFieldValue,
    Object? friendEmail = _sentinel,
    FieldValue? friendEmailFieldValue,
    Object? friendAvatar = _sentinel,
    FieldValue? friendAvatarFieldValue,
    Object? status = _sentinel,
    FieldValue? statusFieldValue,
  }) {
    assert(
      userId == _sentinel || userIdFieldValue == null,
      "Cannot specify both userId and userIdFieldValue",
    );
    assert(
      friendId == _sentinel || friendIdFieldValue == null,
      "Cannot specify both friendId and friendIdFieldValue",
    );
    assert(
      friendNickname == _sentinel || friendNicknameFieldValue == null,
      "Cannot specify both friendNickname and friendNicknameFieldValue",
    );
    assert(
      friendEmail == _sentinel || friendEmailFieldValue == null,
      "Cannot specify both friendEmail and friendEmailFieldValue",
    );
    assert(
      friendAvatar == _sentinel || friendAvatarFieldValue == null,
      "Cannot specify both friendAvatar and friendAvatarFieldValue",
    );
    assert(
      status == _sentinel || statusFieldValue == null,
      "Cannot specify both status and statusFieldValue",
    );
    final json = {
      if (userId != _sentinel) _$FriendFieldMap['userId']!: userId as String?,
      if (userIdFieldValue != null)
        _$FriendFieldMap['userId']!: userIdFieldValue,
      if (friendId != _sentinel)
        _$FriendFieldMap['friendId']!: friendId as String?,
      if (friendIdFieldValue != null)
        _$FriendFieldMap['friendId']!: friendIdFieldValue,
      if (friendNickname != _sentinel)
        _$FriendFieldMap['friendNickname']!: friendNickname as String?,
      if (friendNicknameFieldValue != null)
        _$FriendFieldMap['friendNickname']!: friendNicknameFieldValue,
      if (friendEmail != _sentinel)
        _$FriendFieldMap['friendEmail']!: friendEmail as String?,
      if (friendEmailFieldValue != null)
        _$FriendFieldMap['friendEmail']!: friendEmailFieldValue,
      if (friendAvatar != _sentinel)
        _$FriendFieldMap['friendAvatar']!: friendAvatar as String?,
      if (friendAvatarFieldValue != null)
        _$FriendFieldMap['friendAvatar']!: friendAvatarFieldValue,
      if (status != _sentinel) _$FriendFieldMap['status']!: status as String?,
      if (statusFieldValue != null)
        _$FriendFieldMap['status']!: statusFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is FriendDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class FriendQuery
    implements QueryReference<Friend, FriendQuerySnapshot> {
  @override
  FriendQuery limit(int limit);

  @override
  FriendQuery limitToLast(int limit);

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
  FriendQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
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
  FriendQuery whereFieldPath(
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

  FriendQuery whereDocumentId({
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
  FriendQuery whereUserId({
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
  FriendQuery whereFriendId({
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
  FriendQuery whereFriendNickname({
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
  FriendQuery whereFriendEmail({
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
  FriendQuery whereFriendAvatar({
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
  FriendQuery whereStatus({
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

  FriendQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });

  FriendQuery orderByUserId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });

  FriendQuery orderByFriendId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });

  FriendQuery orderByFriendNickname({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });

  FriendQuery orderByFriendEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });

  FriendQuery orderByFriendAvatar({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });

  FriendQuery orderByStatus({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  });
}

class _$FriendQuery extends QueryReference<Friend, FriendQuerySnapshot>
    implements FriendQuery {
  _$FriendQuery(
    this._collection, {
    required Query<Friend> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<FriendQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(FriendQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<FriendQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(FriendQuerySnapshot._fromQuerySnapshot);
  }

  @override
  FriendQuery limit(int limit) {
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FriendQuery limitToLast(int limit) {
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  FriendQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery whereFieldPath(
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
    return _$FriendQuery(
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

  FriendQuery whereDocumentId({
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
    return _$FriendQuery(
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

  FriendQuery whereUserId({
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendFieldMap['userId']!,
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

  FriendQuery whereFriendId({
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendFieldMap['friendId']!,
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

  FriendQuery whereFriendNickname({
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendFieldMap['friendNickname']!,
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

  FriendQuery whereFriendEmail({
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendFieldMap['friendEmail']!,
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

  FriendQuery whereFriendAvatar({
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendFieldMap['friendAvatar']!,
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

  FriendQuery whereStatus({
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
    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FriendFieldMap['status']!,
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

  FriendQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$FriendFieldMap['userId']!,
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery orderByFriendId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$FriendFieldMap['friendId']!,
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery orderByFriendNickname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FriendFieldMap['friendNickname']!, descending: descending);
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery orderByFriendEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FriendFieldMap['friendEmail']!, descending: descending);
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery orderByFriendAvatar({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FriendFieldMap['friendAvatar']!, descending: descending);
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  FriendQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FriendDocumentSnapshot? startAtDocument,
    FriendDocumentSnapshot? endAtDocument,
    FriendDocumentSnapshot? endBeforeDocument,
    FriendDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$FriendFieldMap['status']!,
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

    return _$FriendQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$FriendQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FriendDocumentSnapshot extends FirestoreDocumentSnapshot<Friend> {
  FriendDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Friend> snapshot;

  @override
  FriendDocumentReference get reference {
    return FriendDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Friend? data;
}

class FriendQuerySnapshot
    extends FirestoreQuerySnapshot<Friend, FriendQueryDocumentSnapshot> {
  FriendQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory FriendQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Friend> snapshot,
  ) {
    final docs = snapshot.docs.map(FriendQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        FriendDocumentSnapshot._,
      );
    }).toList();

    return FriendQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<FriendDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    FriendDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<FriendDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Friend> snapshot;

  @override
  final List<FriendQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FriendDocumentSnapshot>> docChanges;
}

class FriendQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Friend>
    implements FriendDocumentSnapshot {
  FriendQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Friend> snapshot;

  @override
  final Friend data;

  @override
  FriendDocumentReference get reference {
    return FriendDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'] as String?,
      photo: json['photo'] as String?,
      language: json['language'] as String?,
      joinDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['joinDate'], const FirestoreDateTimeConverter().fromJson),
      friend: json['friend'] as int?,
      league: json['league'] as int?,
      countrycount: json['countrycount'] as int?,
      visitcount: json['visitcount'] as int?,
      distancetotal: json['distancetotal'] as int?,
      regioncount: json['regioncount'] as int?,
      placescount: json['placescount'] as int?,
      currentstreak: json['currentstreak'] as int?,
      lastRecordedDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastRecordedDate'],
          const FirestoreDateTimeConverter().fromJson),
    );

const _$UserProfileFieldMap = <String, String>{
  'id': 'id',
  'userId': 'userId',
  'email': 'email',
  'nickname': 'nickname',
  'avatar': 'avatar',
  'photo': 'photo',
  'language': 'language',
  'joinDate': 'joinDate',
  'friend': 'friend',
  'league': 'league',
  'countrycount': 'countrycount',
  'visitcount': 'visitcount',
  'distancetotal': 'distancetotal',
  'regioncount': 'regioncount',
  'placescount': 'placescount',
  'currentstreak': 'currentstreak',
  'lastRecordedDate': 'lastRecordedDate',
};

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'photo': instance.photo,
      'language': instance.language,
      'joinDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.joinDate, const FirestoreDateTimeConverter().toJson),
      'friend': instance.friend,
      'league': instance.league,
      'countrycount': instance.countrycount,
      'visitcount': instance.visitcount,
      'distancetotal': instance.distancetotal,
      'regioncount': instance.regioncount,
      'placescount': instance.placescount,
      'currentstreak': instance.currentstreak,
      'lastRecordedDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastRecordedDate, const FirestoreDateTimeConverter().toJson),
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

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      friendId: json['friendId'] as String?,
      friendNickname: json['friendNickname'] as String?,
      friendEmail: json['friendEmail'] as String?,
      friendAvatar: json['friendAvatar'] as String?,
      status: json['status'] as String?,
    );

const _$FriendFieldMap = <String, String>{
  'id': 'id',
  'userId': 'userId',
  'friendId': 'friendId',
  'friendNickname': 'friendNickname',
  'friendEmail': 'friendEmail',
  'friendAvatar': 'friendAvatar',
  'status': 'status',
};

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'friendId': instance.friendId,
      'friendNickname': instance.friendNickname,
      'friendEmail': instance.friendEmail,
      'friendAvatar': instance.friendAvatar,
      'status': instance.status,
    };

FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) =>
    FriendRequest(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      requesterId: json['requesterId'] as String?,
      requesterNickname: json['requesterNickname'] as String?,
      requesterEmail: json['requesterEmail'] as String?,
      requesterAvatar: json['requesterAvatar'] as String?,
      status: json['status'] as String?,
    );

const _$FriendRequestFieldMap = <String, String>{
  'id': 'id',
  'userId': 'userId',
  'requesterId': 'requesterId',
  'requesterNickname': 'requesterNickname',
  'requesterEmail': 'requesterEmail',
  'requesterAvatar': 'requesterAvatar',
  'status': 'status',
};

Map<String, dynamic> _$FriendRequestToJson(FriendRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'requesterId': instance.requesterId,
      'requesterNickname': instance.requesterNickname,
      'requesterEmail': instance.requesterEmail,
      'requesterAvatar': instance.requesterAvatar,
      'status': instance.status,
    };
