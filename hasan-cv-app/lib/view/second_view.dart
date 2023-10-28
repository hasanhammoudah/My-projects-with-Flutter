import 'package:flutter/material.dart';
import 'package:hasancv/data/dev_data.dart';
import 'package:hasancv/utils/app_strings.dart';
import 'package:hasancv/widget/contact_me_box.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key, required this.onNextPage});
  final VoidCallback onNextPage;

  @override
  Widget build(BuildContext context) {
    /// For making app responsive for the phone size
    Size size = MediaQuery.of(context).size;

    /// For accessing application theme both Light and Dark mode
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenBio,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  DevData.devBio,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .01),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenHobbies,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      DevData.devData.hobbies.length,
                      (index) => Text(
                        '${index + 1}.' '${DevData.devData.hobbies[index]}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .01),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenContact,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                ContactMeBox(
                  title: DevData.devData.number,
                  icon: Icons.phone,
                ),
                ContactMeBox(
                  title: DevData.devData.mail,
                  icon: Icons.mail,
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: onNextPage,
            icon: Icon(
              Icons.arrow_upward_outlined,
              size: 30,
              color: theme.canvasColor,
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
        ],
      ),
    );
  }
}
