import 'dart:async';

import 'package:webfaction_api/src/constants.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;

/// Abstract class serving as the base for all other APIs
abstract class Api {
  String sessionId;
  final Function rpc;

  /// Instantiated normally by [Client.login]
  ///
  /// If you want to instantiate this yourself, the [sessionId] is returned
  /// after logging in.
  ///
  /// You can use your own RPC implementation for [rpc]. It should be a
  /// [Function] that returns a [Future]
  Api({this.rpc = xml_rpc.call, this.sessionId});

  /// Makes an unstructured remote procedure call
  ///
  /// Use this if a method is missing or broken.
  ///
  /// You do not need to pass the [sessionId]. It will be passed for you
  Future call(String method, [List<dynamic> params]) {
    params = params ?? [];
    params.insert(0, sessionId);

    return rpc(webfactionUrl, method, params);
  }
}
