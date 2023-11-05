import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymentgateways/core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/master_card.svg'),
          const SizedBox(
            width: 23,
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Credit Card', style: Styles.style18),
                // TextSpan(text: 'MasterCard **78', style: Styles.style18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
