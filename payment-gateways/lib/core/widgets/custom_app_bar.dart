import 'package:flutter/material.dart';
import 'package:paymentgateways/core/utils/styles.dart';

AppBar buildAppBar({
  final String? title,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
    leading: const Icon(
      Icons.arrow_back_outlined,
      size: 25,
      color: Colors.black,
    ),
  );
}
