import 'dart:async';

import 'package:webfaction_api/src/data/shell_user.dart';

import 'api.dart';

/// User management for shell access
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#shell-users](https://docs.webfaction.com/xmlrpc-api/apiref.html#shell-users)
class ShellUserApi extends Api {
  ShellUserApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-change_user_password](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-change_user_password)
  Future changePassword(String username, String password) =>
      call('change_user_password', [username, password]);

  Future changePasswordFromInstance(User user, String password) =>
      changePassword(user.username, password);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_user](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_user)
  Future create(String username,
          [String shell = 'none', List<String> groups = const []]) =>
      call('create_user', [username, shell, groups]);

  Future createFromInstance(User user) =>
      create(user.username, user.shell, user.groups);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_user](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_user)
  Future delete(String username) => call('delete_user', [username]);

  Future deleteFromInstance(User user) => delete(user.username);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_users](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_users)
  Future list() => call('list_users');
}
