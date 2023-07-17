import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teste_ava/colors.dart';
import 'package:teste_ava/helper/status_loading.dart';

void flutterToastFail({required StatusLoad? status, String? text}) {
  Fluttertoast.showToast(
    msg: verificFail(statusLoad: status, text: text),
    backgroundColor: Colors.grey[200],
    textColor: AvaColor.appPrimarySwatch,
    toastLength: Toast.LENGTH_SHORT,
  );
}

String verificFail({StatusLoad? statusLoad, String? text}) {
  switch (statusLoad) {
    case StatusLoad.failedServe:
      return 'Ocorreu um erro no servidor';
    case StatusLoad.authenticationFailure:
      return 'E-mail e/ou senha incorreta';
    case StatusLoad.failed:
      return text ?? 'Ocorreu um erro';
    case StatusLoad.existingUser:
      return 'Já existe um usuario com esse e-mail';
    case StatusLoad.reportedDataError:
      return text ?? '';
    default: 
  }
  return '';
}
