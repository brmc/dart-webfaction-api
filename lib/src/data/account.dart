import 'package:webfaction_api/src/client.dart';

/// The second part of the [Client.login] response is the account info,
/// but it is probably mostly useless
class Account {
  String username;
  String webServer;
  String home;
  String mailServer;
  num id;

  Account(this.username, this.webServer, this.home, this.mailServer, this.id);

  Account.fromMap(Map map)
      : this(map['username'], map['web_server'], map['home'],
            map['mail_server'], map['id']);
}
