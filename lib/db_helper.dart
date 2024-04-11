import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'employee_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'employee_table.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE employee_table ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "name TEXT NOT NULL,"
        "age TEXT NOT NULL,"
        "contact TEXT NOT NULL,"
        "jobName TEXT NOT NULL,"
        "city TEXT NOT NULL,"
        "email TEXT NOT NULL,"
        "gender TEXT NOT NULL,"
        "maritalStatus TEXT NOT NULL,"
        "socialSecNum TEXT NOT NULL)");
  }

  Future<EmpModel> insert(EmpModel empModel) async {
    var dbclient = await db;
    await dbclient!.insert('employee_table', empModel.toMap());
    return empModel;
  }

  Future<List<EmpModel>> getEmployeeList() async {
    var dbclient = await db;
    final List<Map<String, dynamic>> queryResult =
        await dbclient!.query('employee_table');
    return queryResult.map((e) => EmpModel.fromMap(e)).toList();
  }

  Future<List<Map<String, dynamic>>> getSpecificEmployee(int id) async {
    var dbclient = await db;
    var res = await dbclient!
        .query('employee_table', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> delete(int id) async {
    var dbclient = await db;
    return await dbclient!
        .delete('employee_table', where: 'id = ?', whereArgs: [id]);
  }

  // Future<int> update(
  //     int id,
  //     String name,
  //     String age,
  //     String contact,
  //     String job,
  //     String city,
  //     String email,
  //     String gender,
  //     String maritalStatus,
  //     String socialSecNum) async {
  //   var dbclient = await db;
  //   var res = await dbclient!.update(
  //       'employee_table',
  //       {
  //         'name': name,
  //         'age': age,
  //         'contact': contact,
  //         'jobName': job,
  //         'city': city,
  //         'email': email,
  //         'gender': gender,
  //         'maritalStatus': maritalStatus,
  //         'socialSecNum': socialSecNum
  //       },
  //       where: "id = ?",
  //       whereArgs: [id]);
  //   return res;
  // }

  // Future<int> update(int id, EmpModel empModel) async {
  //   var dbclient = await db;
  //   return await dbclient!.update('employee', empModel.toMap(),
  //       where: 'id = ?', whereArgs: [id]);
  // }

  Future<int> update(
    int id,
    String name,
    String age,
    String contact,
    String job,
    String city,
    String email,
    String gender,
    String maritalStatus,
    String socialSecNum,
  ) async {
    var dbclient = await db;

    var snapshot = await dbclient!.query(
      'employee_table',
      where: "id = ?",
      whereArgs: [id],
    );

    // Check if the record with the given id exists
    if (snapshot.isNotEmpty) {
      var existingValues = snapshot.first;

      // Use the existing value if the new value is empty, otherwise use the new value
      var res = await dbclient.update(
        'employee_table',
        {
          'name': name.isNotEmpty ? name : snapshot[0]['name'],
          'age': age.isNotEmpty ? age : existingValues['age'],
          'contact': contact.isNotEmpty ? contact : existingValues['contact'],
          'jobName': job.isNotEmpty ? job : existingValues['jobName'],
          'city': city.isNotEmpty ? city : existingValues['city'],
          'email': email.isNotEmpty ? email : existingValues['email'],
          'gender': gender.isNotEmpty ? gender : existingValues['gender'],
          'maritalStatus': maritalStatus.isNotEmpty
              ? maritalStatus
              : existingValues['maritalStatus'],
          'socialSecNum': socialSecNum.isNotEmpty
              ? socialSecNum
              : existingValues['socialSecNum'],
        },
        where: "id = ?",
        whereArgs: [id],
      );

      return res;
    } else {
      return 0;
    }
  }

// taking snapshot of the database
  Future takeSnapshot() async {
    var dbclient = await db;
    var res = await dbclient!.rawQuery("SELECT * FROM employee_table");
    return res;
  }
}
