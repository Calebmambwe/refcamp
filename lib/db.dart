import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

initializeDatabase() async{
  //get the path for the database
  var path = await getDatabasesPath();
  // WidgetsFlutterBinding.ensureInitialized();
  //open my database
  Future<Database> db = openDatabase(join(path, 'counters.db'),
  onCreate: (db, version ){
    return db.execute('CREATE TABLE COUNTERS(ID INTEGER PRIMARY KEY AUTOINCREMENT, VALUE )');
  },
  version : 2
  );
  print('...... db has been created......');
  return db;
}