import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoring_7419/application/providers/autonomous_provider.dart';
import 'package:scoring_7419/application/providers/end_game_provider.dart';
import 'package:scoring_7419/application/providers/team_provider.dart';
import 'package:scoring_7419/application/providers/tele_op_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';

class AuthRepository {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final EndGameProvider endGameProvider = EndGameProvider();
  static final AutonomousProvider autonomousProvider = AutonomousProvider();
  static final TeleOpProvider teleOpProvider = TeleOpProvider();
  static final TeamProvider teamProvider = TeamProvider();
  static final TournamentProvider tournamentProvider = TournamentProvider();

  static Future<bool> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  static void resetAuthRepository() {
    endGameProvider.resetPoints();
    autonomousProvider.resetAutoPoints();
    teleOpProvider.resetPoints();
    // teamProvider.resetTeamModel();
    tournamentProvider.resetTournamentModels();
  }

  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }
}
