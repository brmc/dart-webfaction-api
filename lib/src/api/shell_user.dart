import 'dart:async';

import 'package:webfaction_api/src/data/shell_user.dart';

import 'api.dart';

class ShellUserApi extends Api {
  ShellUserApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future changePassword(String username, String password) =>
      call('change_user_password', [username, password]);

  Future changePasswordFromInstance(User user, String password) =>
      changePassword(user.username, password);

  Future create(String username,
          [String shell = 'none', List<String> groups = const []]) =>
      call('create_user', [username, shell, groups]);

  Future createFromInstance(User user) =>
      create(user.username, user.shell, user.groups);

  Future delete(String username) => call('delete_user', [username]);

  Future deleteFromInstance(User user) => delete(user.username);

  Future list() => call('list_users');
}
