# webfaction_api

A dart client for webfaction's RPC API.

Official reference: https://docs.webfaction.com/xmlrpc-api/

Webfaction info: https://www.webfaction.com/?aid=50399 (affiliate link)

## Installation

1. `pubspec.yaml`:

```
environment:
  sdk: "<2.0.0"

dependencies:
  webfaction_api: '>=0.8.0'
```

2. `pub get`


## Example

    import 'package:webfaction_api/client.dart';
    import 'package:webfaction_api/containers.dart';

    main() async {
      var client = new Client('username', 'password', 'SomeServer543');
      await client.login();

      // or

      client.login().then((response) async {
        List<Map> rawResponse = await client.app.list();

        // Objects imported from `containers.dart`
        List<App> appListManuallyCreated = await client.app.list()
            .then((response) => response.map((data) => new App.fromMap(data)));

        // ... the `createList` helper is also imported from there
        List<App> appListUsingHelper = await client.app.list()
            .then((response) => createList(App, response));

        App newApp = await client.app
            .create('MyNewApp', 'django-2.0.5_mod_wsgi-4.6.4_python-3.6')
            .then((response) => new App.fromMap(response));

        // Or pass objects around
        App app = new App('MyNewApp', 'django-2.0.5_mod_wsgi-4.6.4_python-3.6');
        client.app.createFromInstance(app)
            .then((_) => client.app.deleteFromInstance(app));
      });
    }


## Usage


 1. Instanciate a client with your webfaction `username`, `password`, and `server name`

    `var client = new Client('username', 'password, 'Server153');

2. Login. The session ID is stored in the client so there is no need to pass it to subsequent calls. According to webfaction, the session ID remains valid for one hour

   client.login();

3. Call api methods.

## Method location

The webfaction API is large and flat. In order to tidy things up and make code completion more helpful, the methods were grouped and scoped to class properties corresponding to the section or subsection they appear under on the [API reference page](https://docs.webfaction.com/xmlrpc-api/apiref.html).

For example, methods under `Applications` are found on `client.app.<method>`

A couple slight deviations from this convention are as follows:

* Databases: `client.db`
* Email -> Addresses: `client.email`
* Email -> Mailboxes: `client.mailbox`
* Miscellaneous: `client.misc`
* General -> Login: `client.login(...)`

## Method naming

The method names use camel case instead of snake case, as per dart style recommendations, and the 'section' is removed from the name:

`create_db` becomes `client.db.create`
`create_db_user` becomes `client.db.createUser`

## API object data containers / structs

A collection of dumb objects have been provided that represent API input or output.

Most methods have a corresponding `<methodName>FromInstance` or `FromInstances` method that accept object instances.

Objects intended to be used with API methods that return data have a `.fromMap` factory method that can be instanciated  directly with the response data.
