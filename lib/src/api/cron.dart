import 'dart:async';

import 'api.dart';

class CronApi extends Api {
  CronApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future create(String line) => call('create_cronjob', [line]);

  Future delete(String line) => call('delete_cronjob', [line]);
}
