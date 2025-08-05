import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../core/services/stripe_service.dart';
import '../models/customer_input_model.dart';
import '../models/customer_object_model.dart';
import '../models/payment_intent_input_model.dart';

class Failure {
  final String message;

  Failure({required this.message});
}

// abstract class checkOut Repository
abstract class CheckOutRepo {
  Future<Either<Failure, void>> stripePayment(
      {required PaymentIntentInputModel inputModel});

  Future<Either<Failure, CustomerObjectResponse>> createCustomer(
      {required CustomerInputModel? inputModel});
}

// implement checkOut Repository
class CheckOutRepoImpl implements CheckOutRepo {
  //final PayPalService paypalService = PayPalService();

  // implement create customer
  @override
  Future<Either<Failure, CustomerObjectResponse>> createCustomer(
      {required CustomerInputModel? inputModel}) async {
    try {
      CustomerObjectResponse? customerObjectResponse =
          await StripeService.createCustomer(inputModel: inputModel);
      return Right(customerObjectResponse!);
    } on StripeException catch (e) {
      // will happen if the user cancel the payment
      return Left(
          Failure(message: e.error.message ?? 'Oops something went wrong'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  // implement stripe payment method
  @override
  Future<Either<Failure, void>> stripePayment(
      {required PaymentIntentInputModel inputModel}) async {
    try {
      await StripeService.checkoutPayment(paymentIntentInput: inputModel);
      return const Right(null);
    } on StripeException catch (e) {
      // will happen if the user cancel the payment
      return Left(
          Failure(message: e.error.message ?? 'Oops something went wrong'));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
