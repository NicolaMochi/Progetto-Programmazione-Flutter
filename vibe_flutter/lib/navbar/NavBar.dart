import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vibe_flutter/pages/accepted_page.dart';
import 'package:vibe_flutter/pages/add_page.dart';

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
    Add(),
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
                  icon: Icons.add,
                  text: 'Add',
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
