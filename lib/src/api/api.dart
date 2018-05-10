import 'dart:async';

import 'package:webfaction_api/src/constants.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;

abstract class Api {
  String _sessionId;
  Function _rpc;

  Api(this._sessionId, [this._rpc = xml_rpc.call]);

  /// Makes an unstructured remote procedure call
  ///
  /// Use this if a method is missing or broken.
  ///
  /// You do not need to pass the [sessionId]. It will be passed for you
  Future call(String method, [List<dynamic> params]) {
    params = params ?? [];
    params.insert(0, _sessionId);

    return _rpc(webfactionUrl, method, params);
  }
}
