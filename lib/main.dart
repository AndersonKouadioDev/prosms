import 'package:prosms/theme.dart';
import 'package:flutter/material.dart';
import 'package:prosms/screens/dashboard/dashboard.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prosms',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const DashboardScreen(
        index: 0,
      ),
    );
  }
}
