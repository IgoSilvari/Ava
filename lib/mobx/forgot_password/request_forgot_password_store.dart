import 'package:mobx/mobx.dart';
import 'package:teste_ava/database/user_dao/user_dao.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/model/user_model.dart';
part 'request_forgot_password_store.g.dart';

class RequestForgotPPasswordStore = _RequestForgotPPasswordStoreBase
    with _$RequestForgotPPasswordStore;

abstract class _RequestForgotPPasswordStoreBase with Store {
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail =>
      !isExecution && !isSuccess && statusLoad != StatusLoad.none;

  @action
  Future<StatusLoad> verificEmailExist({required String email}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    final isContains = await UserDao().checkEmailUsed(valueSearch: email);
    if (isContains) {
      statusLoad = StatusLoad.success;
      return statusLoad;
    } else {
      statusLoad = StatusLoad.failed;
      return statusLoad;
    }
  }

  @action
  Future<StatusLoad> recoveryPassword({required UserModel user}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    statusLoad = await UserDao().updatePassword(user: user);
    return statusLoad;
  }
}
