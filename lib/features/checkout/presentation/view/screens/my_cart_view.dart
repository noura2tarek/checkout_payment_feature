import 'package:checkout_payment/core/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_images/app_images.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/order_info_row.dart';
import '../widgets/payment_details_widgets/payment_methods_list.dart';
import '../widgets/total_row.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Cart', context: context, isLeadig: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            //-- order image --//
            Expanded(child: Image.asset(Assets.imagesBasket)),
            const SizedBox(
              height: 20.0,
            ),
            const OrderInfoRow(
              title: 'Order Subtotal',
              amount: '\$42.97',
            ),
            const OrderInfoRow(
              title: 'Discount',
              amount: '\$0',
            ),
            const OrderInfoRow(
              title: 'Shipping',
              amount: '\$8',
            ),
            const Divider(
              thickness: 2.0,
              indent: 15.0,
              color: AppColors.dividerColor,
            ),
            TotalRow(
              text1: 'Total',
              text2: '50.97',
            ),
            const SizedBox(
              height: 10.0,
            ),
            // -- Compete payment button -- //
            CustomButton(
                buttonText: 'Complete Payment',
                onPressed: () {
                  // navigate to payment details screen  //
                  // Navigator.pushNamed(context, AppRoutes.paymentDetailsView);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ModalBottomSheetBody();
                    },
                  );
                }),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}

/////////
// -- modal bottom sheet body -- //
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
            buttonText: 'Pay',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
