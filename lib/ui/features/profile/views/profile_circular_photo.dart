import 'package:flutter/material.dart';
import 'package:scoring_7419/ui/themee/colors.dart';

class ProfileCircularPhoto extends StatelessWidget {
  const ProfileCircularPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: red,
                  spreadRadius: 4,
                )
              ],
            ),
            child: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
