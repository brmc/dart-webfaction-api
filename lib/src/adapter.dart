import 'dart:async';
import 'package:xml_rpc/client.dart' as xml_rpc;

abstract class RpcAdapter {
  Future call(String methodName, List params);
}

const webfactionUrl = 'https://api.webfaction.com/';

class WebfactionRpc implements RpcAdapter{
  const WebfactionRpc();

  @override
  Future call(String methodName, List params) {
    return xml_rpc.call(webfactionUrl, methodName, params);
  }
}
