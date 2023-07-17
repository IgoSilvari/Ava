import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/helper/flutter_toast.dart';
import 'package:teste_ava/helper/flutter_toast_fail.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/mobx/profile/controller_image_profile_store.dart';
import 'package:teste_ava/mobx/profile/request_update_profile_store.dart';
import 'package:teste_ava/model/user_model.dart';
import 'package:teste_ava/ui/profile/widget_change_avatar.dart';
import 'package:teste_ava/ui/widget/background_defaut.dart';
import 'package:teste_ava/ui/widget/button_standard.dart';
import 'package:teste_ava/ui/widget/overlay_loading_standard.dart';
import 'package:teste_ava/ui/widget/widget_form_field_defaut.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    loadDataUser();
    super.initState();
  }

  void loadDataUser() {
    final dataUserLogged = Provider.of<DataUserLoggedStore>(context, listen: false);
    UserModel? user = dataUserLogged.userData;
    controllerName = TextEditingController(text: user?.name ?? '');
    controllerEmail = TextEditingController(text: user?.email ?? '');
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateProfile = Provider.of<RequestUpdateProfileStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Scaffold(
          body: OverlayLoadingStandard(
            isVisible: updateProfile.isExecution,
            child: BackgraundDefaut(
              title: 'Perfil',
              top: 50,
              onPressedLeading: () => Navigator.pop(context),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          WidgetChangeAvatar(),
                          WidgetFormFieldDefaut(
                            title: 'Nome',
                            hintText: 'Informe seu nome',
                            controller: controllerName,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'É obrigatorio informar um nome';
                              }
                              return null;
                            },
                          ),
                          WidgetFormFieldDefaut(
                            title: 'E-mail',
                            hintText: 'E-mail',
                            controller: controllerEmail,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 130, bottom: 10),
                        child: ButtonStandard(
                          onPressed: () => actionButton(),
                          title: 'Salvar',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> actionButton() async {
    final controllerImageProfile = Provider.of<ControllerImageProfileStore>(context, listen: false);
    final updateProfile = Provider.of<RequestUpdateProfileStore>(context, listen: false);
    final dataUserLogged = Provider.of<DataUserLoggedStore>(context, listen: false);

    if (formkey.currentState!.validate()) {
      bool isNotEmpty = controllerImageProfile.localImage.isNotEmpty;
      final statusLoad = await updateProfile.updateAddress(
        user: UserModel(
          id: dataUserLogged.userData!.id!,
          email: controllerEmail.text,
          name: controllerName.text,
          picture: isNotEmpty ? controllerImageProfile.localImage : dataUserLogged.userData?.picture ?? '',
        ),
      );
       if (statusLoad == StatusLoad.success) {
          flutterToast(title: 'Dados atualizados com sucesso');
      } else {
        flutterToastFail(status: statusLoad,text: 'Ocorreu um erro na atualização');
      }
    }
  }
}
