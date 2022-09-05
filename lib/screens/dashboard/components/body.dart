import 'package:flutter/material.dart';
import 'body.dashboard.dart';
import 'body.statistique.dart';
import 'body.compte.dart';

class Body extends StatefulWidget {
  final int index;
  const Body({super.key, required this.index});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        return const DashboardBody();
      case 1:
        return const StatistiqueBody();
      case 2:
        return const CompteBody();
      default:
        return Container();
    }
  }
}
