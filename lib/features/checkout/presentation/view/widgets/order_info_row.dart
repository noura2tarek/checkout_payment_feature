import 'package:flutter/material.dart';
import '../../../../../core/styles/styles.dart';

class OrderInfoRow extends StatelessWidget {
  const OrderInfoRow({
    super.key,
    required this.title,
    required this.amount,
    this.secondTextStyle = AppStyles.style18,
  });

  final String title;
  final String amount;
  final TextStyle? secondTextStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.style18,
        ),
        Text(
          '$amount',
          style: secondTextStyle,
        ),
      ],
    );
  }
}
