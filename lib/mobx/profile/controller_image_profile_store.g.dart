// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_image_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerImageProfileStore on ControllerImageProfileStoreBase, Store {
  late final _$localImageAtom = Atom(
      name: 'ControllerImageProfileStoreBase.localImage', context: context);

  @override
  String get localImage {
    _$localImageAtom.reportRead();
    return super.localImage;
  }

  @override
  set localImage(String value) {
    _$localImageAtom.reportWrite(value, super.localImage, () {
      super.localImage = value;
    });
  }

  late final _$isErroLoadAtom = Atom(
      name: 'ControllerImageProfileStoreBase.isErroLoad', context: context);

  @override
  bool get isErroLoad {
    _$isErroLoadAtom.reportRead();
    return super.isErroLoad;
  }

  @override
  set isErroLoad(bool value) {
    _$isErroLoadAtom.reportWrite(value, super.isErroLoad, () {
      super.isErroLoad = value;
    });
  }

  late final _$ControllerImageProfileStoreBaseActionController =
      ActionController(
          name: 'ControllerImageProfileStoreBase', context: context);

  @override
  void changeLocalImage(String image) {
    final _$actionInfo = _$ControllerImageProfileStoreBaseActionController
        .startAction(name: 'ControllerImageProfileStoreBase.changeLocalImage');
    try {
      return super.changeLocalImage(image);
    } finally {
      _$ControllerImageProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErroLoad() {
    final _$actionInfo = _$ControllerImageProfileStoreBaseActionController
        .startAction(name: 'ControllerImageProfileStoreBase.changeErroLoad');
    try {
      return super.changeErroLoad();
    } finally {
      _$ControllerImageProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
localImage: ${localImage},
isErroLoad: ${isErroLoad}
    ''';
  }
}
