import 'package:webfaction_api/src/api/shell_user.dart';

class User {
  String username;
  String shell;
  List<String> groups;

  User(this.username, this.shell, [this.groups = const []])
      : assert(shells.contains(shell));

  User.fromMap(Map map) : this(map['username'], map['shell'], map['groups']);
}
