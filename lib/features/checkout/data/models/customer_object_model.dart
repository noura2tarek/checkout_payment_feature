class CustomerObjectResponse {
  String? id;
  String? object;
  Map<String, dynamic>? address;
  int? balance;
  int? created;
  String? currency;
  String? defaultSource;
  bool? delinquent;
  String? description;
  String? email;
  String? invoicePrefix;
  bool? livemode;
  String? name;
  int? nextInvoiceSequence;
  String? phone;
  List<String>? preferredLocales;
  String? shipping;
  String? taxExempt;

  CustomerObjectResponse(
      {this.id,
      this.object,
      this.address,
      this.balance,
      this.created,
      this.currency,
      this.defaultSource,
      this.delinquent,
      this.description,
      this.email,
      this.invoicePrefix,
      this.livemode,
      this.name,
      this.nextInvoiceSequence,
      this.phone,
      this.preferredLocales,
      this.shipping,
      this.taxExempt});

  CustomerObjectResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    address = json['address'];
    balance = json['balance'];
    created = json['created'];
    currency = json['currency'];
    defaultSource = json['default_source'];
    delinquent = json['delinquent'];
    description = json['description'];
    email = json['email'];
    invoicePrefix = json['invoice_prefix'];
    livemode = json['livemode'];
    name = json['name'];
    nextInvoiceSequence = json['next_invoice_sequence'];
    phone = json['phone'];
    shipping = json['shipping'];
    taxExempt = json['tax_exempt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['address'] = this.address;
    data['balance'] = this.balance;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['default_source'] = this.defaultSource;
    data['delinquent'] = this.delinquent;
    data['description'] = this.description;
    data['email'] = this.email;
    data['invoice_prefix'] = this.invoicePrefix;
    data['livemode'] = this.livemode;
    data['name'] = this.name;
    data['next_invoice_sequence'] = this.nextInvoiceSequence;
    data['phone'] = this.phone;
    if (this.preferredLocales != null) {
      data['preferred_locales'] = this.preferredLocales!.toList();
    }
    data['shipping'] = this.shipping;
    data['tax_exempt'] = this.taxExempt;
    return data;
  }
}
