import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vibe_flutter/pages/accepted_page.dart';
import 'package:vibe_flutter/pages/cerca_page.dart';

import 'package:vibe_flutter/pages/home_page.dart';
import 'package:vibe_flutter/pages/profile.dart';

class NavBarok extends StatefulWidget {
  const NavBarok({Key? key}) : super(key: key);

  @override
  State<NavBarok> createState() => _NavBarokState();
}

class _NavBarokState extends State<NavBarok> {
  int _selectedIndex = 0;
  // to navigate in bottom bar
  void _navigationBottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    HomePage(),
    Accepted(),
    Cerca(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.orange,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: GNav(
              backgroundColor: Colors.orange,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.orange.shade800,
              gap: 10,
              onTabChange: _navigationBottombar,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.add_task,
                  text: 'Accepted',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ],
            ),
          ),
        ));
  }
}
