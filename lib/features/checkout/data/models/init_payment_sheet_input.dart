class InitPaymentSheetInputModel {
  final String? clientSecret;
  final String? ephemeralKey;
  final String? customerId;

  InitPaymentSheetInputModel(
      {this.ephemeralKey, this.customerId, required this.clientSecret});
}
