class Account {
  String username;
  String webServer;
  String home;
  String mailServer;
  num id;

  Account(Map map) {
    username = map['username'];
    webServer = map['webServer'];
    home = map['home'];
    mailServer = map['mailServer'];
    id = map['id'];
  }
}
