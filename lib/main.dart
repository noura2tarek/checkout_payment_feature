import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/routes/app_routes.dart';
import 'features/checkout/presentation/screens/my_cart_view.dart';
import 'features/checkout/presentation/screens/payment_details_view.dart';
import 'features/checkout/presentation/screens/success_view.dart';

void main() async{
  Stripe.publishableKey = 'pk_test_51RWDldB6Xq746fZqlEfzvZIfo9Nmq5Yw8gcITR3aF6PptIGfJqt31WLvjkv0UAWHem1yioUdglAN4rn6SueEXODa00b1PZpzcr';
  runApp(const MyCheckOutApp());
}

class MyCheckOutApp extends StatelessWidget {
  const MyCheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Checkout App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.myCartView: (context) => const MyCartView(),
        AppRoutes.paymentDetailsView: (context) => const PaymentDetailsView(),
        AppRoutes.successView: (context) => const SuccessView(),
      },
    );
  }
}
