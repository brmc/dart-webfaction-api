import 'dart:async';

import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/api/certificate.dart';
import 'package:webfaction_api/src/api/domain.dart';
import 'package:webfaction_api/src/api/email.dart';
import 'package:webfaction_api/src/api/general.dart';
import 'package:webfaction_api/src/api/website.dart';
import 'package:webfaction_api/src/constants.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;

import './api/app.dart';
import './api/cron.dart';
import './api/db.dart';
import './api/dns.dart';
import './api/file.dart';
import './api/misc.dart';
import './api/server.dart';
import './api/shell_user.dart';

/// The main entry point to the API
class Client implements Api {
  String _username;
  String _password;
  String _server;
  Function _rpc;

  String _sessionId;

  AppApi app;
  CertificateApi certificate;
  CronApi cron;
  DbApi db;
  DnsApi dns;
  DomainApi domain;
  EmailAddressApi email;
  FileApi file;
  GeneralApi general;
  MailboxApi mailbox;
  MiscApi misc;
  ServerApi server;
  ShellUserApi shellUser;
  WebsiteApi website;

  Client(this._username, this._password, this._server,
      [this._rpc = xml_rpc.call]);

  String get sessionId => _sessionId;

  /// Sets the [sessionId] on the client and all API classes
  set sessionId(String session) {
    _sessionId = session;

    app = new AppApi(session, _rpc);
    certificate = new CertificateApi(session, _rpc);
    cron = new CronApi(session, _rpc);
    db = new DbApi(session, _rpc);
    dns = new DnsApi(session, _rpc);
    domain = new DomainApi(session, _rpc);
    email = new EmailAddressApi(session, _rpc);
    file = new FileApi(session, _rpc);
    general = new GeneralApi(session, _rpc);
    mailbox = new MailboxApi(session, _rpc);
    misc = new MiscApi(session, _rpc);
    server = new ServerApi(session, _rpc);
    shellUser = new ShellUserApi(session, _rpc);
    website = new WebsiteApi(session, _rpc);
  }

  /// Logs in to the Webfaction API
  ///
  /// Upon successful login, the [sessionId] will be available and the
  /// underlying API classes will be instantiated.
  Future<List> login() {
    var api = 2;
    var params = [_username, _password, _server, api];
    return call('login', params).then((response) {
      _sessionId = response[0];

      return response;
    });
  }

  /// Makes an unstructured remote procedure call
  ///
  /// Use this if a method is missing or broken.
  ///
  /// Unlike [Api.call], you have to manually pass the [sessionId] as the first
  /// [params]
  @override
  Future call(String method, [List params]) {
    return _rpc(webfactionUrl, method, params);
  }
}
