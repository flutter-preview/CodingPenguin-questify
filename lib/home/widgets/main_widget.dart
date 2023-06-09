import 'package:flutter/material.dart';
import 'task_widget.dart';
import 'search_bar.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {

    Text buildGreeting() {
      DateTime now = DateTime.now();
      DateTime midnight = DateTime(now.year, now.month, now.day, 0, 0);
      DateTime noon = DateTime(now.year, now.month, now.day, 12, 0);
      DateTime evening = DateTime(now.year, now.month, now.day, 17, 0);

      if (now.isAfter(midnight) && now.isBefore(noon)) {
        return Text(
          "Good morning, Danny",
          style: TextStyle(
            fontFamily: GoogleFonts.outfit().fontFamily,
            fontSize: 22
          )
        );
      } else if (now.isAfter(noon) && now.isBefore(evening)) {
        return Text(
          "Good afternoon, Danny",
          style: TextStyle(
            fontFamily: GoogleFonts.outfit().fontFamily,
            fontSize: 22
          )
        );
      } else {
        return Text(
          "Good evening, Danny",
          style: TextStyle(
            fontFamily: GoogleFonts.outfit().fontFamily,
            fontSize: 22
          )
        );
      }
    }
    return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: buildGreeting()
          ),
          SearchBarWidget(),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              "Your Tasks",
              style: TextStyle(
                  fontFamily: GoogleFonts.outfit().fontFamily,
                  fontSize: 22
                )
            )
          ),
          ListView(shrinkWrap: true, children: const [
            TaskWidget(),
            TaskWidget(),
            TaskWidget(),
            TaskWidget(),
            TaskWidget(),
          ])
      ]
    );
  }
}