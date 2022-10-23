import 'package:flutter/material.dart';
import 'package:scoring_7419/application/repositories/auth_repository.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class ProfileTileSubScreens extends StatelessWidget {
  ProfileTileSubScreens({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isSignOut = false,
  });
  final void Function()? onTap;
  final String title;
  final IconData icon;
  bool isSignOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: isSignOut
              ? () {
                  AuthRepository.signOut();
                  Navigator.pop(context);
                }
              : onTap,
          leading: Icon(icon, color: isSignOut ? Colors.red : darkGrey),
          trailing: isSignOut
              ? null
              : const Icon(
                  Icons.arrow_forward_ios,
                  color: darkGrey,
                ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
