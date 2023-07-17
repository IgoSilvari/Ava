import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/helper/flutter_toast.dart';
import 'package:teste_ava/helper/flutter_toast_fail.dart';
import 'package:teste_ava/helper/open_link.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/mobx/address/save_address_store.dart';
import 'package:teste_ava/model/address_model.dart';
import 'package:teste_ava/router.dart';
import 'package:teste_ava/ui/address/view_address/address_description.dart';
import 'package:teste_ava/ui/address/view_address/icon_button_map.dart';

class ViewMapPage extends StatefulWidget {
  const ViewMapPage._init({required this.address, required this.onPressed});

  final AddressModel address;
  final void Function()? onPressed;

  @override
  State<ViewMapPage> createState() => _ViewMapPageState();

  static Future<T?> show<T>({
    required BuildContext context,
    required AddressModel address,
    required void Function()? onPressed,
  }) {
    return showDialog<T>(
      context: context,
      useRootNavigator: true,
      barrierColor: Colors.grey.withOpacity(0.8),
      builder: (context) {
        return Provider(
          create: (_) => SaveAddressStore(),
          child: ViewMapPage._init(address: address, onPressed: onPressed),
        );
      },
    );
  }
}

class _ViewMapPageState extends State<ViewMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Lottie.asset('assets/animation/map.json'),
                        ),
                      ),
                      Column(
                        children: [
                          IconButtonMap(
                            onPressed: openLocation,
                            icons: Icons.map,
                          ),
                          IconButtonMap(
                            onPressed: editAddress,
                            icons: Icons.edit,
                          ),
                          IconButtonMap(
                            onPressed: removeAddress,
                            icons: Icons.delete,
                          ),
                        ],
                      )
                    ],
                  ),
                  DescriptionAddress(address: widget.address),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
              color: Colors.red,
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }

  void openLocation() {
    final street = widget.address.logradouro ?? '';
    final city = widget.address.cidade ?? '';
    final complement = widget.address.complemento ?? '';
    final cep = widget.address.cep ?? '';
    final state = widget.address.uf ?? '';
    final address =
        '$street, $complement - $city, $state, ${cep.replaceAll('.', '')}';

    openUrl(
      context: context,
      url: 'https://www.google.com/maps/search/$address',
    );
  }

  Future<void> editAddress() async {
    final isTrue = await Navigator.of(context).pushReplacementNamed(
      AppRouter.addAddressPage,
      arguments: widget.address,
    );
    if (isTrue == true) {
      widget.onPressed!();
    }
  }

  void removeAddress() {
    final saveAddress = Provider.of<SaveAddressStore>(context, listen: false);
    saveAddress.removeAddress(address: widget.address).then((statusLoad) {
      if (statusLoad == StatusLoad.success) {
        Navigator.pop(context, true);
        widget.onPressed!();
        flutterToast(
          title: 'Endereço deletado com sucesso',
        );
      } else {
        flutterToastFail(
          status: statusLoad,
          text: 'Ocorreu um erro ao deletar endereço',
        );
      }
    });
  }
}
