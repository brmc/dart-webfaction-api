import 'package:webfaction_api/client.dart';
import 'package:webfaction_api/response.dart';

main() async {
  var client = new Client('username', 'password', 'SomeServer543');
  await client.login();

  // or

  client.login().then((response) async {
    List<Map> rawResponse = await client.app.list();

    // Objects imported from `response.dart`
    List<App> appListManuallyCreated = await client.app
        .list()
        .then((response) => response.map((data) => new App.fromMap(data)));

    // ... the helper is also imported from there
    List<App> appListUsingHelper =
        await client.app.list().then((response) => createList(App, response));

    App newApp = await client.app
        .create('MyNewApp', 'django-2.0.5_mod_wsgi-4.6.4_python-3.6')
        .then((response) => new App.fromMap(response));

    // Or pass objects around
    App app = new App('MyNewApp', 'django-2.0.5_mod_wsgi-4.6.4_python-3.6');
    client.app
        .createFromInstance(app)
        .then((_) => client.app.deleteFromInstance(app));
  });
}
