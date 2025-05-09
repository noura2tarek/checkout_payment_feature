import 'package:flutter/material.dart';
import 'payment_method_item.dart';

class PaymentMethodsList extends StatefulWidget {
  const PaymentMethodsList({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  State<PaymentMethodsList> createState() => _PaymentMethodsListState();
}

class _PaymentMethodsListState extends State<PaymentMethodsList> {
  bool isGatewayActive = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.0,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                 isGatewayActive = !isGatewayActive;
                  setState(() {});
              },
              child: PaymentMethodItem(
                image: widget.images[index],
                isActive: index == 0? isGatewayActive : !isGatewayActive,
            ),
            ),
          );
        },
      ),
    );
  }
}
