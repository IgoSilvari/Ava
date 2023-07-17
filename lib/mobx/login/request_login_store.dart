import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_ava/database/user_dao/user_dao.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/model/keyword_shared_preferences.dart';
import 'package:teste_ava/model/return_validate_credential.dart';
import 'package:teste_ava/model/user_model.dart';
import 'package:teste_ava/router.dart';
part 'request_login_store.g.dart';

class RequestLoginStore = RequestLoginStoreBase with _$RequestLoginStore;

abstract class RequestLoginStoreBase with Store {
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail => !isExecution && !isSuccess && statusLoad != StatusLoad.none;

  @action
  Future<DataValidateCredential> login({required String email, required String password}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    final result = await UserDao().validateCredentials(email: email, password: password);
    if(result.isContains ?? false){
      updateUserData(result.user);
      statusLoad = StatusLoad.success;
      result.statusLoad = statusLoad;
      return result;
    }else{
      statusLoad = StatusLoad.authenticationFailure;
      result.statusLoad = statusLoad;
      return result;
    }
  }

  @action
  Future<void> updateUserData(UserModel? user)async{
    final context = AppRouter.navigatorKey.currentContext;
    final prefs = await SharedPreferences.getInstance();     
    prefs.setInt(KeywordShared.idUser.name, user?.id ?? 0);
    Provider.of<DataUserLoggedStore>(context!, listen: false).changeUser(user);
  }
}