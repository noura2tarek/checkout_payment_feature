import 'package:flutter/material.dart';
import '../../../../../core/styles/styles.dart';

AppBar customAppBar({required String title, required BuildContext context, bool isLeadig = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.styleMedium25,
    ),
    leading: isLeadig ? IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30.0,
      ),
    ) : null,
  );
}
