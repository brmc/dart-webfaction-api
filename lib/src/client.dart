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
  Function rpc;

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
      [this.rpc = xml_rpc.call]);

  String get sessionId => _sessionId;

  /// Sets the [sessionId] on the client and all API classes
  set sessionId(String session) {
    _sessionId = session;

    app = new AppApi(rpc: rpc, sessionId: session);
    certificate = new CertificateApi(rpc: rpc, sessionId: session);
    cron = new CronApi(rpc: rpc, sessionId: session);
    db = new DbApi(rpc: rpc, sessionId: session);
    dns = new DnsApi(rpc: rpc, sessionId: session);
    domain = new DomainApi(rpc: rpc, sessionId: session);
    email = new EmailAddressApi(rpc: rpc, sessionId: session);
    file = new FileApi(rpc: rpc, sessionId: session);
    general = new GeneralApi(rpc: rpc, sessionId: session);
    mailbox = new MailboxApi(rpc: rpc, sessionId: session);
    misc = new MiscApi(rpc: rpc, sessionId: session);
    server = new ServerApi(rpc: rpc, sessionId: session);
    shellUser = new ShellUserApi(rpc: rpc, sessionId: session);
    website = new WebsiteApi(rpc: rpc, sessionId: session);
  }

  /// Logs in to the Webfaction API
  ///
  /// Upon successful login, the [sessionId] will be available and the
  /// underlying API classes will be instantiated.
  Future<List> login() {
    var api = 2;
    var params = [_username, _password, _server, api];
    return call('login', params).then((response) {
      sessionId = response[0];

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
    return rpc(webfactionUrl, method, params);
  }
}
