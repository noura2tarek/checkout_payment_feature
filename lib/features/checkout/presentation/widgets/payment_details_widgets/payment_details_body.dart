import 'package:flutter/material.dart';
import '../../../../../../core/app_images/app_images.dart';
import '../custom_button.dart';
import 'custom_credit_card.dart';
import 'payment_methods_list.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        //--- Payment methods List ---//
        const SliverToBoxAdapter(
          child: PaymentMethodsList(images: [
            Assets.imagesGatewayPhoto,
            Assets.imagesPaypalPhoto,
          ]),
        ),
        // Custom credit card
        // Custom form
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formKey,
            autovalidateMode: autoValidateMode,
          ),
        ),
        //--- Pay button ---//
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                buttonText: 'Pay',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                   // Navigator.of(context).pushNamed(AppRoutes.successView);
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
