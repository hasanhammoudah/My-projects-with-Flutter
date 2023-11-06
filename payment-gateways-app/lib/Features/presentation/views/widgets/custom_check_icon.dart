import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -20,
      bottom: MediaQuery.sizeOf(context).height * .2,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
