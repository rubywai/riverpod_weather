import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    //layout builder , media query
    double width = MediaQuery.of(context).size.width;
    if (width <= 500) {
      return Scaffold(
        body: shell,
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            shell.goBranch(index);
          },
          selectedIndex: shell.currentIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      );
    } else {
      return Scaffold(
          body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (index) {
              shell.goBranch(index);
            },
            selectedIndex: shell.currentIndex,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.settings), label: Text('Settings')),
            ],
          ),
          Expanded(child: shell)
        ],
      ));
    }
  }
}
