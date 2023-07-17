// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaveAddressStore on SaveAddressStoreBase, Store {
  Computed<bool>? _$isExecutionComputed;

  @override
  bool get isExecution =>
      (_$isExecutionComputed ??= Computed<bool>(() => super.isExecution,
              name: 'SaveAddressStoreBase.isExecution'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: 'SaveAddressStoreBase.isSuccess'))
          .value;
  Computed<bool>? _$isFailComputed;

  @override
  bool get isFail => (_$isFailComputed ??= Computed<bool>(() => super.isFail,
          name: 'SaveAddressStoreBase.isFail'))
      .value;

  late final _$statusLoadAtom =
      Atom(name: 'SaveAddressStoreBase.statusLoad', context: context);

  @override
  StatusLoad get statusLoad {
    _$statusLoadAtom.reportRead();
    return super.statusLoad;
  }

  @override
  set statusLoad(StatusLoad value) {
    _$statusLoadAtom.reportWrite(value, super.statusLoad, () {
      super.statusLoad = value;
    });
  }

  late final _$saveAddressAsyncAction =
      AsyncAction('SaveAddressStoreBase.saveAddress', context: context);

  @override
  Future<StatusLoad> saveAddress({required AddressModel address}) {
    return _$saveAddressAsyncAction
        .run(() => super.saveAddress(address: address));
  }

  late final _$updateAddressAsyncAction =
      AsyncAction('SaveAddressStoreBase.updateAddress', context: context);

  @override
  Future<StatusLoad> updateAddress({required AddressModel address}) {
    return _$updateAddressAsyncAction
        .run(() => super.updateAddress(address: address));
  }

  late final _$removeAddressAsyncAction =
      AsyncAction('SaveAddressStoreBase.removeAddress', context: context);

  @override
  Future<StatusLoad> removeAddress({required AddressModel address}) {
    return _$removeAddressAsyncAction
        .run(() => super.removeAddress(address: address));
  }

  @override
  String toString() {
    return '''
statusLoad: ${statusLoad},
isExecution: ${isExecution},
isSuccess: ${isSuccess},
isFail: ${isFail}
    ''';
  }
}
