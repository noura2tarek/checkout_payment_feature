import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../features/checkout/models/payment_intent_input_model.dart';
import '../../features/checkout/models/payment_intent_object.dart';
import '../api_keys.dart';

// publishableKey global variable
// put it in.env and .gitignore
Dio _dio = Dio();

//---- Stripe Service class -----//
class StripeService {
  // 1- (Payment Intent object) create payment intent (amount:int, currency:usd)
  // 2- initialize payment sheet (client secret)
  // 3- present payment sheet

  //--- create payment intent method
  static Future<PaymentIntentObject?> createPaymentIntent(
      {required PaymentIntentInputModel inputModel}) async {
    try {
      // Map<String, dynamic> body = {
      //   'amount': 100,
      //   'currency': 'usd',
      // };
      // we can put those lines in api service
      final response = await _dio.post(
        '${ApiKeys.createPaymentIntentUrl}',
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: {
            'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          },
        ),
        data: inputModel.toMap(),
      );
      PaymentIntentObject paymentIntent =
          PaymentIntentObject.fromJson(response.data);
      return paymentIntent;
    } catch (e) {
      print('Error while create Payment Intent: ${e.toString()}');
    }
    return null;
  }

  // init payment sheet
  static Future<void> initPaymentSheet(
      {required PaymentIntentObject data}) async {
    try {
      // initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data.clientSecret,
          // // Customer keys -
          // we will need it if we need to save user card info for future use
          // customerEphemeralKeySecret: data['ephemeralKey'],
          // customerId: data['customer'],
          style: ThemeMode.dark,
        ),
      );
      // setState(() {
      //   _ready = true;
      // });
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Error: $e')),
      // );
      print('Error while init Payment Sheet: ${e.toString()}');
      rethrow;
    }
  }

  // Show payment sheet
  static Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Error: $e')),
      // );
      print('Error occurred while present Payment Sheet: ${e.toString()}');
      rethrow;
    }
  }

  // checkout payment
  static Future<void> checkoutPayment(
      {required PaymentIntentInputModel inputModel}) async {
    // create payment intent
    PaymentIntentObject? paymentIntent =
        await createPaymentIntent(inputModel: inputModel);
    // init payment sheet
    await initPaymentSheet(data: paymentIntent!);
    // show payment sheet
    await presentPaymentSheet();
  }
}
