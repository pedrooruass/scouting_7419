import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/game_provider.dart';
import 'package:scoring_7419/application/repositories/auth_repository.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

import '../../../../application/providers/profile_provider.dart';
import '../../../../application/providers/team_provider.dart';

class ProfileTileSubScreens extends StatelessWidget {
  const ProfileTileSubScreens({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.isSignOut = false,
  });

  final void Function()? onTap;
  final String title;
  final IconData icon;
  final bool isSignOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: isSignOut
              ? () {
                  AuthRepository.resetAuthRepository(
                    gameProvider: context.read<GameProvider>(),
                    teamProvider: context.read<TeamProvider>(),
                    // tournamentProvider: context.read<TournamentProvider>(),
                    profileProvider: context.read<ProfileProvider>(),
                  );
                  AuthRepository.signOut();
                  Navigator.pop(context);
                }
              : onTap,
          leading: Icon(icon, color: isSignOut ? Colors.red : darkGrey),
          trailing: isSignOut
              ? null
              : Image.asset(
                  "assets/icons/arrow_right.png",
                  height: 22,
                  fit: BoxFit.cover,
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
