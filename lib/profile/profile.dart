import 'package:flutter/material.dart';

import '../navbar/navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x000),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.asset('assets/logos/MWHAHAH.png',
              width: 40, height: 40, fit: BoxFit.fitHeight)),
      // floatingActionButton: FloatingActionButton(child: Icon(Icons.mic), onPressed: () {}),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Navbar(),
      body: const Center(
          child: Text('THIS IS THE PROFILE PAGE.',
          style: TextStyle(color: Colors.white, fontSize: 24)
        )
      ),
    );
  }
}
