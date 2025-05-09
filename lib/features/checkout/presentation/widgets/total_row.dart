import 'package:flutter/material.dart';
import '../../../../../core/styles/styles.dart';

class TotalRow extends StatelessWidget {
  const TotalRow({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: AppStyles.styleSemiBold24(),
        ),
        Text(
          '\$$text2',
          style: AppStyles.styleSemiBold24(),
        ),
      ],
    );
  }
}
