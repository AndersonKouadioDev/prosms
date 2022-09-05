import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/screens/expediteur/add_expediteur.screen.dart';
import 'package:prosms/screens/others/404.screen.dart';
import 'package:prosms/utility/utility.dart';

class ExpediteurScreen extends StatefulWidget {
  const ExpediteurScreen({super.key});

  @override
  State<ExpediteurScreen> createState() => _ExpediteurScreenState();
}

class _ExpediteurScreenState extends State<ExpediteurScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: psBackgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          'Expéditeurs',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
              color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
              child: IconButton(
                onPressed: () =>
                    goToScreen(context, const AddExpediteurScreen()),
                icon: const Icon(CupertinoIcons.add_circled_solid),
              ))
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        color: psBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
        child: ListView(children: [
          Container(
            width: width * 0.8,
            padding: const EdgeInsets.all(psDefaultPadding),
            margin: const EdgeInsets.only(top: psDefaultPadding),
            decoration: BoxDecoration(
                boxShadow: psBoxShadow(),
                borderRadius:
                    const BorderRadius.all(Radius.circular(psDefaultPadding)),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 244, 205, 189),
                    Colors.white,
                  ],
                )),
            child: InkWell(
              onTap: () => goToScreen(context, const Screen404()),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "UNICEF2022",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => goToScreen(
                                    context, const AddExpediteurScreen()),
                                icon: Icon(
                                  Icons.edit,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                            IconButton(
                                onPressed: () => showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return const ActionDialog();
                                    }),
                                icon: Icon(
                                  CupertinoIcons.delete_solid,
                                  color: Theme.of(context).colorScheme.error,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: psDefaultPadding * 0.5,
                    ),
                    const Text("Sous titre pour la description...")
                  ]),
            ),
          ),
        ]),
      )),
    );
  }
}

class ActionDialog extends StatelessWidget {
  const ActionDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Voulez-vous vraiment le supprimer ?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary)),
            child: const Text(
              'Non',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary)),
            child: const Text(
              'Oui',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
