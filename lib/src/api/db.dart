import 'dart:async';

import 'package:webfaction_api/src/data/db.dart';

import 'api.dart';

/// CRUD, authentication and permissions for databases and database users
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#databases](https://docs.webfaction.com/xmlrpc-api/apiref.html#databases)
class DbApi extends Api {
  DbApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-change_db_password](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-change_db_password)
  Future changePassword(String username, password, String dbType) =>
      call('change_db_password', [username, password, dbType]);

  Future changePasswordFromInstance(Db db, String password) =>
      changePassword(db.dbUser, password, db.dbType);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_db](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_db)
  Future create(name, dbType, password, dbUser) =>
      call('create_db', [name, dbType, password, dbUser]);

  Future createFromInstance(Db db) =>
      create(db.name, db.dbType, db.password, db.dbUser);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_db_user](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_db_user)
  Future createUser(String username, String password, String dbType) =>
      call('create_db_user', [username, password, dbType]);

  Future createUserFromInstance(DbUser user) =>
      createUser(user.username, user.password, user.dbType);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-change_db_user_password](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-change_db_user_password)
  Future changeUserPassword(String username, String password, String dbType) =>
      call('change_db_user_password', [username, password, dbType]);

  Future changeUserPasswordFromInstance(DbUser user, String password) =>
      changeUserPassword(user.username, password, user.dbType);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_db](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_db)
  Future delete(String name, String dbType) =>
      call('delete_db', [name, dbType]);

  Future deleteFromInstance(Db db) => delete(db.name, db.dbType);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_db_user](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_db_user)
  Future deleteUser(String username, String dbType) =>
      call('delete_db_user', [username, dbType]);

  Future deleteUserFromInstance(DbUser user) =>
      deleteUser(user.username, user.dbType);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-grant_db_permissions](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-grant_db_permissions)
  Future grandPermissions(String username, String database, String dbType) =>
      call('grant_db_permissions', [username, database, dbType]);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-enable_addon](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-enable_addon)
  Future enableAddon(String database, String addon) =>
      call('enable_addon', [database, 'postgresql', addon]);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_dbs](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_dbs)
  Future list() => call('list_dbs');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_db_users](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_db_users)
  Future listUsers() => call('list_db_users');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-make_user_owner_of_db](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-make_user_owner_of_db)
  Future makeUserOwner(String username, String database, String dbType) =>
      call('make_user_owner_of_db', [username, database, dbType]);

  Future makeUserOwnerFromInstance(DbUser user, Db db) =>
      makeUserOwner(user.username, db.name, db.dbType);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_db](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_db)
  Future revokePermissions(String username, String database, String dbType) =>
      call('revoke_db_permissions', [username, database, dbType]);

  Future revokePermissionsFromInstances(DbUser user, Db db) =>
      revokePermissions(user.username, db.name, db.dbType);
}
