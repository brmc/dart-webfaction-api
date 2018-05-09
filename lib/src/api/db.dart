import 'dart:async';

import 'package:webfaction_api/src/data/db.dart';

import 'api.dart';

class DbApi extends Api {
  DbApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future changePassword(String username, password, String dbType) =>
      call('change_db_password', [username, password, dbType]);

  Future changePasswordFromInstance(Db db, String password) =>
      changePassword(db.dbUser, password, db.dbType);

  Future create(name, dbType, password, dbUser) =>
      call('create_db', [name, dbType, password, dbUser]);

  Future createFromInstance(Db db) =>
      create(db.name, db.dbType, db.password, db.dbUser);

  Future createUser(String username, String password, String dbType) =>
      call('create_db_user', [username, password, dbType]);

  Future createUserFromInstance(DbUser user) =>
      createUser(user.username, user.password, user.dbType);

  Future changeUserPassword(String username, String password, String dbType) =>
      call('change_db_user_password', [username, password, dbType]);

  Future changeUserPasswordFromInstance(DbUser user, String password) =>
      changeUserPassword(user.username, password, user.dbType);

  Future delete(String name, String dbType) =>
      call('delete_db', [name, dbType]);

  Future deleteFromInstance(Db db) => delete(db.name, db.dbType);

  Future deleteUser(String username, String dbType) =>
      call('delete_db_user', [username, dbType]);

  Future deleteUserFromInstance(DbUser user) =>
      deleteUser(user.username, user.dbType);

  Future grandPermissions(String username, String database, String dbType) =>
      call('grant_db_permissions', [username, database, dbType]);

  Future enableAddon(String database, String addon) =>
      call('enable_addon', [database, 'postgresql', addon]);

  Future list() => call('list_dbs');

  Future listUsers() => call('list_db_users');

  Future makeUserOwner(String username, String database, String dbType) =>
      call('make_user_owner_of_db', [username, database, dbType]);

  Future makeUserOwnerFromInstance(DbUser user, Db db) =>
      makeUserOwner(user.username, db.name, db.dbType);

  Future revokePermissions(String username, String database, String dbType) =>
      call('revoke_db_permissions', [username, database, dbType]);

  Future revokePermissionsFromInstances(DbUser user, Db db) =>
      revokePermissions(user.username, db.name, db.dbType);
}
