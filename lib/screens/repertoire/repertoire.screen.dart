import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';

class RepertoireScreen extends StatefulWidget {
  const RepertoireScreen({super.key});

  @override
  State<RepertoireScreen> createState() => _RepertoireScreenState();
}

class _RepertoireScreenState extends State<RepertoireScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: psBackgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          'Repertoire',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
              color: Theme.of(context).colorScheme.secondary),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        color: psBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
      )),
    );
  }
}
