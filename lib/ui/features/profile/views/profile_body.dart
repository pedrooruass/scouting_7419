import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_circular_photo.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_user_name.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_white_background.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userEmail = FirebaseAuth.instance.currentUser!.email;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: const [
              ProfileCircularPhoto(),
              ProfileUserName(profileName: "uthonsuht"),
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
