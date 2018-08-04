import 'package:webfaction_api/src/api/simple/db.dart';

/// See [DbApi]
class DbUser {
  String username;
  String password;
  String dbType;

  DbUser(this.username, this.password, this.dbType);

  DbUser.fromMap(Map map)
      : this(map['username'], map['password'] ?? '', map['db_type']);
}

/// See [DbApi]
class Db {
  String name;
  String dbType;
  String password;
  String dbUser;

  Db(this.name, this.dbType, this.dbUser, [this.password]);

  Db.fromMap(Map map) : this(map['name'], map['dbType'], map['dbUser']);
}
