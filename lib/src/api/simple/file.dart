import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';

import 'api.dart';

/// Write and edit files on your server
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#files](https://docs.webfaction.com/xmlrpc-api/apiref.html#files)
class FileApi extends Api {
  FileApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-replace_in_file](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-replace_in_file)
  Future replace(String file, String textToReplace, String replacementText) =>
      call('replace_in_file', [
        file,
        [textToReplace, replacementText]
      ]);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-write_file](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-write_file)
  Future write(String file, String text, [mode = 'wb']) =>
      call('write_file', [file, text, mode]);
}
