import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/helper/flutter_toast_fail.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/mobx/login/controller_password_store.dart';
import 'package:teste_ava/mobx/login/request_login_store.dart';
import 'package:teste_ava/router.dart';
import 'package:teste_ava/ui/widget/button_standard.dart';
import 'package:teste_ava/ui/login/not_account.dart';
import 'package:teste_ava/ui/login/widget_forgot_password.dart';
import 'package:teste_ava/ui/widget/widget_form_field_defaut.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    final controllerPasswordStore = Provider.of<ControllerPasswordStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: [
                WidgetFormFieldDefaut(
                  title: 'E-mail',
                  hintText: 'E-mail',
                  controller: controllerEmail,
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    final isValid = EmailValidator.validate(value ?? '');
                    if (value?.isEmpty ?? true) {
                      return 'É obrigatorio informar o email';
                    } else if (!isValid) {
                      return 'E-mail informado é invalido';
                    }
                    return null;
                  },
                ),
                Observer(
                  builder: (_) {
                    return WidgetFormFieldDefaut(
                      title: 'Senha',
                      hintText: '******',
                      controller: controllerPassword,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      actionObscureText: controllerPasswordStore.changeIsVisible,
                      suffixIconVisibility: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                      suffixIconVisibilityOff: const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      ),
                      isObscureText: controllerPasswordStore.isVisiblePassword,
                      isVisibleSuffix: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'É obrigatorio informar a senha';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'A senha deve conter no minimo 6 caracteres';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const WidgetForgotPassword()
              ],
            ),
            ButtonStandard(
              onPressed: () => actionButton(),
              title: 'Login',
            ),
            const NotAccount(),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Future<void> actionButton() async {
    final requestLogin = Provider.of<RequestLoginStore>(context, listen: false);
    
    if (formKey.currentState!.validate()) {
      final email = controllerEmail.text;
      final password = controllerPassword.text;

      final result = await requestLogin.login(email: email, password: password);
      if (StatusLoad.success == result.statusLoad) {
        if (context.mounted){
          Navigator.pushReplacementNamed(context,AppRouter.addressPage);
        }
      } else {
        flutterToastFail(status: result.statusLoad);
      }
    }
  }
}
