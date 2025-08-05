import 'package:checkout_payment/features/checkout/data/models/customer_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_object_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/services/paypal_service.dart';
import '../../../cubits/payment_cubit.dart';
import '../../../data/models/paypal_models/amount_model.dart';
import '../../../data/models/paypal_models/item_model.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../custom_button.dart';
import '../payment_details_widgets/payment_methods_list.dart';

class ModalBottomSheetBody extends StatefulWidget {
  ModalBottomSheetBody({
    super.key,
  });

  @override
  State<ModalBottomSheetBody> createState() => _ModalBottomSheetBodyState();
}

class _ModalBottomSheetBodyState extends State<ModalBottomSheetBody> {
  bool isPaypal = false;

  // update payment method
  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -- payment methods list -- //
          PaymentMethodsList(
            updatePaymentMethod: updatePaymentMethod,
            images: const [
              Assets.imagesGatewayPhoto,
              Assets.imagesPaypalPhoto,
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              // if success - go to success screen
              if (state is PaymentSuccess) {
                // navigate and remove until thank you page and keep home screen
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.successView, (route) {
                  if (route.settings.name == AppRoutes.myCartView) {
                    return true;
                  }
                  return false;
                });
                // If an error happens
              } else if (state is PaymentError) {
                // will happen if credentials are wrong
                // or the user cancel bottom sheet
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }
            },
            builder: (context, state) {
              // Continue button
              return CustomButton(
                isLoading: state is PaymentLoading,
                buttonText: 'Continue',
                onPressed: () async {
                  // amount data
                  AmountModel amountModel = AmountModel(
                      total: '100',
                      currency: "USD",
                      details: Details(
                          subtotal: '100', shipping: '0', shippingDiscount: 0));
                  List<ItemModel> items = [
                    ItemModel(
                        name: 'Apple',
                        quantity: 10,
                        price: '5',
                        currency: "USD"),
                    ItemModel(
                        name: 'Pineapple',
                        quantity: 5,
                        price: '10',
                        currency: "USD"),
                  ];
                  if (isPaypal) {
                    PayPalService.checkoutUsingPayPal(context,
                        transactions:
                            getTransactions(items: items, amount: amountModel));
                  } else {
                    //----- test stripe ---
                    //-- Customer input
                    CustomerInputModel customerInputModel = CustomerInputModel(
                      name: 'Ahmed',
                      email: 'ah33@example.com',
                      phone: '0123456789',
                    );
                    // 1- create customer object once then cache id securely
                    // check first if customer object is cached or not, if not
                    // make this request
                    CustomerObjectResponse? customerObject =
                        await BlocProvider.of<PaymentCubit>(context)
                            .createCustomer(
                      inputModel: customerInputModel,
                    );
                    PaymentIntentInputModel paymentInputModel =
                        PaymentIntentInputModel(
                      amount: 100,
                      currency: 'USD',
                      // i take it from test in post man we will change it
                      //'cus_SnmxKhz2f0NYlG'
                      customerId: customerObject?.id ?? '',
                    );
                    //2-  call stripe payment from cubit
                    BlocProvider.of<PaymentCubit>(context)
                        .stripePayment(inputModel: paymentInputModel);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

//--- get transactions method
getTransactions({required List<ItemModel> items, required AmountModel amount}) {
  return [
    {
      'amount': amount.toJson(),
      "item_list": {
        "items": items.map((e) => e.toJson()).toList(),
      }
    }
  ];
}
