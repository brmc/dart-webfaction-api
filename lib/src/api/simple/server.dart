import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';

import 'package:webfaction_api/src/api/api.dart';

/// List IPs and machines
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#servers](https://docs.webfaction.com/xmlrpc-api/apiref.html#servers)
class ServerApi extends Api {
  ServerApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_ips](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_ips)
  Future listIps() => call('list_ips');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_machines](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_machines)
  Future listMachines() => call('list_machines');
}
