import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/features/profile/profile_page.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class TitleAndProfile extends StatelessWidget {
  const TitleAndProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          "Score Match",
          style: TextStyle(
            fontSize: 48,
            fontFamily: titleFont,
            color: white,
          ),
          textAlign: TextAlign.center,
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfilePage();
              }));
            },
            child: const Icon(
              Icons.person,
              size: 34,
              color: white,
            ),
          ),
        ),
      ],
    );
  }
}
