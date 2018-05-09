import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/domain.dart';

class DomainApi extends Api {
  DomainApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future create(String domain, List<String> subdomains) {
    subdomains.insert(0, domain);
    return call('create_domain', [domain, subdomains]);
  }

  Future createFromInstance(Domain domain) =>
      create(domain.domain, domain.subdomains);

  Future delete(String name, List<String> subdomains) =>
      call('delete_domain', [name, subdomains]);

  Future deleteFromInstance(Domain domain) =>
      delete(domain.domain, domain.subdomains);

  Future list() => call('list_domains');
}
