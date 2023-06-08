import 'package:flutter/material.dart';

import 'home/widgets/home_widget.dart';
import 'calendar/widgets/main_widget.dart';
import 'leaderboard/widgets/main_widget.dart';
import 'user_profile/widgets/main_widget.dart';

class ApiConstants {
  static String productionUrl = '';
  static String devUrl = 'http://localhost:4201';
  static String usersEndpoint = '/users';
  static String tasksEndpoint = '/tasks';
}

const List<Widget> widgetOptions = <Widget>[
  HomeWidget(),
  CalendarWidget(),
  LeaderboardWidget(),
  UserProfileWidget(),
];
