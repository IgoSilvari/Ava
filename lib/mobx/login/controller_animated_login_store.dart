import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ava/router.dart';
part 'controller_animated_login_store.g.dart';

class ControllerAnimatedLoginStore = ControllerAnimatedLoginStoreBase with _$ControllerAnimatedLoginStore;

abstract class ControllerAnimatedLoginStoreBase with Store { 


  //Controlar a animação do card
  @observable
  bool heightCard = false;

  @computed
  double get isTrue => heightCard ? MediaQuery.sizeOf(AppRouter.navigatorKey.currentContext!).height - (height + 30) : 0;

  final height = MediaQuery.sizeOf(AppRouter.navigatorKey.currentContext!).height * 0.2;

  @action
  void changeHeightCard() => heightCard = !heightCard;

  @observable
  bool isUploadCompletion = false;
 
  @action
  void changeIsVisibleBackground( ) => isUploadCompletion = !isUploadCompletion;

}