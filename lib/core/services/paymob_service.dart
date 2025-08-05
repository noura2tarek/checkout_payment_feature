//class PaymobPayment {
//   final Dio dio = Dio();
//
//   final int integrationId = 5129169; // card integration ID
//
//
//   Future<Response> startPayment() async {
//     const String intentionUrl = 'https://accept.paymob.com/v1/intention/';
//
//     final Map<String, dynamic> requestBody = {
//       "amount": 10000,
//       "currency": "EGP",
//       "payment_methods": [integrationId],
//       // "redirection_url": redirectionUrl,
//       "billing_data": {
//         "first_name": "Ahmed",
//         "last_name": "Ali",
//         "email": "ahmed@example.com",
//         "phone_number": "+201234567890",
//         "country": "EG",
//       },
//     };
//
//     try {
//       final response = await dio.post(
//         intentionUrl,
//         options: Options(
//           headers: {
//             "Content-Type": "application/json",
//             "Authorization": "Token $secretKey",
//           },
//         ),
//         data: requestBody,
//       );
//       return response;
//     } catch (e) {
//       print("Error: $e");
//       rethrow;
//     }
//   }
// }
//------------------------------
//button//
//Padding(
//               padding: EdgeInsets.all(AppPadding.p20),
//               child: AppButton(
//                 title: "${AppStrings.pay(context: context)} \$44",
//                 onTap: () async{
//
//                   final pay = PaymobPayment();
//                   var reponse = await pay.startPayment();
//                   final checkoutUrl =
//                       'https://accept.paymob.com/unifiedcheckout/?publicKey=${pay.publicKey}&clientSecret=${reponse.data["client_secret"]}';
//
//                  if(mounted) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => CheckoutWebView(url: checkoutUrl),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//-------------------------
// checkout web view
//class CheckoutWebView extends StatefulWidget {
//   final String url;
//
//   const CheckoutWebView({super.key, required this.url});
//
//   @override
//   State<CheckoutWebView> createState() => _CheckoutWebViewState();
// }
//
// class _CheckoutWebViewState extends State<CheckoutWebView> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller =
//         WebViewController()
//           ..setJavaScriptMode(JavaScriptMode.unrestricted)
//           ..setNavigationDelegate(
//             NavigationDelegate(
//               onPageFinished: (url) async {
//                 print('Finished loading: $url');
//                 final currentUrl = await controller.currentUrl();
//                 if (currentUrl != null &&
//                     (currentUrl.contains("https://accept.paymobsolutions.com/api/acceptance/post_pay") )) {
//                   await Future.delayed( Duration(seconds: 1));
//                  if(mounted) {
//                     AppNavigator.pushNamed(
//                       context,
//                       AppRoutes.orderConfirmationRoute,
//                     );
//                   }
//                 }
//               },
//             ),
//           )
//           ..loadRequest(Uri.parse(widget.url));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: SafeArea(
//         child: Column(
//           children: [
//             AppbarWidget(title: AppStrings.payment(context:context)),
//             Expanded(child: WebViewWidget(controller: controller)),
//           ],
//         ),
//       ),
//     );
//   }
// }
