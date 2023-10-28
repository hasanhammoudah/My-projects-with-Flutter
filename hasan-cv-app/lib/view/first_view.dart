// First Item of our page view
import 'package:flutter/material.dart';
import 'package:hasancv/data/dev_data.dart';
import 'package:hasancv/utils/app_colors.dart';
import 'package:hasancv/utils/app_strings.dart';
import 'package:hasancv/widget/skills_box.dart';
import 'package:hasancv/widget/skills_progress.dart';

class FirstView extends StatelessWidget {
  const FirstView({
    super.key,
   required this.onNextPage,
  });

  final VoidCallback onNextPage;
  @override
  Widget build(BuildContext context) {
    /// For making app responsive for the phone size
    Size size = MediaQuery.of(context).size;

    /// For accessing application theme both Light and Dark mode
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: size.height * .01,
        ),

        // Developer Avatar
        Container(
          padding: EdgeInsets.all(size.height * .01),
          decoration: BoxDecoration(
            color: theme.cardColor,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: size.height * .15,
            backgroundColor: AppColors.appPrimaryColor,
            backgroundImage: const NetworkImage(AppStrings.profileImageUrl),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Text(
          DevData.devData.name,
          style: theme.textTheme.displayLarge,
        ),
        SizedBox(
          height: size.height * .01,
        ),
        // Developer Skills
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: size.width * .05,
          runSpacing: size.width * .03,
          children: List.generate(
            DevData.devData.skillsAndProgress.length,
            (index) =>
                SkillsBox(title: DevData.devData.skillsAndProgress[index].name),
          ),
        ),
        SizedBox(
          height: size.height * .03,
        ),
        Column(
          children: List.generate(
            DevData.devData.skillsAndProgress.length,
            (index) => SkillsProgress(
              title: DevData.devData.skillsAndProgress[index].name,
              progress: DevData.devData.skillsAndProgress[index].progress,
            ),
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: onNextPage,
          icon: Icon(
            Icons.arrow_downward_outlined,
            size: 30,
            color: theme.canvasColor,
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
      ],
    );
  }
}
