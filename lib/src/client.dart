import 'dart:async';

import 'package:webfaction_api/containers.dart';
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

class Client implements Api{
  String _user;
  String _pass;
  String _serverName;
  Function _rpc;

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

  Client(this._user, this._pass, this._serverName, [this._rpc = xml_rpc.call]);

  Future login() {
    var _api = 2;
    var params = [_user, _pass, _serverName, _api];
    return call('login', params).then((response) {
      var session = response[0];

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

      return response;
    });
  }

  @override
  Future call(String method, [List params]) {
    return _rpc(webfactionUrl, method, params);
  }
}
