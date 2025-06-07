import 'package:flutter/material.dart';

class LectureButtomBar extends StatefulWidget {
  const LectureButtomBar({super.key});

  @override
  State<LectureButtomBar> createState() => _LectureButtomBarState();
}

class _LectureButtomBarState extends State<LectureButtomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(''),
    const Text(''),
    const Text(''),
    const Text(''),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Colors.white,
            indicatorColor: Colors.grey,
            // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(color:  Color.fromARGB(255, 41, 97, 18),)
            ),
          ),
          child: NavigationBar(
            height:60,
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            // onDestinationSelected: (index) => setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              NavigationDestination(icon: Icon(Icons.calendar_month), label: "Timetable"),
              NavigationDestination(
                icon: Icon(Icons.notifications),
                label: "Notification",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      );
}