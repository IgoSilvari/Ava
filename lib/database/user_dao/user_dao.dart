import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:teste_ava/database/database.dart';
import 'package:teste_ava/helper/status_loading.dart';
import 'package:teste_ava/model/return_validate_credential.dart';
import 'package:teste_ava/model/user_model.dart';

class UserDao {
  static const String tableSql = '''CREATE TABLE $_tableName(
      $_id INTEGER,
      $_name TEXT,
      $_email TEXT,
      $_password TEXT,
      $_picture TEXT)''';

  static const String _tableName = 'userTable';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _password = 'password';
  static const String _picture = '_picture';

  Future<StatusLoad> save(UserModel user) async {
    final dataBase = await getDatabase();
    final isContains = await checkEmailUsed(valueSearch: user.email ?? '');
    if (!isContains) { 
      user.password = encodePassword(user.password!);
      await dataBase.insert(_tableName, toMap(user));
      return StatusLoad.success;
    } else {
      return StatusLoad.existingUser;
    }
  }

  Map<String, dynamic> toMap(UserModel user) {
    final newMap = <String, dynamic>{};
    newMap[_id] = user.id;
    newMap[_name] = user.name;
    newMap[_email] = user.email;
    newMap[_password] = user.password;
    newMap[_picture] = user.picture;
    return newMap;
  }

  Future<List<UserModel>> findAll() async {
    final dataBase = await getDatabase();
    final List<Map<String, dynamic>> result;
    result = await dataBase.query(_tableName);
    return toList(result);
  }

  List<UserModel> toList(List<Map<String, dynamic>> listMap) {
    final List<UserModel> users = [];
    for (final line in listMap) {
      final patient = UserModel(
        id: line[_id],
        name: line[_name],
        email: line[_email],
        password: line[_password],
        picture: line[_picture],
      );
      users.add(patient);
    }
    return users;
  }

  Future<bool> checkEmailUsed({required String valueSearch}) async {
    final dataBase = await getDatabase();
    final List<bool> result = [];
    final queryData = await dataBase.query(_tableName);
    for (var element in queryData) {
      final isExist = element.containsValue(valueSearch);
      result.add(isExist);
    }
    return result.contains(true);
  }

  Future<DataValidateCredential> validateCredentials({required String email, required String password}) async {
    List<UserModel> listUsers = await findAll();
    UserModel? newUser;
    final result = listUsers.any((element) {
      bool isContainsEmail = element.email == email;
      bool isContainsPassword = element.password == encodePassword(password);
      if(isContainsEmail && isContainsPassword){
        newUser = element;
      }
      return isContainsEmail && isContainsPassword;
    });
    return DataValidateCredential(isContains: result, user: newUser);
  }

  String encodePassword(String password){
    return md5.convert(utf8.encode(password)).toString();
  }

  Future<UserModel> getDataUser(int id) async {
    final allUsers = await findAll();
    final user = allUsers.firstWhere((element) => element.id == id);
    return user;
  }

  Future<StatusLoad> updatePassword({required UserModel user}) async {
    final dataBase = await getDatabase();
    int updatedQuantity = await dataBase.rawUpdate(
      'UPDATE $_tableName SET $_password = ?  WHERE $_email = "${user.email}"',
      [
        '${encodePassword(user.password!)}',
      ],
    );
    if (updatedQuantity >= 1) {
      return StatusLoad.success;
    } else {
      return StatusLoad.failed;
    }
  }

  Future<StatusLoad> updateDataUser({required UserModel user}) async {
    final dataBase = await getDatabase();
    int updatedQuantity = await dataBase.rawUpdate(
      'UPDATE $_tableName SET $_name = ?, $_email = ?, $_picture = ? WHERE $_id = "${user.id}"',
      [
        '${user.name}',
        '${user.email}',
        '${user.picture}'
      ],
    );
    if (updatedQuantity >= 1) {
      return StatusLoad.success;
    } else {
      return StatusLoad.failed;
    }
  }
}
