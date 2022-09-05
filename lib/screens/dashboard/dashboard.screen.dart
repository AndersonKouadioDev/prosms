import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/screens/others/nothing.screen.dart';
import 'components/body.dart';

class DashboardScreen extends StatefulWidget {
  final int index;
  const DashboardScreen({super.key, this.index = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState(index: index);
}

class _DashboardScreenState extends State<DashboardScreen> {
   int index;
  _DashboardScreenState({required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: myAppBar(context),
      body: Body(
        index: index,
      ),
      bottomNavigationBar: myBottomBar(context),
    ));
  }

// AppBar

  AppBar myAppBar(BuildContext context) {
    switch (index) {
      case 0:
        return AppBar(
          backgroundColor: psBackgroundColor,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.secondary),
          title: Text(
            'ProSMS',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                color: Theme.of(context).colorScheme.secondary),
          ),
          actions: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: psDefaultPadding),
                child: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NothingScreen(
                                title: 'Notifications',
                                message:
                                    "Vous n'avez aucune nouvelle notification",
                              ))),
                  icon: const Icon(CupertinoIcons.bell_fill),
                ))
          ],
          elevation: 0,
        );
      case 1:
        return AppBar(
          backgroundColor: psBackgroundColor,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.secondary),
          title: Text(
            'Mes Statistiques',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                color: Theme.of(context).colorScheme.secondary),
          ),
        );
      case 2:
        return AppBar(
          backgroundColor: psBackgroundColor,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.secondary),
          title: Text(
            'Mon Compte',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                color: Theme.of(context).colorScheme.secondary),
          ),
        );
      default:
        return AppBar(
          backgroundColor: psBackgroundColor,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.secondary),
          title: Text(
            'ProSMS',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).colorScheme.secondary),
          ),
          actions: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: psDefaultPadding),
                child: const Icon(CupertinoIcons.bell_fill))
          ],
          elevation: 5,
        );
    }
  }

  // Bottom Bar
  NavigationBarTheme myBottomBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Theme.of(context).primaryColor.withOpacity(1),
        labelTextStyle: MaterialStateProperty.all(TextStyle(
          fontFamily: 'Roboto',
          color: Theme.of(context).colorScheme.secondary,
        )),
        iconTheme: MaterialStateProperty.all(
            IconThemeData(color: Theme.of(context).colorScheme.secondary)),
      ),
      child: NavigationBar(
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          animationDuration: const Duration(milliseconds: 500),
          backgroundColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          selectedIndex: index,
          onDestinationSelected: (i) => setState(() {
                index = i;
              }),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard),
              label: "Espace",
              selectedIcon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
            ),
            NavigationDestination(
                icon: Icon(CupertinoIcons.chart_bar_alt_fill),
                selectedIcon: Icon(
                  CupertinoIcons.chart_bar_alt_fill,
                  color: Colors.white,
                ),
                label: "Statistiques"),
            NavigationDestination(
              icon: Icon(CupertinoIcons.person_fill),
              label: "Compte",
              selectedIcon: Icon(
                CupertinoIcons.person_fill,
                color: Colors.white,
              ),
            ),
          ]),
    );
  }
}
