import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/simple/app.dart';

/// See [AppApi]
class App {
  num id;
  String name;
  String type;
  bool autostart;
  num port;
  bool openPort;
  String extraInfo;
  String machine;

  App(this.name, this.type,
      [this.autostart = false, this.extraInfo = '', this.openPort = false]);

  App.fromMap(Map data) {
    id = data['id'];
    name = data['name'];
    type = data['type'];
    autostart = data['autostart'];
    port = data['port'];
    openPort = data['open_port'];
    extraInfo = data['extra_info'];
    machine = data['machine'];
  }
}

class AppType {
  String name;
  String label;
  String description;

  // Webfaction returns a string here
  String autostart;
  String extraInfo;
  bool openPort;

  AppType(this.name, this.label, this.description, this.autostart,
      this.openPort, this.extraInfo);

  AppType.fromMap(data)
      : this(data['name'], data['label'], data['description'],
            data['autostart'], data['open_port'], data['extra_info']);
}
