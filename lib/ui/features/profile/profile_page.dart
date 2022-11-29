import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_body.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, widget) {
      return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icons/arrow_left.png")),
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 44,
              fontFamily: titleFont,
              color: white,
            ),
          ),
        ),
        body: ProfileBody(
          profileProvider: profileProvider,
        ),
      );
    });
  }
}
