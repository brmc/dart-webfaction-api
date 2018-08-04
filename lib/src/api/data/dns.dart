import 'package:webfaction_api/src/api/simple/dns.dart';

/// See [DnsApi]
class DnsOverride {
  String domain;
  String aIp;
  String cname;
  String mxName;
  String mxPriority;
  String spfRecord;
  String aaaaIp;
  String srvRecord;

  DnsOverride(String this.domain,
      [this.aIp = '',
      this.cname = '',
      this.mxName = '',
      this.mxPriority = '',
      this.spfRecord = '',
      this.aaaaIp = '',
      this.srvRecord = '']);

  DnsOverride.fromMap(Map map)
      : this(
            map['domain'],
            map['a_ip'],
            map['cname'],
            map['mx_name'],
            map['mx_priority'],
            map['spf_record'],
            map['aaaa_ip'],
            map['srv_record']);
}
