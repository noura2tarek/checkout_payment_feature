// thia object is the response of the create payment intent api method
class PaymentIntentObject {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? liveMode;
  Tip? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentObject(
      {this.id,
      this.object,
      this.amount,
      this.amountCapturable,
      this.amountDetails,
      this.amountReceived,
      this.application,
      this.applicationFeeAmount,
      this.automaticPaymentMethods,
      this.canceledAt,
      this.cancellationReason,
      this.captureMethod,
      this.clientSecret,
      this.confirmationMethod,
      this.created,
      this.currency,
      this.customer,
      this.description,
      this.lastPaymentError,
      this.latestCharge,
      this.liveMode,
      this.metadata,
      this.nextAction,
      this.onBehalfOf,
      this.paymentMethod,
      this.paymentMethodConfigurationDetails,
      this.paymentMethodOptions,
      this.paymentMethodTypes,
      this.processing,
      this.receiptEmail,
      this.review,
      this.setupFutureUsage,
      this.shipping,
      this.source,
      this.statementDescriptor,
      this.statementDescriptorSuffix,
      this.status,
      this.transferData,
      this.transferGroup});

  PaymentIntentObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    amountCapturable = json['amount_capturable'];
    amountDetails = json['amount_details'] != null
        ? new AmountDetails.fromJson(json['amount_details'])
        : null;
    amountReceived = json['amount_received'];
    application = json['application'];
    applicationFeeAmount = json['application_fee_amount'];
    automaticPaymentMethods = json['automatic_payment_methods'] != null
        ? new AutomaticPaymentMethods.fromJson(
            json['automatic_payment_methods'])
        : null;
    canceledAt = json['canceled_at'];
    cancellationReason = json['cancellation_reason'];
    captureMethod = json['capture_method'];
    clientSecret = json['client_secret'];
    confirmationMethod = json['confirmation_method'];
    created = json['created'];
    currency = json['currency'];
    customer = json['customer'];
    description = json['description'];
    lastPaymentError = json['last_payment_error'];
    latestCharge = json['latest_charge'];
    liveMode = json['livemode'];
    metadata =
        json['metadata'] != null ? new Tip.fromJson(json['metadata']) : null;
    nextAction = json['next_action'];
    onBehalfOf = json['on_behalf_of'];
    paymentMethod = json['payment_method'];
    paymentMethodConfigurationDetails =
        json['payment_method_configuration_details'] != null
            ? new PaymentMethodConfigurationDetails.fromJson(
                json['payment_method_configuration_details'])
            : null;
    paymentMethodOptions = json['payment_method_options'] != null
        ? new PaymentMethodOptions.fromJson(json['payment_method_options'])
        : null;
    paymentMethodTypes = json['payment_method_types'].cast<String>();
    processing = json['processing'];
    receiptEmail = json['receipt_email'];
    review = json['review'];
    setupFutureUsage = json['setup_future_usage'];
    shipping = json['shipping'];
    source = json['source'];
    statementDescriptor = json['statement_descriptor'];
    statementDescriptorSuffix = json['statement_descriptor_suffix'];
    status = json['status'];
    transferData = json['transfer_data'];
    transferGroup = json['transfer_group'];
  }
}

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  AmountDetails.fromJson(Map<String, dynamic> json) {
    tip = json['tip'] != null ? new Tip.fromJson(json['tip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tip != null) {
      data['tip'] = this.tip!.toJson();
    }
    return data;
  }
}

class Tip {
  Tip();

  Tip.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({this.allowRedirects, this.enabled});

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    allowRedirects = json['allow_redirects'];
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_redirects'] = this.allowRedirects;
    data['enabled'] = this.enabled;
    return data;
  }
}

class PaymentMethodConfigurationDetails {
  String? id;
  dynamic parent;

  PaymentMethodConfigurationDetails({this.id, this.parent});

  PaymentMethodConfigurationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent'] = this.parent;
    return data;
  }
}

class PaymentMethodOptions {
  AmazonPay? amazonPay;
  Card? card;
  Tip? cashapp;
  Klarna? klarna;
  Link? link;

  PaymentMethodOptions(
      {this.amazonPay, this.card, this.cashapp, this.klarna, this.link});

  PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    amazonPay = json['amazon_pay'] != null
        ? new AmazonPay.fromJson(json['amazon_pay'])
        : null;
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    cashapp =
        json['cashapp'] != null ? new Tip.fromJson(json['cashapp']) : null;
    klarna =
        json['klarna'] != null ? new Klarna.fromJson(json['klarna']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amazonPay != null) {
      data['amazon_pay'] = this.amazonPay!.toJson();
    }
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    if (this.cashapp != null) {
      data['cashapp'] = this.cashapp!.toJson();
    }
    if (this.klarna != null) {
      data['klarna'] = this.klarna!.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    return data;
  }
}

class AmazonPay {
  dynamic expressCheckoutElementSessionId;

  AmazonPay({this.expressCheckoutElementSessionId});

  AmazonPay.fromJson(Map<String, dynamic> json) {
    expressCheckoutElementSessionId =
        json['express_checkout_element_session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['express_checkout_element_session_id'] =
        this.expressCheckoutElementSessionId;
    return data;
  }
}

class Card {
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;

  Card(
      {this.installments,
      this.mandateOptions,
      this.network,
      this.requestThreeDSecure});

  Card.fromJson(Map<String, dynamic> json) {
    installments = json['installments'];
    mandateOptions = json['mandate_options'];
    network = json['network'];
    requestThreeDSecure = json['request_three_d_secure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installments'] = this.installments;
    data['mandate_options'] = this.mandateOptions;
    data['network'] = this.network;
    data['request_three_d_secure'] = this.requestThreeDSecure;
    return data;
  }
}

class Klarna {
  dynamic preferredLocale;

  Klarna({this.preferredLocale});

  Klarna.fromJson(Map<String, dynamic> json) {
    preferredLocale = json['preferred_locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preferred_locale'] = this.preferredLocale;
    return data;
  }
}

class Link {
  dynamic persistentToken;

  Link({this.persistentToken});

  Link.fromJson(Map<String, dynamic> json) {
    persistentToken = json['persistent_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['persistent_token'] = this.persistentToken;
    return data;
  }
}
