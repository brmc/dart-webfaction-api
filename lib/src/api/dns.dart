import 'dart:async';

import 'package:webfaction_api/src/data/dns.dart';

import 'api.dart';

class DnsApi extends Api {
  DnsApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future createOverride(String domain,
      [aIp = '',
      cname = '',
      mxName = '',
      mxPriority = '',
      spfRecord = '',
      aaaaIp = '',
      srvRecord = '']) {
    var params = [
      domain,
      aIp,
      cname,
      mxName,
      mxPriority,
      spfRecord,
      aaaaIp,
      srvRecord
    ];
    return call('create_dns_override', params);
  }

  Future createOverrideFromInstance(DnsOverride obj) => createOverride(
      obj.domain,
      obj.aIp,
      obj.cname,
      obj.mxName,
      obj.mxPriority,
      obj.spfRecord,
      obj.aaaaIp,
      obj.srvRecord);

  Future deleteOverride(String domain,
      [aIp = '',
      cname = '',
      mxName = '',
      mxPriority = '',
      spfRecord = '',
      aaaaIp = '',
      srvRecord = '']) {
    var params = [
      domain,
      aIp,
      cname,
      mxName,
      mxPriority,
      spfRecord,
      aaaaIp,
      srvRecord
    ];
    return call('delete_dns_override', params);
  }

  Future deleteOverrideFromInstance(DnsOverride obj) => deleteOverride(
      obj.domain,
      obj.aIp,
      obj.cname,
      obj.mxName,
      obj.mxPriority,
      obj.spfRecord,
      obj.aaaaIp,
      obj.srvRecord);

  Future listOverrides() => call('list_dns_overrides');
}
