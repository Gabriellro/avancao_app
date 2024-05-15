import 'package:flutter/material.dart';

import '_export_modules.dart';
import 'calendar/calendar_page.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/BottomNavBar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CalendarPage(),
    CoworkingPage(),
    LojaPage(),
    MenuPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // bottomNavigationBar: NavigationBar(
      //   elevation: 0,
      //   onDestinationSelected: _onItemTapped,
      //   selectedIndex: _selectedIndex,
      //   backgroundColor: Theme.of(context).colorScheme.surface,
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.today_rounded),
      //       icon: Icon(Icons.today_outlined),
      //       label: 'Agenda',
      //       tooltip: 'Agenda',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.groups_rounded),
      //       icon: Icon(Icons.groups_outlined),
      //       label: 'Coworking',
      //       tooltip: 'Coworking',
      //     ),
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.store_rounded),
      //       icon: Icon(Icons.store_outlined),
      //       label: 'Loja',
      //       tooltip: 'Loja',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.account_circle_rounded),
      //       label: 'Perfil',
      //       tooltip: 'Perfil',
      //     ),
      //   ],
      // ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          enableFeedback: false,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.outlineVariant,
          showUnselectedLabels: true,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
          currentIndex: _selectedIndex,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.today_rounded),
              ),
              label: 'Agenda',
              tooltip: 'Agenda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.groups_rounded),
              ),
              label: 'Coworking',
              tooltip: 'Coworking',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.store_rounded),
              ),
              label: 'Loja',
              tooltip: 'Loja',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.menu_rounded),
              ),
              label: 'Menu',
              tooltip: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
