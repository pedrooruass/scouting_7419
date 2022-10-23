import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

Future<String?> profileDialog(BuildContext context, ProfileProvider profileProvider) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Coose your profile picture: ", style: TextStyle(fontWeight: FontWeight.w700, color: darkGrey)),
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      profileProvider.changeProfileImage(1);
                      profileProvider.getCurrentProfileImage();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(profileProvider.profileImageChoiceId == 1 ? Icons.circle : Icons.circle_outlined, color: darkGrey),
                        const SizedBox(width: 10),
                        Image.asset(profileProvider.profileImageAsset1),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      profileProvider.changeProfileImage(2);
                      profileProvider.getCurrentProfileImage();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(profileProvider.profileImageChoiceId == 2 ? Icons.circle : Icons.circle_outlined, color: darkGrey),
                        const SizedBox(width: 10),
                        Image.asset(profileProvider.profileImageAsset2),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      profileProvider.changeProfileImage(3);
                      profileProvider.getCurrentProfileImage();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(profileProvider.profileImageChoiceId == 3 ? Icons.circle : Icons.circle_outlined, color: darkGrey),
                        const SizedBox(width: 10),
                        Image.asset(profileProvider.profileImageAsset3),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      profileProvider.changeProfileImage(4);
                      profileProvider.getCurrentProfileImage();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(profileProvider.profileImageChoiceId == 4 ? Icons.circle : Icons.circle_outlined, color: darkGrey),
                        const SizedBox(width: 10),
                        Image.asset(profileProvider.profileImageAsset4),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGrey,
              foregroundColor: white,
            ),
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
