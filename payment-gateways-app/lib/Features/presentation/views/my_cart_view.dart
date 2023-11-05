import 'package:flutter/material.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/my_cart_view_body.dart';
import 'package:paymentgateways/core/widgets/custom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: 'My Cart'),
        body: const MyCartViewBody(),
      ),
    );
  }
}
