import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final iconList = <IconData>[
    Icons.home,
    Icons.calendar_today,
    Icons.leaderboard,
    Icons.person
  ];
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today), label: 'Calendar'),
    const BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Microphone'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/calendar');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/leaderboard');
    } else if (index == 4) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      unselectedItemColor: Color(0xFFE86500),
      selectedItemColor: Color(0xFFe69d65), // Color(0xFFf76c00),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      items: items,
      backgroundColor: Colors.black,
      //other params
    );
  }
}
