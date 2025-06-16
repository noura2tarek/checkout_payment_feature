import 'package:checkout_payment/features/checkout/cubits/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/colors/colors.dart';
import '../../../data/repo/checkout_repo.dart';
import '../custom_button.dart';
import '../order_info_row.dart';
import '../total_row.dart';
import 'modal_bottom_sheet_body.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                // navigate to payment details screen or show modal bottom sheet //
                // Navigator.pushNamed(context, AppRoutes.paymentDetailsView);
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider<PaymentCubit>(
                      create: (context) => PaymentCubit(CheckOutRepoImpl()),
                      child: ModalBottomSheetBody(),
                    );
                  },
                );
              }),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
