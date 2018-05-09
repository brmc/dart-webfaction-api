import 'dart:async';

import 'api.dart';

class ServerApi extends Api {
  ServerApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future listIps() => call('list_ips');

  Future listMachines() => call('list_machines');
}
