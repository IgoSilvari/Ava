import 'package:mobx/mobx.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/model/address_model.dart';
import 'package:teste_ava/repository/search_address_repository.dart';

part 'request_data_address_store.g.dart';

class RequestDataAddressStore = RequestDataAddressStoreBase with _$RequestDataAddressStore;

abstract class RequestDataAddressStoreBase with Store {
  SearchAddressRepository searchAddressRepository = const SearchAddressRepository();

  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail => !isExecution && !isSuccess && statusLoad != StatusLoad.none;

  Future<AddressModel?> searchAddress({required String cep})async{
    statusLoad = StatusLoad.executing;
    final result = await searchAddressRepository.address(cep: cep.replaceAll('.', '').replaceAll('-',''));
    statusLoad = verificLoading(result?.statusCode); 
    return result?.body;
  }
}