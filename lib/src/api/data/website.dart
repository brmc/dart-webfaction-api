import 'package:webfaction_api/src/api/simple/website.dart';
import 'package:webfaction_api/src/api/data/app.dart';
import 'package:webfaction_api/src/api/data/certificate.dart';
import 'package:webfaction_api/src/api/data/domain.dart';
import 'package:webfaction_api/src/api/data/server.dart';

/// See [WebsiteApi]
class SiteApp {
  String path;
  String appName;

  SiteApp(String this.path, String this.appName);

  SiteApp.fromPathAndApp(String path, App app) : this(path, app.name);

  SiteApp.fromMap(Map map) : this(map['site_apps'][0], map['site_apps'][1]);
}

/// See [WebsiteApi]
class Website {
  String name;
  String ip;
  bool https;
  List<String> subdomains;
  String certificate;
  List<List<String>> siteApps;

  Website(this.name, this.ip, this.https, this.subdomains, this.certificate,
      this.siteApps);

  Website.fromMap(Map map)
      : this(
          map['name'],
          map['ip'],
          map['https'],
          map['subdomains'],
          map['certificate'],
          map['site_apps'],
        );

  Website.fromInstances(String this.name, Ip ip, bool this.https,
      List<Domain> domains, Certificate cert, List<SiteApp> apps) {
    this.ip = ip.address;
    certificate = cert.name;

    var combined = domains.map((Domain domain) => domain.subdomains
        .map((String subdomain) => '${subdomain}.${domain.domain}'));

    subdomains = combined.reduce((a, b) => new List.from(a)..addAll(b));

    siteApps = new List.from(apps.map((app) => [app.appName, app.path]));
  }
}
