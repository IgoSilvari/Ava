import 'package:teste_ava/database/database.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/model/address_model.dart';

class AddressDao {
  static const String tableSql = '''CREATE TABLE $_tableName(
      $_id INTEGER,
      $_idUser INTEGER,
      $_cep TEXT,
      $_street TEXT,
      $_complement TEXT,
      $_neighborhood TEXT,
      $_city TEXT,
      $_state TEXT)''';

  static const String _tableName = 'addressTable';
  static const String _id = 'id';
  static const String _idUser = 'idUser';
  static const String _cep = 'cep';
  static const String _street = 'street';
  static const String _complement = 'complement';
  static const String _neighborhood = 'neighborhood';
  static const String _city = 'city';
  static const String _state = 'state';

  Future<StatusLoad> save(AddressModel address) async {
    final dataBase = await getDatabase();
    await dataBase.insert(_tableName, toMap(address));
    return StatusLoad.success;
  }

  Map<String, dynamic> toMap(AddressModel address) {
    final newMap = <String, dynamic>{};
    newMap[_id] = address.id;
    newMap[_idUser] = address.userId;
    newMap[_cep] = address.cep;
    newMap[_street] = address.logradouro;
    newMap[_neighborhood] = address.bairro;
    newMap[_city] = address.cidade;
    newMap[_complement] = address.complemento;
    newMap[_state] = address.uf;
    return newMap;
  }

  Future<List<AddressModel>> findAll() async {
    final dataBase = await getDatabase();
    final List<Map<String, dynamic>> result;
    result = await dataBase.query(_tableName);
    return toList(result);
  }

  List<AddressModel> toList(List<Map<String, dynamic>> listMap) {
    final List<AddressModel> adresses = [];
    for (final line in listMap) {
      final address = AddressModel(
        id: line[_id],
        userId: line[_idUser],
        cep: line[_cep],
        logradouro: line[_street],
        bairro: line[_neighborhood],
        complemento: line[_complement],
        cidade: line[_city],
        uf: line[_state],
      );
      adresses.add(address);
    }
    return adresses;
  }

  Future<List<AddressModel>> findAllUserAddresses({required int userId}) async {
    final listAll = await findAll();
    List<AddressModel> listAddress = [];
    for (var element in listAll) {
      if (element.userId == userId) {
        listAddress.add(element);
      }
    }
    return listAddress;
  }

  Future<StatusLoad> updateAddress({required AddressModel address}) async {
    final dataBase = await getDatabase();
    int updatedQuantity = await dataBase.rawUpdate(
      'UPDATE $_tableName SET $_cep = ?, $_street = ?, $_neighborhood = ?, $_city = ?, $_state = ?, $_complement = ? WHERE $_id = "${address.id}"',
      [
        '${address.cep}',
        '${address.logradouro}',
        '${address.bairro}',
        '${address.cidade}',
        '${address.uf}',
        '${address.complemento}'
      ],
    );
    if (updatedQuantity >= 1) {
      return StatusLoad.success;
    } else {
      return StatusLoad.failed;
    }
  }

  Future<StatusLoad> removeAddress(int id) async {
    final dataBase = await getDatabase();
    final result = await dataBase.rawDelete('DELETE FROM $_tableName WHERE $_id = ?', [id.toString()]);
    if(result == 1){
      return StatusLoad.success;
    }else{
      return StatusLoad.failed;
    }
  }
}
