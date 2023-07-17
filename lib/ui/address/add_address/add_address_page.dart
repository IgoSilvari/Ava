import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/database/address_dao/address_dao.dart';
import 'package:teste_ava/helper/flutter_toast.dart';
import 'package:teste_ava/helper/flutter_toast_fail.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/mobx/address/request_data_address_store.dart';
import 'package:teste_ava/mobx/address/save_address_store.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/model/address_model.dart';
import 'package:teste_ava/ui/address/add_address/register_form.dart';
import 'package:teste_ava/ui/widget/background_defaut.dart';
import 'package:teste_ava/ui/widget/button_standard.dart';
import 'package:teste_ava/ui/widget/overlay_loading_standard.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({this.addressModel, super.key});

  final AddressModel? addressModel;

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  late TextEditingController controllerCep;
  late TextEditingController controllerstreet;
  late TextEditingController controllerComplement;
  late TextEditingController controllerNeighborhood;
  late TextEditingController controllerCity;
  late TextEditingController controllerState;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    controllerCep.dispose();
    controllerstreet.dispose();
    controllerComplement.dispose();
    controllerNeighborhood.dispose();
    controllerCity.dispose();
    controllerState.dispose();
    super.dispose();
  }

  void initController() {
    controllerCep = TextEditingController(
      text: widget.addressModel?.cep ?? '',
    );
    controllerstreet = TextEditingController(
      text: widget.addressModel?.logradouro ?? '',
    );
    controllerComplement = TextEditingController(
      text: widget.addressModel?.complemento ?? '',
    );
    controllerNeighborhood = TextEditingController(
      text: widget.addressModel?.bairro ?? '',
    );
    controllerCity = TextEditingController(
      text: widget.addressModel?.cidade ?? '',
    );
    controllerState = TextEditingController(
      text: widget.addressModel?.uf ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final requestAddress = Provider.of<RequestDataAddressStore>(context, listen: false);
    final saveAddress = Provider.of<SaveAddressStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Scaffold(
          body: OverlayLoadingStandard(
            isVisible: requestAddress.isExecution || saveAddress.isExecution,
            child: BackgraundDefaut(
              title: verificTitle(),
              onPressedLeading: () => Navigator.pop(context),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      RegisterForm(
                        controllerCep: controllerCep,
                        controllerstreet: controllerstreet,
                        controllerComplement: controllerComplement,
                        controllerNeighborhood: controllerNeighborhood,
                        controllerCity: controllerCity,
                        controllerState: controllerState,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          bottom: 90,
                        ),
                        child: ButtonStandard(
                          onPressed: () {
                            if (isNotNull()) {
                              actionButtonUpdate();
                            } else {
                              actionButtonSave();
                            }
                          },
                          title: isNotNull() ? 'Atualizar' : 'Cadastrar',
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

  bool isNotNull() {
    return widget.addressModel != null;
  }

  String verificTitle() {
    bool isTrue = widget.addressModel != null;
    return isTrue ? 'Editar Endereço' : 'Adicionar Endereço';
  }

  Future<void> actionButtonSave() async {
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    final saveAddress = Provider.of<SaveAddressStore>(context, listen: false);

    if (formkey.currentState!.validate()) {
      final listAddress = await AddressDao().findAll();
      final statusLoad = await saveAddress.saveAddress(
        address: AddressModel(
          id: listAddress.length + 1,
          userId: dataUserLogged.userData!.id!,
          cep: controllerCep.text,
          logradouro: controllerstreet.text,
          complemento: controllerComplement.text,
          bairro: controllerNeighborhood.text,
          cidade: controllerCity.text,
          uf: controllerState.text,
        ),
      );
      if (statusLoad == StatusLoad.success) {
        if (context.mounted) {
          Navigator.pop(context, true);
          flutterToast(title: 'Endereço cadastrado com sucesso');
        }
      } else {
        flutterToastFail(status: statusLoad);
      }
    }
  }

  Future<void> actionButtonUpdate() async {
    final saveAddress = Provider.of<SaveAddressStore>(context, listen: false);

    if (formkey.currentState!.validate()) {
      final statusLoad = await saveAddress.updateAddress(
        address: AddressModel(
          id: widget.addressModel!.id!,
          userId: widget.addressModel!.userId,
          cep: controllerCep.text,
          logradouro: controllerstreet.text,
          complemento: controllerComplement.text,
          bairro: controllerNeighborhood.text,
          cidade: controllerCity.text,
          uf: controllerState.text,
        ),
      );
      if (statusLoad == StatusLoad.success) {
        if (context.mounted) {
          Navigator.pop(context, true);
          flutterToast(
            title: 'Endereço atualizado com sucesso',
          );
        }
      } else {
        flutterToastFail(
          status: statusLoad,
          text: 'Ocorreu um erro com a atualização',
        );
      }
    }
  }
}
