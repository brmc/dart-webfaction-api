import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';

/// Abstract class serving as the base for all other APIs
abstract class Api {
  String sessionId;
  final RpcAdapter rpc;

  /// Instantiated normally by [Client.login]
  ///
  /// You can use your own RPC Adapter for [rpc]. See [RpcAdapter] for more
  /// details
  ///
  /// If you want to instantiate this yourself, the [sessionId] is returned
  /// after logging in.
  Api({this.rpc = const WebfactionRpc(), this.sessionId});

  /// Makes an unstructured remote procedure call
  ///
  /// Use this if a method is missing or broken.
  ///
  /// You do not need to pass the [sessionId]. It will be passed for you
  Future call(String method, [List<dynamic> params]) {
    params = params ?? [];
    params.insert(0, sessionId);

    return rpc.call(method, params);
  }
}
