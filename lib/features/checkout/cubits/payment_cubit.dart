import 'package:bloc/bloc.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_object_model.dart';
import 'package:checkout_payment/features/checkout/data/repo/checkout_repo.dart';
import 'package:meta/meta.dart';
import '../data/models/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  // Create customer
  Future<CustomerObjectResponse?> createCustomer(
      {CustomerInputModel? inputModel}) async {
    final result = await checkOutRepo.createCustomer(inputModel: inputModel);
    return result.fold((l) {
      emit(PaymentError(message: l.message));
      return null;
    }, (r) {
      emit(CreateCustomerSuccess());
      return r;
    });
  }

  // Stripe payment
  Future<void> stripePayment(
      {required PaymentIntentInputModel inputModel}) async {
    emit(PaymentLoading());
    final result = await checkOutRepo.stripePayment(inputModel: inputModel);
    result.fold((l) => emit(PaymentError(message: l.message)),
        (r) => emit(PaymentSuccess()));
  }
}
