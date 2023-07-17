import 'package:mobx/mobx.dart';

part 'controller_password_store.g.dart';

class ControllerPasswordStore = ControllerPasswordStoreBase with _$ControllerPasswordStore;

abstract class ControllerPasswordStoreBase with Store {

  
  //Controlar visualização da senha
  
  @observable
  bool isVisiblePassword = true;
 
  @action
  void changeIsVisible( ) => isVisiblePassword = !isVisiblePassword;


  
  //Controlar visualização da senha
  
  @observable
  bool isVisibleConfirmPassword = true;
 
  @action
  void changeIsVisibleConfirm( ) => isVisibleConfirmPassword = !isVisibleConfirmPassword;
  
}