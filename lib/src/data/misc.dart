class PhpScript {
  String path;
  String codeBefore;

  PhpScript(this.path, this.codeBefore);
}

class Cmd {
  String cmd;

  Cmd(this.cmd);
}

class ApacheAcl {
  List<String> paths;
  String permission;
  bool recursive;

  ApacheAcl(this.paths, this.permission, [this.recursive = true]);
}
