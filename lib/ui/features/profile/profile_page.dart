import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/features/profile/views/profile_body.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 44,
            fontFamily: titleFont,
            color: white,
          ),
        ),
      ),
      body: const ProfileBody(),
    );
  }
}
