import 'package:webfaction_api/src/api/simple/general.dart';

/// See [GeneralApi]
class DiskUsage {
  List<HomeDirectory> homeDirectories;
  List<MailboxUsage> mailboxes;
  List<MysqlDatabaseUsage> mysqlDatabases;
  List<PostgresDatabaseUsage> postgresDatabases;
  num total;
  num quota;
  num percentage;

  DiskUsage(this.homeDirectories, this.mailboxes, this.mysqlDatabases,
      this.postgresDatabases, this.total, this.quota, this.percentage);

  DiskUsage.fromMap(Map map)
      : this(
            map['home_directories']
                .map((Map x) => new HomeDirectory.fromMap(x)),
            map['mailboxes'].map((Map x) => new MailboxUsage.fromMap(x)),
            map['mysql_databases']
                .map((Map x) => new MysqlDatabaseUsage.fromMap(x)),
            map['postgresql_databases']
                .map((Map x) => new PostgresDatabaseUsage.fromMap(x)),
            map['total'],
            map['quota'],
            map['percentage']);
}

/// See [GeneralApi]
class HomeDirectory {
  String lastReading;
  String machine;
  String username;
  num size;

  HomeDirectory(this.lastReading, this.machine, this.username, this.size);

  HomeDirectory.fromMap(Map map)
      : this(map['last_reading'], map['machine'], map['username'], map['size']);
}

/// See [GeneralApi]
class MailboxUsage {
  String lastReading;
  String name;
  num size;

  MailboxUsage(this.lastReading, this.name, this.size);

  MailboxUsage.fromMap(Map map)
      : this(map['lastReading'], map['name'], map['size']);
}

/// See [GeneralApi]
class MysqlDatabaseUsage {
  String lastReading;
  String name;
  num size;

  MysqlDatabaseUsage(this.lastReading, this.name, this.size);

  MysqlDatabaseUsage.fromMap(Map map)
      : this(map['lastReading'], map['name'], map['size']);
}

/// See [GeneralApi]
class PostgresDatabaseUsage {
  String lastReading;
  String name;
  num size;

  PostgresDatabaseUsage(this.lastReading, this.name, this.size);

  PostgresDatabaseUsage.fromMap(Map map)
      : this(map['lastReading'], map['name'], map['size']);
}
