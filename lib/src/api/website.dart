import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/data/website.dart';

/// CRUD operations for websites
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#websites](https://docs.webfaction.com/xmlrpc-api/apiref.html#websites)
class WebsiteApi extends Api {
  WebsiteApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_website](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_website)
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

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_website](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_website)
  Future delete(String websiteName, String ip, bool https) =>
      call('delete_website', [websiteName, ip, https]);

  Future deleteFromInstance(Website website) =>
      delete(website.name, website.ip, website.https);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_bandwidth_usage](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_bandwidth_usage)
  Future listBandwidthUsage() => call('list_bandwidth_usage');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_websites](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_websites)
  Future list() => call('list_websites');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-update_website](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-update_website)
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
