import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';

import 'package:webfaction_api/src/api/api.dart';

/// Create and delete Cronjobs
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#cron](https://docs.webfaction.com/xmlrpc-api/apiref.html#cron
class CronApi extends Api {
  CronApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_cronjob](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_cronjob)
  Future create(String line) => call('create_cronjob', [line]);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_cronjob](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_cronjob)
  Future delete(String line) => call('delete_cronjob', [line]);
}
