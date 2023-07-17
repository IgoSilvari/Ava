import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/colors.dart';
import 'package:teste_ava/helper/models_utils.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/ui/profile/widget_change_avatar.dart';

class DrawerHeaderApp extends StatelessWidget {
  const DrawerHeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataUserLogged = Provider.of<DataUserLoggedStore>(context, listen: false);
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: AvaColor.linearGradient,
      ),
      child: Observer(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetChangeAvatar(
                raiusMain: 32,
                raiusSecundary: 30,
                isVisibleSelectImage: false,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  ModelsUtils.userFirstAndSecondName(
                    name: dataUserLogged.userData?.name ?? '',
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                dataUserLogged.userData?.email ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
