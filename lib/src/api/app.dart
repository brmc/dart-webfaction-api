import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/app.dart';
import 'package:webfaction_api/src/data/util.dart';

/// Create, read, delete, and list operations for Webfaction operations
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#applications](https://docs.webfaction.com/xmlrpc-api/apiref.html#applications)
class AppApi extends Api {
  AppApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_app](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_app)
  ///
  /// Application [type]s can be found with [list]
  Future create(String name, String type,
      [bool autostart = false, String extraInfo = '', bool openPort = false]) {
    return call('create_app', [name, type, autostart, extraInfo, openPort]);
  }

  /// Delegates to [create]
  ///
  /// See [App]
  Future createFromInstance(App app) =>
      create(app.name, app.type, app.autostart, app.extraInfo, app.openPort);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_app](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_app)
  Future delete(String name) => call('delete_app', [name]);

  /// Delegates to [delete]
  Future deleteFromInstance(App app) => delete(app.name);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_apps](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_apps)
  ///
  /// [createList] can be used to create [App] instances from the response
  Future list() => call('list_apps');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_app_types](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_app_types)
  ///
  /// [createList] can be used to create [AppType] instances from the response
  Future listTypes() => call('list_app_types');
}
