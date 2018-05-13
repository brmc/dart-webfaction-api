import 'package:webfaction_api/src/api/misc.dart';

/// See [MiscApi]
class PhpScript {
  String path;
  String codeBefore;

  PhpScript(this.path, this.codeBefore);
}

/// See [MiscApi]
class Cmd {
  String cmd;

  Cmd(this.cmd);
}

/// See [MiscApi]
class ApacheAcl {
  List<String> paths;
  String permission;
  bool recursive;

  ApacheAcl(this.paths, this.permission, [this.recursive = true]);
}
