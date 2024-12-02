import 'package:flutter/material.dart';
import 'package:titkul_test/util/app_styles.dart';

class TabBarItem extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const TabBarItem({
    super.key,
    required this.day,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          day,
          style: AppStyles.titleSmallGrey11,
        ),
        const SizedBox(height: 10),
        Text(
          date,
          style: AppStyles.titleSmallBlack11,
        ),
      ],
    );
  }
}
