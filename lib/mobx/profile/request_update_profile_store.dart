import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/database/user_dao/user_dao.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/model/user_model.dart';
import 'package:teste_ava/router.dart';
part 'request_update_profile_store.g.dart';

class RequestUpdateProfileStore = _RequestUpdateProfileStoreBase with _$RequestUpdateProfileStore;

abstract class _RequestUpdateProfileStoreBase with Store {
  
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail => !isExecution && !isSuccess && statusLoad != StatusLoad.none;


   @action
  Future<StatusLoad> updateAddress({required UserModel user}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    statusLoad = await UserDao().updateDataUser(user: user);
    if(statusLoad == StatusLoad.success){
      updateUserData(user);
    }
    return statusLoad;
  }

  @action
  Future<void> updateUserData(UserModel? user)async{
    final context = AppRouter.navigatorKey.currentContext;
    Provider.of<DataUserLoggedStore>(context!, listen: false).changeUser(user);
  }
}