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
  static const allowedPerms = ['r', 'w', 'x'];
  List<String> paths;
  String permission;
  bool recursive;

  ApacheAcl(this.paths, this.permission, [this.recursive = true])
      : assert(permissionIsValid(permission), getInvalidMsg(permission));

  static permissionIsValid(String permission) {
    return permission
            .split('')
            .where((char) => !allowedPerms.contains(char))
            .length ==
        0;
  }

  static String getInvalidMsg(String permission) => '\n'
      'Allowed permissions for ApacheAcl: ${allowedPerms.toString()}'
      '\nYou entered: ${permission}';
}
