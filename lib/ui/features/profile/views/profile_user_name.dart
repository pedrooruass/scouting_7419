import 'package:flutter/material.dart';

class ProfileUserName extends StatelessWidget {
  const ProfileUserName({
    Key? key, required this.profileName,
  }) : super(key: key);

  final String profileName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children:  [
          const Text(
            'Hello,',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            profileName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
