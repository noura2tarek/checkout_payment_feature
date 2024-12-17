import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/app_images/app_images.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/styles/styles.dart';
import '../order_info_row.dart';
import '../total_row.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });
  ///// shaped container ////
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        //EDEDED
        //#EDEDED
        color: AppColors.grey2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      //-- content padding --//
      padding: const EdgeInsetsDirectional.only(
        top: 56.0,
        start: 12.0,
        end: 12.0,
      ),
      child: Column(
        children: [
          Text(
            'Thank You!',
            style: AppStyles.styleMedium25,
          ),
          Text(
            'Your transaction was successful',
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular20,
          ),
          SizedBox(
            height: 42.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: OrderInfoRow(
              title: 'Date',
              amount: '01/24/2023',
              secondTextStyle: AppStyles.styleSemiBold18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: OrderInfoRow(
              title: 'Time',
              amount: '10:15 AM',
              secondTextStyle: AppStyles.styleSemiBold18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: OrderInfoRow(
              title: 'To',
              amount: 'Sam Louis',
              secondTextStyle: AppStyles.styleSemiBold18,
            ),
          ),
          Divider(
            thickness: 2,
            height: 20,
            color: AppColors.dividerColor,
          ),
          // total row //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TotalRow(text1: 'Total', text2: '50.97'),
          ),
          //--- white contanier ---//
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 22.0),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesCreditLogo),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Credit Card',
                        style: AppStyles.style18,
                      ),
                      Text(
                        'Mastercard **78',
                        style: AppStyles.style16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          //-- last row --//
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.imagesBarCode,
                height: 71, // this height is the height of the row too.
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      width: 1.5,
                      color: AppColors.green,
                    ),
                  ),
                ),
                child: Text(
                  'PAID',
                  style: AppStyles.styleSemiBold24(color: AppColors.green),
                ),
              ),
            ],
          ),
          SizedBox(
            height:
                ((MediaQuery.of(context).size.height * 0.15 + 17) / 2) - 35.5,
          ),
        ],
      ),
    );
  }
}
