import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';

class GeneralApi extends Api {
  GeneralApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future listDiskUsage() => call('list_disk_usage');
}
