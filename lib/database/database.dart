
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:teste_ava/database/address_dao/address_dao.dart';
import 'package:teste_ava/database/user_dao/user_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'ava.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(UserDao.tableSql);
      db.execute(AddressDao.tableSql);
    },
    version: 1,
  );
}

Future<void> closeDataBase()async{
  final database = await getDatabase();
  if(database.isOpen){
    await database.close();
  }
}

Future<void> deleteDataBase()async{
  final String path = join(await getDatabasesPath(), 'ava.db');
  await deleteDatabase(path);
}