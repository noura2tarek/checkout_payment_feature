import 'package:checkout_payment/features/checkout/presentation/view/screens/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'features/checkout/presentation/view/screens/payment_details_view.dart';
import 'features/checkout/presentation/view/screens/success_view.dart';

void main() {
  runApp(const MyCheckOutApp());
}

class MyCheckOutApp extends StatelessWidget {
  const MyCheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: MyCartView(),
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
