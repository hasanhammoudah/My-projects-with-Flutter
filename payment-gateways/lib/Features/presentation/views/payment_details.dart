import 'package:flutter/material.dart';
import 'package:paymentgateways/Features/presentation/views/widgets/payment_details_view_body.dart';
import 'package:paymentgateways/core/widgets/custom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          title: 'Payment Details',
        ),
        body: const PaymentDetailsViewBody(),
      ),
    );
  }
}
