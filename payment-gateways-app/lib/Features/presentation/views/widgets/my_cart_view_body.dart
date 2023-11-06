import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentgateways/Features/checkout/repos/checkout_repo_impl.dart';
import 'package:paymentgateways/Features/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:paymentgateways/Features/presentation/views/payment_details.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/cart_info_item.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/payment_method_list_view.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/total_price.dart';
import 'package:paymentgateways/core/widgets/custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(title: 'Order Subtotal', value: r'$9.99'),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: 'Discount', value: r'$0'),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: 'Shipping', value: r'$8'),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.55',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
