import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter_test_1/models/user.dart';
// import 'package:flutter_test_1/api_service.dart';

import '../home/home.dart';
import '../calendar/calendar.dart';
import '../leaderboard/leaderboard.dart';
import '../profile/profile.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.outfitTextTheme(),
          scaffoldBackgroundColor: const Color(0x00000000)),
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/calendar': (context) => const Calendar(),
        '/leaderboard': (context) => const Leaderboard(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
