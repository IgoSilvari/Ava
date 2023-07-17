import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/mobx/address/list_address_save_store.dart';
import 'package:teste_ava/mobx/address/request_data_address_store.dart';
import 'package:teste_ava/mobx/address/save_address_store.dart';
import 'package:teste_ava/mobx/forgot_password/request_forgot_password_store.dart';
import 'package:teste_ava/mobx/login/controller_animated_login_store.dart';
import 'package:teste_ava/mobx/login/controller_password_store.dart';
import 'package:teste_ava/mobx/login/request_login_store.dart';
import 'package:teste_ava/mobx/profile/controller_image_profile_store.dart';
import 'package:teste_ava/mobx/profile/request_update_profile_store.dart';
import 'package:teste_ava/mobx/register/request_register_user_store.dart';
import 'package:teste_ava/model/address_model.dart';
import 'package:teste_ava/ui/address/add_address/add_address_page.dart';
import 'package:teste_ava/ui/address/address_page.dart';
import 'package:teste_ava/ui/login/forgot_password/forgot_password_page.dart';
import 'package:teste_ava/ui/login/forgot_password/recovery_instructions_screen.dart';
import 'package:teste_ava/ui/login/login_page.dart';
import 'package:teste_ava/ui/profile/profile_page.dart';
import 'package:teste_ava/ui/register/register_page.dart';

abstract class Router {
  Route<dynamic> generateRoute(RouteSettings settings);
}

class AppRouter extends Router {
  static const loginPage = '/loginPage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const registerPage = '/registerPage';
  static const recoveryInstructionsPage = '/recoveryInstructionsPage';
  static const addressPage = '/addressPage';
  static const addAddressPage = '/addAddressPage';
  static const profilePage = '/profilePage';

  @override
  Route generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case loginPage:
        builder = (BuildContext _) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ControllerAnimatedLoginStore()),
              Provider(create: (_) => ControllerPasswordStore()),
              Provider(create: (_) => RequestLoginStore()),
            ],
            child: const LoginPage(),
          );
        };
      case forgotPasswordPage:
        builder = (context) {
          return Provider(
            create: (_) => RequestForgotPPasswordStore(),
            child: ForgotPasswordPage(),
          );
        };
        break;
      case recoveryInstructionsPage:
        builder = (context) {
          return Provider(
            create: (_) => RequestForgotPPasswordStore(),
            child:
                RecoveryInstructionsPage(email: settings.arguments as String),
          );
        };
        break;
      case registerPage:
        builder = (BuildContext _) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ControllerAnimatedLoginStore()),
              Provider(create: (_) => ControllerPasswordStore()),
              Provider(create: (_) => RequestRegisterUserStore()),
            ],
            child: const RegisterPage(),
          );
        };
        break;
      case addressPage:
        builder = (context) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ListAddressSaveStore()),
              Provider(create: (_) => ControllerImageProfileStore()),              
            ],
            child: const AddressPage(),
          );
        };
        break;
      case addAddressPage:
        builder = (context) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => RequestDataAddressStore()),
              Provider(create: (_) => SaveAddressStore()),
            ],
            child: AddAddressPage(
              addressModel: settings.arguments as AddressModel?,
            ),
          );
        };
        break;
      case profilePage:
        builder = (context) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ControllerImageProfileStore()),
              Provider(create: (_) => RequestUpdateProfileStore()),              
            ],
            child: ProfilePage(),
          );
        };
      default:
        throw UnimplementedError('Invalid router: ${settings.name}');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }

  static final navigatorKey = GlobalKey<NavigatorState>();
}
