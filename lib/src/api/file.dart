import 'dart:async';

import 'api.dart';

class FileApi extends Api {
  FileApi(String sessionId, [Function rpc]) : super(sessionId, rpc);

  Future replace(String file, String textToReplace, String replacementText) =>
      call('replace_in_file', [
        file,
        [textToReplace, replacementText]
      ]);

  Future write(String file, String text, [mode = 'wb']) =>
      call('write_file', [file, text, mode]);
}
