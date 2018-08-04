import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/simple/api.dart';
import 'package:webfaction_api/src/data/domain.dart';

/// Create, list, and delete domains
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#domains](https://docs.webfaction.com/xmlrpc-api/apiref.html#domains)
class DomainApi extends Api {
  DomainApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_domain](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_domain)
  Future create(String domain, List<String> subdomains) {
    subdomains.insert(0, domain);
    return call('create_domain', [domain, subdomains]);
  }

  Future createFromInstance(Domain domain) =>
      create(domain.domain, domain.subdomains);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_domain](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_domain)
  Future delete(String name, List<String> subdomains) =>
      call('delete_domain', [name, subdomains]);

  Future deleteFromInstance(Domain domain) =>
      delete(domain.domain, domain.subdomains);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_domains](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_domains)
  Future list() => call('list_domains');
}
