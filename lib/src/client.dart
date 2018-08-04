import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/api.dart';
import 'package:webfaction_api/src/api/certificate.dart';
import 'package:webfaction_api/src/api/domain.dart';
import 'package:webfaction_api/src/api/email.dart';
import 'package:webfaction_api/src/api/general.dart';
import 'package:webfaction_api/src/api/website.dart';

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
  RpcAdapter rpc;

  String _sessionId;

  final AppApi app;
  final CertificateApi certificate;
  final CronApi cron;
  final DbApi db;
  final DnsApi dns;
  final DomainApi domain;
  final EmailAddressApi email;
  final FileApi file;
  final GeneralApi general;
  final MailboxApi mailbox;
  final MiscApi misc;
  final ServerApi server;
  final ShellUserApi shellUser;
  final WebsiteApi website;

  Client(this._username, this._password, this._server,
      [this.rpc = const WebfactionRpc()])
      : app = AppApi(rpc: rpc),
        certificate = CertificateApi(rpc: rpc),
        cron = CronApi(rpc: rpc),
        db = DbApi(rpc: rpc),
        dns = DnsApi(rpc: rpc),
        domain = DomainApi(rpc: rpc),
        email = EmailAddressApi(rpc: rpc),
        file = FileApi(rpc: rpc),
        general = GeneralApi(rpc: rpc),
        mailbox = MailboxApi(rpc: rpc),
        misc = MiscApi(rpc: rpc),
        server = ServerApi(rpc: rpc),
        shellUser = ShellUserApi(rpc: rpc),
        website = WebsiteApi(rpc: rpc);

  String get sessionId => _sessionId;

  /// Sets the [sessionId] on the client and all API classes
  set sessionId(String session) {
    _sessionId = session;

    app.sessionId = session;
    certificate.sessionId = session;
    cron.sessionId = session;
    db.sessionId = session;
    dns.sessionId = session;
    domain.sessionId = session;
    email.sessionId = session;
    file.sessionId = session;
    general.sessionId = session;
    mailbox.sessionId = session;
    misc.sessionId = session;
    server.sessionId = session;
    shellUser.sessionId = session;
    website.sessionId = session;
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
    return rpc.call(method, params);
  }
}
