import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/data/misc.dart';

import 'api.dart';

/// Execute shell commands, run php scripts, and set Apache ACL
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#miscellaneous](https://docs.webfaction.com/xmlrpc-api/apiref.html#miscellaneous)
class MiscApi extends Api {
  MiscApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-run_php_script](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-run_php_script)
  Future runPhpScript(String path, String codeBefore) =>
      call('run_php_script', [path, codeBefore]);

  Future runPhpScriptFromInstance(PhpScript script) =>
      runPhpScript(script.path, script.codeBefore);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-set_apache_acl](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-set_apache_acl)
  Future setApacheAcl(List<String> paths, String permission, bool recursive) {
    return call('set_apache_acl', [paths, permission, recursive]);
  }

  Future setApacheAclFromInstance(ApacheAcl acl) =>
      setApacheAcl(acl.paths, acl.permission, acl.recursive);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-system](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-system)
  Future system(String cmd) => call('system', [cmd]);

  Future systemFromInstance(Cmd cmd) => system(cmd.cmd);
}
