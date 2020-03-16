import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:classapp/ui/screens/notification_screen.dart';
import 'package:classapp/ui/screens/timetablescreens/main_timetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;
  PageController _pageController;

  List items = <BottomNavyBarItem>[
    BottomNavyBarItem(
      title: Text('Home'),
      icon: Icon(Icons.home),
      activeColor: Colors.blueAccent[200],
    ),
    BottomNavyBarItem(
      title: Text('Time Table'),
      icon: Icon(Icons.apps),
      activeColor: Colors.yellowAccent[200],
    ),
    BottomNavyBarItem(
      title: Text('notifications'),
      icon: Icon(Icons.notifications),
      activeColor: Colors.yellowAccent[200],
    ),
    BottomNavyBarItem(
      title: Text('Settings'),
      icon: Icon(Icons.settings),
      activeColor: Colors.greenAccent[200],
    ),
  ];

  List children = <Widget>[
    Container(color: Colors.blueAccent[200]),
    MainTimeTableScreen(),
    NotificationScreen(),
    Container(color: Colors.greenAccent[200]),
  ];

  @override
  void initState() {
  
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          "classapp",
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
              onPressed: null)
        ],
        backgroundColor: Colors.grey.shade900,
        elevation: 1.0,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: children,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        items: items,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);

          _pageController.jumpToPage(index);
        },
        selectedIndex: _currentIndex,
        showElevation: false,
      ),
    );
  }
}
