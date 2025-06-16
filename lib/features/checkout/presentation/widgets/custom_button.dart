import 'package:flutter/material.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
  });

  final String buttonText;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60.0,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: AppColors.green,
      onPressed: onPressed,
      child: isLoading
          ? Center(
              child: const CircularProgressIndicator(
              color: AppColors.white,
            ))
          : Text(
              buttonText,
              style: AppStyles.styleMedium20,
            ),
    );
  }
}
