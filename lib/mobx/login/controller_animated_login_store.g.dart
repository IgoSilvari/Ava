// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_animated_login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerAnimatedLoginStore
    on ControllerAnimatedLoginStoreBase, Store {
  Computed<double>? _$isTrueComputed;

  @override
  double get isTrue =>
      (_$isTrueComputed ??= Computed<double>(() => super.isTrue,
              name: 'ControllerAnimatedLoginStoreBase.isTrue'))
          .value;

  late final _$heightCardAtom = Atom(
      name: 'ControllerAnimatedLoginStoreBase.heightCard', context: context);

  @override
  bool get heightCard {
    _$heightCardAtom.reportRead();
    return super.heightCard;
  }

  @override
  set heightCard(bool value) {
    _$heightCardAtom.reportWrite(value, super.heightCard, () {
      super.heightCard = value;
    });
  }

  late final _$isUploadCompletionAtom = Atom(
      name: 'ControllerAnimatedLoginStoreBase.isUploadCompletion',
      context: context);

  @override
  bool get isUploadCompletion {
    _$isUploadCompletionAtom.reportRead();
    return super.isUploadCompletion;
  }

  @override
  set isUploadCompletion(bool value) {
    _$isUploadCompletionAtom.reportWrite(value, super.isUploadCompletion, () {
      super.isUploadCompletion = value;
    });
  }

  late final _$ControllerAnimatedLoginStoreBaseActionController =
      ActionController(
          name: 'ControllerAnimatedLoginStoreBase', context: context);

  @override
  void changeHeightCard() {
    final _$actionInfo = _$ControllerAnimatedLoginStoreBaseActionController
        .startAction(name: 'ControllerAnimatedLoginStoreBase.changeHeightCard');
    try {
      return super.changeHeightCard();
    } finally {
      _$ControllerAnimatedLoginStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsVisibleBackground() {
    final _$actionInfo =
        _$ControllerAnimatedLoginStoreBaseActionController.startAction(
            name: 'ControllerAnimatedLoginStoreBase.changeIsVisibleBackground');
    try {
      return super.changeIsVisibleBackground();
    } finally {
      _$ControllerAnimatedLoginStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heightCard: ${heightCard},
isUploadCompletion: ${isUploadCompletion},
isTrue: ${isTrue}
    ''';
  }
}
