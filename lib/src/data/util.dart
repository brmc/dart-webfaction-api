import 'dart:mirrors';

createList(Type cls, List<Map> dataList) {
  var mirror = reflectClass(cls);

  return dataList
      .map((Map data) => mirror.newInstance(new Symbol('fromMap'), [data]));
}
