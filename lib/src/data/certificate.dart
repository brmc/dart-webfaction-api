import 'package:webfaction_api/src/api/certificate.dart';

/// See [CertificateApi]
class Certificate {
  String name;
  String certificate;
  String privateKey;
  String intermediates;

  Certificate(this.name, this.certificate, this.privateKey,
      [this.intermediates = '']);

  Certificate.fromMap(Map map)
      : this(
          map['name'],
          map['certificate'],
          map['private_key'],
          map['intermediates'],
        );
}
