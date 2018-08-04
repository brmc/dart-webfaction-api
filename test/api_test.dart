import 'dart:async';

import 'package:test/test.dart';
import 'package:webfaction_api/client.dart';
import 'package:webfaction_api/response.dart';

import 'type_map.dart';
import 'type_order.dart';

convertSnakeCaseToCamelCase(String str) => str.replaceAllMapped(
    new RegExp('_([a-z])'), (Match m) => m.group(1).toUpperCase());

Future mockRpc(String url, String method, List<dynamic> params) async {
  return [method, params];
}

void main() {
  var parameterNameMap = signatureMap;
  var allMethods = parameterNameMap.keys;
  var calledMethods = new Set();

  checkTypeOrder(Future<dynamic> result) {
    result.then((results) {
      var method = results[0];
      List params = results[1];
      calledMethods.add(method);
      expect(types.keys.contains(method), equals(true),
          reason: 'Types missing method: ${method}');
      var expectedTypes = new List()..addAll([String])..addAll(types[method]);
      expect(params.length, equals(expectedTypes.length),
          reason: '${method} parameter mismatch');

      params.forEach((param) {
        var i = params.indexOf(param);

        var actualType = param.runtimeType;
        var expectedType = expectedTypes[i];
        // this is a dirty hack to dynamically check types from a list
        // todo: find out a better way to do this
        expect(actualType, equals(expectedType),
            reason: '${method} parameter ${i} is wrong: ${param}');
      });
    });
  }

  group('All api calls should match the specified types', () {
    test('Checking AppApi', () async {
      var api = new AppApi(sessionId: 'sessionid', rpc: mockRpc);
      checkTypeOrder(api.create('pigs', 'satan', false, 'aslkdj', true));
      checkTypeOrder(api.createFromInstance(new App('d', 'df')));
      checkTypeOrder(api.list());
      checkTypeOrder(api.listTypes());
      checkTypeOrder(api.delete('asdf'));
    });
    test('Checking GeneralApi', () async {
      var api = new GeneralApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.listDiskUsage());
    });
    test('Checking CronApi', () async {
      var api = new CronApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.create('asdf'));
      checkTypeOrder(api.delete('asdf'));
    });
    test('Checking MiscApi', () async {
      var api = new MiscApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.runPhpScript('asdf', 'asdfasd'));
      checkTypeOrder(api.runPhpScriptFromInstance(new PhpScript('as', 'asdf')));
      checkTypeOrder(api.setApacheAcl(['asdf'], 'asdf', false));
      checkTypeOrder(
          api.setApacheAclFromInstance(new ApacheAcl(['asdf'], 'fd', false)));
      checkTypeOrder(api.system('asdf'));
      checkTypeOrder(api.systemFromInstance(new Cmd('asdf')));
    });
    test('Checking DB api', () async {
      var api = new DbApi(sessionId: 'session', rpc: mockRpc);
      var db = new Db('asdf', 'asdf', 'asdf', 'asdf');
      var dbUser = new DbUser('username', 'password', 'dbType');

      checkTypeOrder(api.create('name', 'dbType', 'password', 'dbUser'));
      checkTypeOrder(api.createFromInstance(db));
      checkTypeOrder(api.delete('name', 'dbType'));
      checkTypeOrder(api.deleteFromInstance(db));
      checkTypeOrder(api.list());
      checkTypeOrder(api.changePassword('username', 'password', 'dbType'));
      checkTypeOrder(api.changePasswordFromInstance(db, 'password'));
      checkTypeOrder(api.createUser('username', 'password', 'dbType'));
      checkTypeOrder(api.createUserFromInstance(dbUser));
      checkTypeOrder(api.deleteUser('username', 'dbType'));
      checkTypeOrder(api.deleteUserFromInstance(dbUser));
      checkTypeOrder(api.listUsers());
      checkTypeOrder(api.changeUserPassword('as', 'asd', 'asdf'));
      checkTypeOrder(api.changeUserPasswordFromInstance(dbUser, 'password'));
      checkTypeOrder(api.revokePermissions('username', 'database', 'dbType'));
      checkTypeOrder(api.revokePermissionsFromInstances(dbUser, db));
      checkTypeOrder(api.enableAddon('database', 'addon'));
      checkTypeOrder(api.grandPermissions('username', 'database', 'dbType'));
    });

    test('Checking DnsApi', () async {
      var api = new DnsApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.listOverrides());
      checkTypeOrder(api.createOverride('domain'));
      checkTypeOrder(api.createOverrideFromInstance(new DnsOverride('asdf')));
      checkTypeOrder(api.deleteOverride('asdf'));
      checkTypeOrder(api.deleteOverrideFromInstance(new DnsOverride('domain')));
      checkTypeOrder(api.listOverrides());
    });
    test('Checking ServerApi', () async {
      var api = new ServerApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.listIps());
      checkTypeOrder(api.listMachines());
    });
    test('Checking CertificateApi', () async {
      var api = new CertificateApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.create('name', 'certificate', 'privateKey'));
      var cert = new Certificate('name', 'certificate', 'privateKey');
      checkTypeOrder(api.createFromInstance(cert));
      checkTypeOrder(api.list());
      checkTypeOrder(api.delete('name'));
      checkTypeOrder(api.deleteFromInstance(cert));
      checkTypeOrder(api.update('name', 'cert', 'privateKey', 'intermediates'));
      checkTypeOrder(api.updateFromInstance(cert));
    });
    test('Checking FileApi', () async {
      var api = new FileApi(sessionId: 'session', rpc: mockRpc);
      checkTypeOrder(api.replace('file', 'textToReplace', 'replacementText'));
      checkTypeOrder(api.write('file', 'text'));
    });
    test('Checking EmailApi', () async {
      var api = new EmailAddressApi(sessionId: 'session', rpc: mockRpc);
      var email = new Email('address', 'targets');
      checkTypeOrder(api.list());
      checkTypeOrder(api.delete('address'));
      checkTypeOrder(api.deleteFromInstance(email));
      checkTypeOrder(api.create('address', 'targets'));
      checkTypeOrder(api.createFromInstance(email));
      checkTypeOrder(api.update('address', ['targets']));
      checkTypeOrder(api.updateFromInstance(email));
    });
    test('Checking MailboxApi', () async {
      var api = new MailboxApi(sessionId: 'session', rpc: mockRpc);
      var mailbox = new Mailbox('asdf', 'asdf');
      checkTypeOrder(api.list());
      checkTypeOrder(api.delete('address'));
      checkTypeOrder(api.deleteFromInstance(mailbox));
      checkTypeOrder(api.create('address', false));
      checkTypeOrder(api.createFromInstance(mailbox));
      checkTypeOrder(api.update('address', true));
      checkTypeOrder(api.updateFromInstance(mailbox));
      checkTypeOrder(api.changePassword('mailboxName', 'password'));
      checkTypeOrder(api.changePasswordFromInstance(mailbox, 'password'));
    });
    test('Checking DomainApi', () async {
      var api = new DomainApi(sessionId: 'session', rpc: mockRpc);
      var domain = new Domain('domain', ['subdomains']);
      checkTypeOrder(api.list());
      checkTypeOrder(api.delete('address', ['asdf']));
      checkTypeOrder(api.deleteFromInstance(domain));
      checkTypeOrder(api.create('address', ['targets']));
      checkTypeOrder(api.createFromInstance(domain));
    });
    test('Checking WebsiteApi', () async {
      var api = new WebsiteApi(sessionId: 'session', rpc: mockRpc);
      var website = new Website(
          'name',
          'ip',
          true,
          ['subdomains'],
          'certificate',
          [
            ['siteApps']
          ]);
      checkTypeOrder(api.listBandwidthUsage());
      checkTypeOrder(api.create(
          'website_name',
          'ip',
          true,
          ['subdomains'],
          'certificate',
          [
            ['siteApps']
          ]));
      checkTypeOrder(api.createFromInstance(website));
      checkTypeOrder(api.update(
          'website_name',
          'ip',
          true,
          ['subdomains'],
          'certificate',
          [
            ['siteApps']
          ]));
      checkTypeOrder(api.updateFromInstance(website));
      checkTypeOrder(api.delete('websiteName', 'ip', false));
      checkTypeOrder(api.deleteFromInstance(website));
      checkTypeOrder(api.list());
    });
    test('Checking DnsApi', () async {
      var api = new DnsApi(sessionId: 'session', rpc: mockRpc);
      var override = new DnsOverride('domain');
      checkTypeOrder(api.createOverride('domain'));
      checkTypeOrder(api.createOverrideFromInstance(override));
      checkTypeOrder(api.listOverrides());
      checkTypeOrder(api.deleteOverride('domain'));
      checkTypeOrder(api.deleteOverrideFromInstance(override));
    });
    test('Checking Shell_userApi', () async {
      var api = new ShellUserApi(sessionId: 'session', rpc: mockRpc);
      var user = new User('asd', 'sh', ['']);
      checkTypeOrder(api.changePassword('s', 's'));
      checkTypeOrder(api.changePasswordFromInstance(user, 'a'));
      checkTypeOrder(api.create('as', 'none', ['asdf']));
      checkTypeOrder(api.createFromInstance(user));
      checkTypeOrder(api.delete('sd'));
      checkTypeOrder(api.deleteFromInstance(user));
      checkTypeOrder(api.list());
    });
  });
  test('All methods should be called', () {
    var allMeth = new Set.from(allMethods);
    allMeth.addAll(calledMethods);

    expect(calledMethods.length, equals(allMeth.length - 1),
        reason: allMeth.difference(calledMethods).toString());
  });
}
