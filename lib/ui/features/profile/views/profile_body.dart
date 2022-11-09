import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_circular_photo.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_user_name.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_white_background.dart';

class ProfileBody extends StatelessWidget {
  final ProfileProvider profileProvider;

  const ProfileBody({super.key, required this.profileProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              const SizedBox(height: 12),
              ProfileCircularPhoto(profileProvider: profileProvider),
              const SizedBox(height: 12),
              ProfileUserName(
                profileName: profileProvider.getCurrentUserName(),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 6,
          child: ProfileWhiteBackground(),
        ),
      ],
    );
  }
}
