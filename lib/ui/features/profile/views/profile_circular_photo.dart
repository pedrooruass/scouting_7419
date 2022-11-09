import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/ui/features/auth/screens/views/profile_dialog.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class ProfileCircularPhoto extends StatelessWidget {
  final ProfileProvider profileProvider;

  const ProfileCircularPhoto({
    super.key,
    required this.profileProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(profileProvider.profileImageChoice),
          ),
          GestureDetector(
            onTap: () {
              profileDialog(context, profileProvider);
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: black,
                    spreadRadius: 4,
                  )
                ],
              ),
              child: const Icon(
                Icons.settings,
                color: black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
