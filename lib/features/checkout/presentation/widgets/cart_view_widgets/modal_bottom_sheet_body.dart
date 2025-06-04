import 'package:flutter/material.dart';
import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/services/stripe_service.dart';
import '../../../models/payment_intent_input_model.dart';
import '../custom_button.dart';
import '../payment_details_widgets/payment_methods_list.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- payment methods list -- //
          const PaymentMethodsList(
            images: [
              Assets.imagesGatewayPhoto,
              Assets.imagesPaypalPhoto,
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomButton(
            buttonText: 'Continue',
            onPressed: () {
              // test paypal
              //PayPalService.checkoutUsingPayPal(context);
              // test stripe
              StripeService.checkoutPayment(
                inputModel:  PaymentIntentInputModel(
                  amount: 100,
                  currency: 'USD',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
