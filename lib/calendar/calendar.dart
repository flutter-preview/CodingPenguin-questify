import 'package:flutter/material.dart';

import '../app_bar/app_bar.dart';
import '../navbar/navbar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0x000),
      appBar: CustomAppBar(),
      // floatingActionButton: FloatingActionButton(child: Icon(Icons.mic), onPressed: () {}),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Navbar(),
      body: Center(
          child: Text('THIS IS THE CALENDAR PAGE.',
          style: TextStyle(color: Colors.white, fontSize: 24)
        )
      ),
    );
  }
}
