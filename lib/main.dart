import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoring_7419/application/providers/autonomous_provider.dart';
import 'package:scoring_7419/application/providers/end_game_provider.dart';
import 'package:scoring_7419/application/providers/tele_op_provider.dart';
import 'package:scoring_7419/application/providers/tournament_provider.dart';
import 'package:scoring_7419/ui/features/page_view/page_viewer.dart';
import 'package:scoring_7419/ui/themee/colors.dart';
import 'package:scoring_7419/ui/themee/fonts.dart';

import 'application/providers/team_provider.dart';

Future<void> main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AutonomousProvider()),
        ChangeNotifierProvider(create: (_) => TeleOpProvider()),
        ChangeNotifierProvider(create: (_) => EndGameProvider()),
        ChangeNotifierProvider(create: (_) => TournamentProvider()),
        ChangeNotifierProvider(create: (_) => TeamProvider()),
      ],
      child: MaterialApp(
        title: "7419 Scoring",
        theme: ThemeData(
          primaryColor: black,
          fontFamily: bodyFont,
        ),
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        home: const PageViewer(),
      ),
    );
  }
}
