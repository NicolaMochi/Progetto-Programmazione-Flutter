import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:vibe_flutter/pages/accepted_page.dart';
import 'package:vibe_flutter/pages/cerca_page.dart';
import 'package:vibe_flutter/pages/dettaglio_evento.dart';

import 'package:vibe_flutter/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  late Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Evento');
  }

  Widget _buildEventItem({required Map events}) {
    // mappa con tutti i dati

    return GestureDetector(
      onTap: () {
        Navigator.of(this.context).push(MaterialPageRoute(
            builder: (context) => DettaglioEvento(events: events)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        height: 150,
        color: Colors.grey.shade200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      events['titolo'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.event,
                          color: Colors.orangeAccent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          events['data_evento'],
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 90,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.euro,
                          color: Colors.orangeAccent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          events['costo'],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.category,
                          color: Colors.orangeAccent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          events['categoria'],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutti gli eventi'),
        actions: <Widget>[
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: double.infinity,

        /* datasnaphot contains all the data of the _ref in an animated list*/

        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map events = snapshot.value
                as Map; // each snapshot contain a child of the event
            return _buildEventItem(events: events);
          },
        ),
      ),
    );

    /*
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap:
              _navigationBottombar, // change the index in navigatonBottombar fun with the index  tapped by the user
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task), label: 'Accepted'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cerca'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],*/
  }

  /*Widget build1(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
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
      ),
    );
  }*/
}


/*
 bottomNavigationBar: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            backgroundColor: Colors.orange,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.orange.shade800,
            gap: 10,

            onTabChange:  ,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: ,
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
      ),*/

// under body 
      /*Container(
        height: double.infinity,

        /* datasnaphot contains all the data of the _ref in an animated list*/

        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map events = snapshot.value
                as Map; // each snapshot contain a child of the event
            return _buildContactItem(events: events);
          },
        ),
        
        
      ),*/