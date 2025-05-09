import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/payment_details_widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Payment Details', context: context),
      body: PaymentDetailsBody(),
    );
  }
}
