import 'package:mysql_client/mysql_client.dart';

class DBFactory {
  static String host = "10.0.2.2",
      user = "lumbrera",
      pw = "lumbrera",
      db = "flutter_test";
  static int port = 3306;

  DBFactory();

  Future<MySQLConnection> mySQLConnectionMethod() async {
    return await MySQLConnection.createConnection(
      host: host,
      port: 3306,
      userName: user,
      password: pw,
      databaseName: db, // optional
    );
  }
}
