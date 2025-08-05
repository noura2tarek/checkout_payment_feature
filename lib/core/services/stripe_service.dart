import 'package:checkout_payment/features/checkout/data/models/customer_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_object_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../features/checkout/data/models/init_payment_sheet_input.dart';
import '../../features/checkout/data/models/payment_intent_input_model.dart';
import '../../features/checkout/data/models/payment_intent_object.dart';
import '../api_constants.dart';
import '../api_keys.dart';

// publishableKey global variable
// put it in.env and .gitignore
Dio _dio = Dio();

// 1- (Payment Intent object) create payment intent (amount:int, currency: string (usd), customer: string (customer id))()
// 2- initialize payment sheet (client secret)
// 3- present payment sheet.
//-----------------------------------------------------
////--- if we need to save user card info for future use
// 1- create customer object to get customer id
// 2- (emphemeral key secret) create emphemeral key (customer id, stripe version -h)
// 3- (Payment Intent object) create payment intent (amount:int, currency: string (usd), customer: string (customer id))()
// 4- initialize payment sheet (client secret, ephemeral key secret, customer id, merchant display name)
// 5- present payment sheet
//------- Stripe Service class -------//
class StripeService {
  //--- create payment intent method
  static Future<PaymentIntentObject?> createPaymentIntent(
      {required PaymentIntentInputModel inputModel}) async {
    try {
      // we can put those lines in api service
      final response = await _dio.post(
        '${ApiConstants.createPaymentIntentUrl}',
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

  //-- init payment sheet
  static Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel inputModel}) async {
    try {
      // initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: inputModel.clientSecret,
          // // Customer keys -
          // we will need it if we need to save user card info for future use
          customerEphemeralKeySecret: inputModel.ephemeralKey,
          customerId: inputModel.customerId,
          style: ThemeMode.dark,
        ),
      );
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

  //----------
  // Create customer object method
  static Future<CustomerObjectResponse?> createCustomer(
      {required CustomerInputModel? inputModel}) async {
    try {
      // we can put those lines in api service
      final response = await _dio.post(
        '${ApiConstants.createCustomerObjectUrl}',
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: {
            'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          },
        ),
        data: inputModel?.toMap(),
      );
      CustomerObjectResponse customerObjectResponse =
          CustomerObjectResponse.fromJson(response.data);
      return customerObjectResponse;
    } catch (e) {
      print('Error while create customer object: ${e.toString()}');
    }
    return null;
  }

  // Create emphemeral key method
  static Future<String?> createEphemeralKey(
      {required String customerId}) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.createEphemeralKeyUrl}',
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          headers: {
            'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
            // add stripe version
            'Stripe-Version': '2025-07-30.basil',
          },
        ),
        data: {
          'customer': customerId,
        },
      );
      // returns empheral secret key
      // response
      // {
      //     "id": "ephkey_1RsBRm2eZvKYlo2C7maE3ziU",
      //     "object": "ephemeral_key",
      //     "associated_objects": [
      //         {
      //             "id": "cus_SnmxKhz2f0NYlG",
      //             "type": "customer"
      //         }
      //     ],
      //     "created": 1754264170,
      //     "expires": 1754267770,
      //     "livemode": false,
      //     "secret": "ek_test_YWNjdF8xMDMyRDgyZVp2S1lsbzJDLEVqOHA5OTJCZlIzTlV5aXBYemttZE1WeXF6S2Y2aXI_00L74GtRaT"
      // }
      String secret = response.data['secret'];
      print('ephemeral key secret: $secret');
      return secret;
    } catch (e) {
      print('Error while create Ephemeral Key: ${e.toString()}');
    }
    return null;
  }

  // Checkout payment
  static Future<void> checkoutPayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    // 1- create customer  - this operation we make once if we need to save user card info for future use
    // 2- create ephemeral key
    String? ephemeralKey =
        await createEphemeralKey(customerId: paymentIntentInput.customerId ?? '');
    // 3- create payment intent
    PaymentIntentObject? paymentIntent =
        await createPaymentIntent(inputModel: paymentIntentInput);
    // 4- init payment sheet
    InitPaymentSheetInputModel paymentSheetInput = InitPaymentSheetInputModel(
      clientSecret: paymentIntent!.clientSecret,
      ephemeralKey: ephemeralKey,
      customerId: paymentIntentInput.customerId,
    );
    // init payment sheet
    await initPaymentSheet(inputModel: paymentSheetInput);
    // show payment sheet
    await presentPaymentSheet();
  }
}
