import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/game_provider.dart';
import 'package:scoring_7419/application/providers/profile_provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';

class AuthRepository {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<bool> signInWithEmailAndPassword({required BuildContext context, required String email, required String password}) async {
    try {
      final authResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  static void resetAuthRepository({
    required GameProvider gameProvider,
    required TeamProvider teamProvider,
    required TournamentProvider tournamentProvider,
    required ProfileProvider profileProvider,
  }) {
    gameProvider.reset();
    teamProvider.reset();
    tournamentProvider.reset();
    profileProvider.resetProfile();
  }

  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }
}
