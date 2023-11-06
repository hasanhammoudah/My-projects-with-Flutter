import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentgateways/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:paymentgateways/Features/checkout/data/models/amount_model/details.dart';
import 'package:paymentgateways/Features/checkout/data/models/item_list_model/item.dart';
import 'package:paymentgateways/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:paymentgateways/Features/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:paymentgateways/Features/presentation/views/thank_you.dart';
import 'package:paymentgateways/core/utils/api_keys.dart';
import 'package:paymentgateways/core/widgets/custom_button.dart';

class CutomButtonBlocConsumer extends StatelessWidget {
  const CutomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
          onTap: () {
            var transactionData = getTransctionsData();
            exceutePaypalPayment(context, transactionData);
          },

          // PaymentIntentInputModel paymentIntentInputModel =
          //     PaymentIntentInputModel(
          //         amount: '100',
          //         currency: 'USD',

          //         customerId: 'cus_OxTq9ANxYO2l7L');
          // BlocProvider.of<PaymentCubit>(context).makePayment(
          //     paymentIntentInputModel: paymentIntentInputModel);
        );
      },
    );
  }

  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientID,
        secretKey: ApiKeys.payPalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
        total: "100",
        currency: 'USD',
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
