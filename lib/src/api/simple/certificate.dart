import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/simple/api.dart';
import 'package:webfaction_api/src/data/certificate.dart';

/// CRUD operations for SSL/TLS certificates
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#certificates](https://docs.webfaction.com/xmlrpc-api/apiref.html#certificates
class CertificateApi extends Api {
  CertificateApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_certificate](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_certificate)
  Future create(String name, String certificate, String privateKey,
          [intermediates = '']) =>
      call(
          'create_certificate', [name, certificate, privateKey, intermediates]);

  /// Delegates to [create]
  Future createFromInstance(Certificate cert) =>
      create(cert.name, cert.certificate, cert.privateKey, cert.intermediates);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_certificate](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_certificate)
  Future delete(String name) => call('delete_certificate', [name]);

  /// Delegates to [delete]
  Future deleteFromInstance(Certificate cert) => delete(cert.name);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_certificates](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_certificates)
  Future list() => call('list_certificates');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-update_certificate](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-update_certificate)
  Future update(
          String name, String cert, String privateKey, String intermediates) =>
      call('update_certificate', [name, cert, privateKey, intermediates]);

  /// Delegates to [update]
  Future updateFromInstance(Certificate cert) =>
      update(cert.name, cert.certificate, cert.privateKey, cert.intermediates);
}
