import 'dart:async';

import 'package:webfaction_api/src/adapter.dart';
import 'package:webfaction_api/src/api/simple/api.dart';
import 'package:webfaction_api/src/api/object/email.dart';

/// CRUD and password management operations for mailboxes
class MailboxApi extends Api {
  MailboxApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  changePassword(String mailboxName, String password) =>
      call('change_mailbox_password', [mailboxName, password]);

  changePasswordFromInstance(Mailbox mailbox, String password) =>
      changePassword(mailbox.name, password);

  create(String mailboxName,
          [enableSpamProtection = true,
          discardSpam = false,
          String spamRedirectFolder = '',
          useManualProcmailrc = false,
          String manualProcmailrc = '']) =>
      call('create_mailbox', [
        mailboxName,
        enableSpamProtection,
        discardSpam,
        spamRedirectFolder,
        useManualProcmailrc,
        manualProcmailrc,
      ]);

  createFromInstance(Mailbox mailbox) => create(
        mailbox.name,
        mailbox.enableSpamProtection,
        mailbox.discardSpam,
        mailbox.spamRedirectFolder,
        mailbox.useManualProcmailrc,
        mailbox.manualProcmailrc,
      );

  delete(String mailboxName) => call('delete_mailbox', [mailboxName]);

  deleteFromInstance(Mailbox mailbox) => delete(mailbox.name);

  list() => call('list_mailboxes');

  update(String mailboxName,
          [enableSpamProtection = true,
          discardSpam = false,
          String spamRedirectFolder = '',
          useManualProcmailrc = false,
          String manualProcmailrc = '']) =>
      call('update_mailbox', [
        mailboxName,
        enableSpamProtection,
        discardSpam,
        spamRedirectFolder,
        useManualProcmailrc,
        manualProcmailrc,
      ]);

  updateFromInstance(Mailbox mailbox) => update(
        mailbox.name,
        mailbox.enableSpamProtection,
        mailbox.discardSpam,
        mailbox.spamRedirectFolder,
        mailbox.useManualProcmailrc,
        mailbox.manualProcmailrc,
      );
}

/// CRUD operations for email addresses
///
/// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#addresses](https://docs.webfaction.com/xmlrpc-api/apiref.html#addresses)
class EmailAddressApi extends Api {
  EmailAddressApi({RpcAdapter rpc, String sessionId})
      : super(rpc: rpc, sessionId: sessionId);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_email](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-create_email)
  Future create(String address, String targets,
          [bool autoresponderOn = false,
          String autoresponderSubject = '',
          String autoresponderMessage = '',
          String autoresponderFrom = '',
          String scriptMachine = '',
          String scriptPath = '']) =>
      call('create_email', [
        address,
        targets,
        autoresponderOn,
        autoresponderSubject,
        autoresponderMessage,
        autoresponderFrom,
        scriptMachine,
        scriptPath
      ]);

  Future createFromInstance(Email email) => create(
        email.address,
        email.targets,
        email.autoresponderOn,
        email.autoresponderSubject,
        email.autoresponderMessage,
        email.autoresponderFrom,
        email.scriptMachine,
        email.scriptPath,
      );

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_email](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-delete_email)
  delete(String address) => call('delete_email', [address]);

  deleteFromInstance(Email email) => delete(email.address);

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_emails](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-list_emails)
  Future list() => call('list_emails');

  /// See [https://docs.webfaction.com/xmlrpc-api/apiref.html#method-update_email](https://docs.webfaction.com/xmlrpc-api/apiref.html#method-update_email)
  Future update(String address, List<String> targets,
          [bool autoresponderOn = false,
          String autoresponderSubject = '',
          String autoresponderMessage = '',
          String autoresponderFrom = '',
          String scriptMachine = '',
          String scriptPath = '']) =>
      call('update_email', [
        address,
        targets,
        autoresponderOn,
        autoresponderSubject,
        autoresponderMessage,
        autoresponderFrom,
        scriptMachine,
        scriptPath
      ]);

  Future updateFromInstance(Email email) => update(
        email.address,
        email.targets.split(','),
        email.autoresponderOn,
        email.autoresponderSubject,
        email.autoresponderMessage,
        email.autoresponderFrom,
        email.scriptMachine,
        email.scriptPath,
      );
}
