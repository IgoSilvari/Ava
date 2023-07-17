// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_logged_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataUserLoggedStore on DataUserLoggedStoreBase, Store {
  Computed<bool>? _$isNotEmptyImageComputed;

  @override
  bool get isNotEmptyImage =>
      (_$isNotEmptyImageComputed ??= Computed<bool>(() => super.isNotEmptyImage,
              name: 'DataUserLoggedStoreBase.isNotEmptyImage'))
          .value;
  Computed<String>? _$urlImageComputed;

  @override
  String get urlImage =>
      (_$urlImageComputed ??= Computed<String>(() => super.urlImage,
              name: 'DataUserLoggedStoreBase.urlImage'))
          .value;

  late final _$userDataAtom =
      Atom(name: 'DataUserLoggedStoreBase.userData', context: context);

  @override
  UserModel? get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(UserModel? value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  late final _$DataUserLoggedStoreBaseActionController =
      ActionController(name: 'DataUserLoggedStoreBase', context: context);

  @override
  void changeUser(UserModel? user) {
    final _$actionInfo = _$DataUserLoggedStoreBaseActionController.startAction(
        name: 'DataUserLoggedStoreBase.changeUser');
    try {
      return super.changeUser(user);
    } finally {
      _$DataUserLoggedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanUserData() {
    final _$actionInfo = _$DataUserLoggedStoreBaseActionController.startAction(
        name: 'DataUserLoggedStoreBase.cleanUserData');
    try {
      return super.cleanUserData();
    } finally {
      _$DataUserLoggedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userData: ${userData},
isNotEmptyImage: ${isNotEmptyImage},
urlImage: ${urlImage}
    ''';
  }
}
