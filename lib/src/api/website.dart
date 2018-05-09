import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/website.dart';

class WebsiteApi extends Api {
  WebsiteApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future create(
          String website_name,
          String ip,
          bool https,
          List<String> subdomains,
          String certificate,
          List<List<String>> siteApps) =>
      call('create_website',
          [website_name, ip, https, subdomains, certificate, siteApps]);

  Future createFromInstance(Website website) => create(website.name, website.ip,
      website.https, website.subdomains, website.certificate, website.siteApps);

  Future delete(String websiteName, String ip, bool https) =>
      call('delete_website', [websiteName, ip, https]);

  Future deleteFromInstance(Website website) =>
      delete(website.name, website.ip, website.https);

  Future listBandwidthUsage() => call('list_bandwidth_usage');

  Future list() => call('list_websites');

  Future update(
          String website_name,
          String ip,
          bool https,
          List<String> subdomains,
          String certificate,
          List<List<String>> siteApps) =>
      call('update_website',
          [website_name, ip, https, subdomains, certificate, siteApps]);

  Future updateFromInstance(Website website) => update(website.name, website.ip,
      website.https, website.subdomains, website.certificate, website.siteApps);
}
