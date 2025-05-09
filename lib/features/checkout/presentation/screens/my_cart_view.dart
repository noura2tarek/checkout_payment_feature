import 'package:flutter/material.dart';
import '../widgets/cart_view_widgets/my_cart_view_body.dart';
import '../widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'My Cart',
        context: context,
        isLeading: false,
      ),
      body: MyCartViewBody(),
    );
  }
}


/////////
