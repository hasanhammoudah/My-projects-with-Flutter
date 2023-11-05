import 'package:flutter/material.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/custom_check_icon.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/custom_dash_line.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const CustomCheckIcon(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashLine(),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFd9D9D9),
              child: CircleAvatar(
                backgroundColor: Color(0xff34A853),
                child: Icon(
                  Icons.check,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
