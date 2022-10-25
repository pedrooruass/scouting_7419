import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Support",
          style: TextStyle(
            fontSize: 38,
            fontFamily: titleFont,
            color: white,
          ),
        ),
      ),
      backgroundColor: black,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 28,
                fontFamily: titleFont,
                color: white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Email: 7419scoringapp@gmail.com",
              style: TextStyle(
                fontSize: 18,
                color: white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Image.asset(
                "assets/gif/7419.gif",
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
