import 'package:webfaction_api/src/api/server.dart';

/// See [ServerApi]
class Ip {
  num id;
  String machine;
  String address;
  bool isMain;

  Ip(this.id, this.machine, this.address, this.isMain);

  Ip.fromMap(Map map) {
    id = map['id'];
    machine = map['machine'];
    address = map['address'];
    isMain = map['is-main'];
  }
}

/// See [ServerApi]
class Machine {
  num id;
  String name;
  String operatingSystem;
  String location;

  Machine(this.id, this.name, this.operatingSystem, this.location);

  Machine.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    operatingSystem = map['operating_system'];
    location = map['location'];
  }
}
