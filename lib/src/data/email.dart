import 'package:webfaction_api/src/api/email.dart';

/// See [MailboxApi]
class Mailbox {
  String name;
  bool enableSpamProtection;
  String password;
  bool discardSpam;
  String spamRedirectFolder;
  bool useManualProcmailrc;
  String manualProcmailrc;

  Mailbox(this.name, this.password,
      [this.enableSpamProtection = true,
      this.discardSpam = false,
      this.spamRedirectFolder = '',
      this.useManualProcmailrc = false,
      this.manualProcmailrc = '']);

  Mailbox.fromMap(Map map)
      : this(
          map['name'],
          map['password'],
          map['enable_spam_protection'],
          map['discard_spam'],
          map['spam_redirect_folder'],
          map['use_manual_procmailrc'],
          map['manual_procmailrc'],
        );
}

class Email {
  String address;
  String targets;
  bool autoresponderOn;
  String autoresponderSubject;
  String autoresponderMessage;
  String autoresponderFrom;
  String scriptMachine;
  String scriptPath;

  Email(this.address, this.targets,
      [this.autoresponderOn = false,
      this.autoresponderSubject = '',
      this.autoresponderMessage = '',
      this.autoresponderFrom = '',
      this.scriptMachine = '',
      this.scriptPath = '']);

  Email.fromMap(Map map)
      : this(
          map['email_address'],
          map['targets'],
          map['autoresponder_on'] == 1 ? true : false,
          map['autoresponder_subject'] ?? '',
          map['autoresponder_message'] ?? '',
          map['autoresponder_from'] ?? '',
          map['script_machine'] ?? '',
          map['script_path'] ?? '',
        );
}
