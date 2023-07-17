import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/model/keyword_shared_preferences.dart';
import 'package:teste_ava/router.dart';
import 'package:teste_ava/ui/drawer/drawer_header_app.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawerHeaderApp(),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.grey.shade700,
                ),
                title: Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(AppRouter.profilePage);
                }
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
                color: Colors.grey.shade700,
              ),
              title: Text(
                'Sair',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade700,
                ),
              ),
              onTap: () => actionButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> actionButton(context) async {
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(KeywordShared.idUser.name);
    dataUserLogged.cleanUserData();
    Navigator.pop(context);
    Navigator.of(context).pushReplacementNamed(AppRouter.loginPage);
  }
}
