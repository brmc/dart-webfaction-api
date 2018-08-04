import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/object/dns.dart';

import 'package:webfaction_api/src/api/api.dart';

/// Create, list, and delete DNS overrides
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#dns](https://docs.webfaction.com/xmlrpc-api/apiref.html#dns)
class DnsApi extends Api {
  DnsApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_dns_override](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_dns_override)
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

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_dns_override](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_dns_override)
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

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_dns_overrides](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_dns_overrides)
  Future listOverrides() => call('list_dns_overrides');
}
