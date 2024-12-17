import 'package:checkout_payment/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'thank_you_card.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30.0,
              ),
            ),
          ),
          //-- The stack Container --//
          Transform.translate(
            offset: Offset(0, -2),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.84,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  //alignment: Alignment.topCenter,
                  children: [
                    // thank you Container card //
                    ThankYouCard(),
                    // positioned controls where a child of a [Stack] is positioned.
                    Positioned(
                      top: -50.0,
                      right: 0,
                      left: 0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: AppColors.grey2,
                        child: CircleAvatar(
                          backgroundColor: AppColors.green,
                          radius: 40.0,
                          child: Icon(
                            Icons.check,
                            size: 55.0,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.15,
                      left: -17.0,
                      child: const CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 17.0,
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.15 + 17,
                      right: 20,
                      left: 20,
                      child: Row(
                        children: List.generate(
                          25,
                          (index) => Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                height: 2,
                                width: 2,
                                color: AppColors.containerColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.15,
                      right: -17.0,
                      child: const CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}