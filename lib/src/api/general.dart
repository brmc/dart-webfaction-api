import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/api.dart';

/// List disc usage.  (The login command has been moved to [Client]
class GeneralApi extends Api {
  GeneralApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_disk_usage](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_disk_usage)
  Future listDiskUsage() => call('list_disk_usage');
}
