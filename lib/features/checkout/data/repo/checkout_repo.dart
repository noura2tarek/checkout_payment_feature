import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../core/services/paypal_service.dart';
import '../../../../core/services/stripe_service.dart';
import '../models/payment_intent_input_model.dart';

class Failure {
  final String message;

  Failure({required this.message});
}

// abstract class checkOut Repository
abstract class CheckOutRepo {
  Future<Either<Failure, void>> stripePayment(
      {required PaymentIntentInputModel inputModel});
}

// implement checkOut Repository
class CheckOutRepoImpl implements CheckOutRepo {
  //final StripeService stripeService = StripeService();
  final PayPalService paypalService = PayPalService();

  @override
  Future<Either<Failure, void>> stripePayment(
      {required PaymentIntentInputModel inputModel}) async {
    try {
      await StripeService.checkoutPayment(inputModel: inputModel);
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
