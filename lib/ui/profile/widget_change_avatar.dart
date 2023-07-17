import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/colors.dart';
import 'package:teste_ava/helper/flutter_toast.dart';
import 'package:teste_ava/helper/models_utils.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/mobx/profile/controller_image_profile_store.dart';

class WidgetChangeAvatar extends StatelessWidget {
  const WidgetChangeAvatar({
    this.raiusMain = 50,
    this.raiusSecundary = 48,
    this.isVisibleSelectImage = true,
    super.key});

  final double raiusMain;
  final double raiusSecundary;
  final bool isVisibleSelectImage;

  @override
  Widget build(BuildContext context) {
    final controllerImageProfile = Provider.of<ControllerImageProfileStore>(context, listen: false);
    final dataUserLogged = Provider.of<DataUserLoggedStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Stack(
          children: [
            CircleAvatar(
              radius: raiusMain,
              backgroundColor: AvaColor.defaultRedColor,
              child: Visibility(
                visible: controllerImageProfile.localImage.isNotEmpty,
                replacement: Visibility(
                  visible: dataUserLogged.isNotEmptyImage,
                  replacement: CircleAvatar(
                    radius: raiusSecundary,
                    backgroundColor: AvaColor.appPrimarySwatch,
                    child: Text(
                      ModelsUtils.userNameInitials(
                        name: dataUserLogged.userData?.name ?? '',
                      ),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: raiusSecundary,
                    backgroundImage: FileImage(
                      File(
                        dataUserLogged.userData?.picture ?? '',
                      ),
                    ),
                    onBackgroundImageError: (exception, stackTrace) {
                      controllerImageProfile.changeErroLoad();
                    },
                    child: Visibility(
                      visible: controllerImageProfile.isErroLoad,
                      child: Text(
                        ModelsUtils.userNameInitials(
                          name: dataUserLogged.userData?.name ?? '',
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: raiusSecundary,
                  backgroundImage: FileImage(
                    File(
                      controllerImageProfile.localImage,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleSelectImage,
              child: Positioned(
                right: -2,
                bottom: -10,
                child: IconButton(
                  onPressed: () => actinButton(context),
                  icon: Icon(
                    Icons.photo_camera,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> actinButton(context) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      final controllerImage = Provider.of<ControllerImageProfileStore>(context, listen: false);

      controllerImage.changeLocalImage(result.files[0].path!);

      final PlatformFile inforFile = result.files.first;
      if (inforFile.size > 9291456) {
        flutterToast(title: 'O tamanho maximo é 10M');
      } 
    }
  }
}
