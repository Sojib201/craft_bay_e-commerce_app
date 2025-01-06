import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key, required this.headername, required this.onTapSeeAll,
  }) : super(key: key);

  final String headername;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headername,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.6),
        ),
        TextButton(
            onPressed: onTapSeeAll,
            child: Text(
              "See all",
              style: TextStyle(color: AppColor.primaryColor),
            ))
      ],
    );
  }
}