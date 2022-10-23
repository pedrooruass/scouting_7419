import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class ProfileUserName extends StatelessWidget {
  final String profileName;
  const ProfileUserName({
    super.key,
    required this.profileName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          const Text(
            'Hello,',
            style: TextStyle(
              fontSize: 16,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            profileName,
            style: TextStyle(
              fontSize: 14,
              color: white,
              fontFamily: titleFont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
