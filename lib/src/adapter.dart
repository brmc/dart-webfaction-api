import 'dart:async';
import 'package:xml_rpc/client.dart' as xml_rpc;

abstract class RpcAdapter {
  Future call(String methodName, List params);
}

class WebfactionRpc implements RpcAdapter {
  final webfactionUrl = 'https://api.webfaction.com/';

  const WebfactionRpc();

  @override
  Future call(String methodName, List params) {
    return xml_rpc.call(webfactionUrl, methodName, params);
  }
}
