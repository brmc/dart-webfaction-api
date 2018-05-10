import 'dart:async';

import 'package:webfaction_api/src/data/misc.dart';

import 'api.dart';

class MiscApi extends Api {
  MiscApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future runPhpScript(String path, String codeBefore) =>
      call('run_php_script', [path, codeBefore]);

  Future runPhpScriptFromInstance(PhpScript script) =>
      runPhpScript(script.path, script.codeBefore);

  Future setApacheAcl(List<String> paths, String permission, bool recursive) {
    assert(ApacheAcl.permissionIsValid(permission),
        ApacheAcl.getInvalidMsg(permission));

    return call('set_apache_acl', [paths, permission, recursive]);
  }

  Future setApacheAclFromInstance(ApacheAcl acl) =>
      setApacheAcl(acl.paths, acl.permission, acl.recursive);

  Future system(String cmd) => call('system', [cmd]);

  Future systemFromInstance(Cmd cmd) => system(cmd.cmd);
}
