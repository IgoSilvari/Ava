// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerPasswordStore on ControllerPasswordStoreBase, Store {
  late final _$isVisiblePasswordAtom = Atom(
      name: 'ControllerPasswordStoreBase.isVisiblePassword', context: context);

  @override
  bool get isVisiblePassword {
    _$isVisiblePasswordAtom.reportRead();
    return super.isVisiblePassword;
  }

  @override
  set isVisiblePassword(bool value) {
    _$isVisiblePasswordAtom.reportWrite(value, super.isVisiblePassword, () {
      super.isVisiblePassword = value;
    });
  }

  late final _$isVisibleConfirmPasswordAtom = Atom(
      name: 'ControllerPasswordStoreBase.isVisibleConfirmPassword',
      context: context);

  @override
  bool get isVisibleConfirmPassword {
    _$isVisibleConfirmPasswordAtom.reportRead();
    return super.isVisibleConfirmPassword;
  }

  @override
  set isVisibleConfirmPassword(bool value) {
    _$isVisibleConfirmPasswordAtom
        .reportWrite(value, super.isVisibleConfirmPassword, () {
      super.isVisibleConfirmPassword = value;
    });
  }

  late final _$ControllerPasswordStoreBaseActionController =
      ActionController(name: 'ControllerPasswordStoreBase', context: context);

  @override
  void changeIsVisible() {
    final _$actionInfo = _$ControllerPasswordStoreBaseActionController
        .startAction(name: 'ControllerPasswordStoreBase.changeIsVisible');
    try {
      return super.changeIsVisible();
    } finally {
      _$ControllerPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsVisibleConfirm() {
    final _$actionInfo =
        _$ControllerPasswordStoreBaseActionController.startAction(
            name: 'ControllerPasswordStoreBase.changeIsVisibleConfirm');
    try {
      return super.changeIsVisibleConfirm();
    } finally {
      _$ControllerPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisiblePassword: ${isVisiblePassword},
isVisibleConfirmPassword: ${isVisibleConfirmPassword}
    ''';
  }
}
