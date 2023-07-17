import 'package:mobx/mobx.dart';
import 'package:teste_ava/database/address_dao/address_dao.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/model/address_model.dart';

part 'list_address_save_store.g.dart';

class ListAddressSaveStore = ListAddressSaveStoreBase with _$ListAddressSaveStore;

abstract class ListAddressSaveStoreBase with Store {
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail => !isExecution && !isSuccess && statusLoad != StatusLoad.none;

  ObservableList<AddressModel> addressList = ObservableList.of([]);

  @action
  Future<StatusLoad> savedAddresses({required int idUser}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(seconds: 3));
    final addresses = await AddressDao().findAllUserAddresses(userId: idUser);
    addressList.clear();
    for (AddressModel element in addresses) {
      addressList.add(element);
    }
    statusLoad = StatusLoad.success;
    return statusLoad;
  }
}