import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/certificate.dart';

class CertificateApi extends Api {
  CertificateApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future create(String name, String certificate, String privateKey,
          [intermediates = '']) =>
      call(
          'create_certificate', [name, certificate, privateKey, intermediates]);

  Future createFromInstance(Certificate cert) =>
      create(cert.name, cert.certificate, cert.privateKey, cert.intermediates);

  Future delete(String name) => call('delete_certificate', [name]);

  Future deleteFromInstance(Certificate cert) => delete(cert.name);

  Future list() => call('list_certificates');

  Future update(
          String name, String cert, String privateKey, String intermediates) =>
      call('update_certificate', [name, cert, privateKey, intermediates]);

  Future updateFromInstance(Certificate cert) =>
      update(cert.name, cert.certificate, cert.privateKey, cert.intermediates);
}
