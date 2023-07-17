import 'package:provider/provider.dart';
import 'package:teste_ava/mobx/data_user_logged_store.dart'; 
List<Provider> listProviders(){
  return [ 
    Provider<DataUserLoggedStore>(create: (_) => DataUserLoggedStore()),
  ];
}