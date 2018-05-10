import 'package:webfaction_api/src/data/util.dart';

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
            createList(HomeDirectory, map['home_directories']),
            createList(MailboxUsage, map['mailboxes']),
            createList(MysqlDatabaseUsage, map['mysql_databases']),
            createList(PostgresDatabaseUsage, map['postgresql_databases']),
            map['total'],
            map['quota'],
            map['percentage']);
}

class HomeDirectory {
  String lastReading;
  String machine;
  String username;
  num size;

  HomeDirectory(this.lastReading, this.machine, this.username, this.size);

  HomeDirectory.fromMap(Map map)
      : this(map['last_reading'], map['machine'], map['username'], map['size']);
}

class MailboxUsage {
  String lastReading;
  String name;
  num size;

  MailboxUsage(this.lastReading, this.name, this.size);

  MailboxUsage.fromMap(Map map)
      : this(map['lastReading'], map['name'], map['size']);
}

class MysqlDatabaseUsage {
  String lastReading;
  String name;
  num size;

  MysqlDatabaseUsage(this.lastReading, this.name, this.size);

  MysqlDatabaseUsage.fromMap(Map map)
      : this(map['lastReading'], map['name'], map['size']);
}

class PostgresDatabaseUsage {
  String lastReading;
  String name;
  num size;

  PostgresDatabaseUsage(this.lastReading, this.name, this.size);

  PostgresDatabaseUsage.fromMap(Map map)
      : this(map['lastReading'], map['name'], map['size']);
}
