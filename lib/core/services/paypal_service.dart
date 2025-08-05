import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import '../api_keys.dart';
import '../routes/app_routes.dart';

class PayPalService {
  static checkoutUsingPayPal(BuildContext context,
      {required List<dynamic> transactions}) {
    // navigate to paypal web view
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        // from dashboard account
        secretKey: ApiKeys.paypalSecret,
        transactions: transactions,
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          // Note: use personal default account to test
          // navigate and remove until thank you page and keep home screen
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.successView,
              (route) {
            if (route.settings.name == AppRoutes.myCartView) {
              return true;
            }
            return false;
          });
        },
        onError: (error) {
          print("onError: $error");
          // show snack bar
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.toString())));
          // navigate and remove until home screen
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.myCartView, (route) => false);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
