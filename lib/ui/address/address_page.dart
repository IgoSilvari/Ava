import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_ava/mobx/address/list_address_save_store.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart';
import 'package:teste_ava/router.dart';
import 'package:teste_ava/ui/address/list_empty.dart';
import 'package:teste_ava/ui/address/load_shimmer.dart';
import 'package:teste_ava/ui/address/view_address/view_map_page.dart';
import 'package:teste_ava/ui/drawer/drawer_page.dart';
import 'package:teste_ava/ui/widget/background_defaut.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    loadAddress();
    super.initState();
  }

  Future<void> loadAddress() async {
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    final listAddress =
        Provider.of<ListAddressSaveStore>(context, listen: false);
    await listAddress.savedAddresses(idUser: dataUserLogged.userData!.id!);
  }

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listAddress = Provider.of<ListAddressSaveStore>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerPage(),
      body: RefreshIndicator(
        onRefresh: loadAddress,
        child: BackgraundDefaut(
          title: 'Endereços',
          top: 10,
          isTwoRoundedEdges: true,
          isVisibleDrawer: true,
          isVisibleActions: true,
          onPressedLeading: actionButtonLeading,
          onPressedActions: actionButtonActions,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 40),
            child: Observer(
              builder: (_) {
                return Visibility(
                  visible: listAddress.isExecution,
                  replacement: Visibility(
                    visible: listAddress.addressList.isNotEmpty,
                    replacement: const ListEmpty(),
                    child: ListView.builder(
                      itemCount: listAddress.addressList.length,
                      itemBuilder: (context, index) {
                        final address = listAddress.addressList[index];
                        return Card(
                          child: ListTile(
                            leading: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/images/location.png'),
                            ),
                            title: Text(address.logradouro ?? ''),
                            subtitle: Text(
                              '${(address.bairro ?? '')} / ${(address.cidade ?? '')} - ${(address.uf ?? '')}',
                            ),
                            onTap: () => ViewMapPage.show(
                              context: context,
                              address: address,
                              onPressed: loadAddress,
                            ),                           
                          ),
                        );
                      },
                    ),
                  ),
                  child: const LoadShimmer(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void actionButtonLeading() {
    _scaffoldKey.currentState!.openDrawer();
  }

  Future<void> actionButtonActions() async {
    final isTrue =
        await Navigator.of(context).pushNamed(AppRouter.addAddressPage);
    if (isTrue == true) {
      loadAddress();
    }
  }
}
