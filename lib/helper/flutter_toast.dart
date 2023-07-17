import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teste_ava/colors.dart';

void flutterToast({required String? title, Color? backgroundColor, ToastGravity? gravity}) {
  final Color? newColor = backgroundColor ??  Colors.grey[200];
  Fluttertoast.showToast(
    msg: title ?? '',
    backgroundColor: newColor,
    textColor: AvaColor.appPrimarySwatch,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity
  );
}
