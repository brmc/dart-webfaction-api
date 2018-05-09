class Domain {
  String domain;
  List<String> subdomains;

  Domain(this.domain, this.subdomains);

  Domain.fromMap(Map map) : this(map['domain'], map['subdomain']);
}
