import 'package:flutter/material.dart';
import 'package:hasancv/utils/app_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SkillsProgress extends StatelessWidget {
  const SkillsProgress({
    super.key,
    required this.title,
    required this.progress,
  });

  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .015),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.displaySmall,
          ),
          const SizedBox(
            height: 5,
          ),

          // Progress Bar
          LinearPercentIndicator(
            lineHeight: size.height * .02,
            width: size.width * .8,
            alignment: MainAxisAlignment.center,
            barRadius: const Radius.circular(50),
            percent: progress,
            progressColor: AppColors.appPrimaryColor,
            backgroundColor: AppColors.appPrimaryColor.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
