import 'package:flutter/material.dart';

class ContactMeBox extends StatelessWidget {
  const ContactMeBox({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    /// For making app responsive for the phone size
    Size size = MediaQuery.of(context).size;

    /// For accessing application theme both Light and Dark mode
    ThemeData theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .01, vertical: size.height * .01),
        child: Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Icon(
              icon,
              size: 30,
              color: theme.canvasColor,
            ),
            SizedBox(
              width: size.width * .1,
            ),
            Text(
              title,
              style: theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
