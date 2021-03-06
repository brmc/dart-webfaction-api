var types = {
  'login': [String, String, String, num],
  'list_disk_usage': [],
  'create_mailbox': [String, bool, bool, String, bool, String],
  'delete_mailbox': [String],
  'list_mailboxes': [],
  'update_mailbox': [String, bool, bool, String, bool, String],
  'create_email': [
    String,
    String,
    bool,
    String,
    String,
    String,
    String,
    String
  ],
  'delete_email': [String],
  'list_emails': [],
  'change_mailbox_password': [String, String],
  'update_email': [
    String,
    [''].runtimeType,
    bool,
    String,
    String,
    String,
    String,
    String
  ],
  'create_certificate': [String, String, String, String],
  'delete_certificate': [String],
  'list_certificates': [],
  'update_certificate': [String, String, String, String],
  'create_domain': [
    String,
    [''].runtimeType
  ],
  'delete_domain': [
    String,
    [''].runtimeType
  ],
  'list_domains': [],
  'create_website': [
    String,
    String,
    bool,
    [''].runtimeType,
    String,
    [
      ['']
    ].runtimeType
  ],
  'delete_website': [String, String, bool],
  'list_bandwidth_usage': [],
  'list_websites': [],
  'update_website': [
    String,
    String,
    bool,
    [''].runtimeType,
    String,
    [
      ['']
    ].runtimeType
  ],
  'create_app': [String, String, bool, String, bool],
  'delete_app': [String],
  'list_apps': [],
  'list_app_types': [],
  'create_cronjob': [String],
  'delete_cronjob': [String],
  'create_dns_override': [
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String
  ],
  'delete_dns_override': [
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String
  ],
  'list_dns_overrides': [],
  'change_db_user_password': [String, String, String],
  'create_db': [String, String, String, String],
  'create_db_user': [String, String, String],
  'delete_db': [String, String],
  'change_db_password': [String, String, String],
  'delete_db_user': [String, String],
  'enable_addon': [String, String, String],
  'grant_db_permissions': [String, String, String],
  'list_dbs': [],
  'list_db_users': [],
  'revoke_db_permissions': [String, String, String],
  'replace_in_file': [
    String,
    [''].runtimeType
  ],
  'write_file': [String, String, String],
  'change_user_password': [String, String],
  'create_user': [
    String,
    String,
    [''].runtimeType
  ],
  'delete_user': [String],
  'list_users': [],
  'list_ips': [],
  'list_machines': [],
  'run_php_script': [String, String],
  'set_apache_acl': [
    ['a'].runtimeType,
    String,
    bool
  ],
  'system': [String],
};
