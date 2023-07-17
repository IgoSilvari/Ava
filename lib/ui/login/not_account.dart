import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teste_ava/colors.dart';
import 'package:teste_ava/router.dart';

class NotAccount extends StatelessWidget {
  const NotAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        text: 'Não tem uma conta? ',
        style: const TextStyle(
          color: AvaColor.appPrimarySwatch,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: 'SignUp',
            style: const TextStyle(
              color: AvaColor.appPrimarySwatch,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => callRegister(context),
          ),
        ],
      ),
    );
  }

  void callRegister(context){
    Navigator.of(context).pushReplacementNamed(AppRouter.registerPage);
  }
}
