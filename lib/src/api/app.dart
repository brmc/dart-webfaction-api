import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/app.dart';

class AppApi extends Api {
  AppApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future create(String name, String type,
      [bool autostart = false,
      String extra_info = '',
      bool open_port = false]) {
    var params = [name, type, autostart, extra_info, open_port];

    return call('create_app', params);
  }

  Future createFromInstance(App app) =>
      create(app.name, app.type, app.autostart, app.extraInfo, app.openPort);

  Future delete(String name) => call('delete_app', [name]);

  Future deleteFromInstance(App app) => delete(app.name);

  Future list() => call('list_apps');

  Future listTypes() => call('list_app_types');
}