import 'package:bloc/bloc.dart';
import 'package:checkout_payment/features/checkout/data/repo/checkout_repo.dart';
import 'package:meta/meta.dart';
import '../data/models/payment_intent_input_model.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  // Stripe payment
  Future<void> stripePayment(
      {required PaymentIntentInputModel inputModel}) async {
    emit(PaymentLoading());
    final result = await checkOutRepo.stripePayment(inputModel: inputModel);
    result.fold((l) => emit(PaymentError(message: l.message)), (r) =>
        emit(PaymentSuccess()));
  }
}
