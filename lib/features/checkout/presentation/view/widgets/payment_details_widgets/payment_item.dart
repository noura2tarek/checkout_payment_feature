import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/colors/colors.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.image,
    required this.isActive,
  });

  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 62.0,
      width: 103.0,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            width: 1.5,
            color: isActive ? AppColors.green : AppColors.grey,
          ),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? AppColors.green : AppColors.white,
            blurRadius: 4.0,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SvgPicture.asset(
        image,
        height: 30.69,
        width: 45.0,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
