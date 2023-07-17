import 'package:mobx/mobx.dart';
import 'package:teste_ava/database/address_dao/address_dao.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/model/address_model.dart';
part 'save_address_store.g.dart';

class SaveAddressStore = SaveAddressStoreBase with _$SaveAddressStore;

abstract class SaveAddressStoreBase with Store {
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail => !isExecution && !isSuccess && statusLoad != StatusLoad.none;

  @action
  Future<StatusLoad> saveAddress({required AddressModel address}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    statusLoad = await AddressDao().save(address);
    return statusLoad;
  }

  @action
  Future<StatusLoad> updateAddress({required AddressModel address}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    statusLoad = await AddressDao().updateAddress(address: address);
    return statusLoad;
  }

  @action
  Future<StatusLoad> removeAddress({required AddressModel address}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    statusLoad = await AddressDao().removeAddress(address.id!);
    return statusLoad;
  }
}
