/// This library defines the interaction with the webfaction API. [Client] is the intended entry point, but [Api] and its subclasses have been exposed so you can use them directly as you discover limitations or bugs
library client;

export 'src/client.dart';

export 'src/api/simple/api.dart';
export 'src/api/simple/app.dart';
export 'src/api/simple/certificate.dart';
export 'src/api/simple/cron.dart';
export 'src/api/simple/db.dart';
export 'src/api/simple/dns.dart';
export 'src/api/simple/domain.dart';
export 'src/api/simple/email.dart';
export 'src/api/simple/file.dart';
export 'src/api/simple/general.dart';
export 'src/api/simple/misc.dart';
export 'src/api/simple/server.dart';
export 'src/api/simple/shell_user.dart';
export 'src/api/simple/website.dart';
