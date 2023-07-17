import 'package:mobx/mobx.dart';
import 'package:teste_ava/model/user_model.dart';
part 'data_user_logged_store.g.dart';

class DataUserLoggedStore = DataUserLoggedStoreBase with _$DataUserLoggedStore;

abstract class DataUserLoggedStoreBase with Store {

  @observable
  UserModel? userData;
  
  @computed
  bool get isNotEmptyImage => userData?.picture?.isNotEmpty == true && userData?.picture != null;

  @computed
  String get urlImage => isNotEmptyImage ? userData!.picture! : '';

  @action
  void changeUser(UserModel? user) => userData = user;  
  
  @action
  void cleanUserData() => userData = null; 
}