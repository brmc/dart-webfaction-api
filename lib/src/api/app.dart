import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/app.dart';

class AppApi extends Api {
  AppApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future create(String name, String type,
      [bool autostart = false,
      String extraInfo = '',
      bool openPort = false]) {

    return call('create_app', [name, type, autostart, extraInfo, openPort]);
  }

  Future createFromInstance(App app) =>
      create(app.name, app.type, app.autostart, app.extraInfo, app.openPort);

  Future delete(String name) => call('delete_app', [name]);

  Future deleteFromInstance(App app) => delete(app.name);

  Future list() => call('list_apps');

  Future listTypes() => call('list_app_types');
}