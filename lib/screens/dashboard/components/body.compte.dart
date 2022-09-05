import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/screens/welcome/welcome.screen.dart';
import 'package:prosms/utility/utility.dart';
import 'items_account.dart';

// Dashboard Body Content
class CompteBody extends StatelessWidget {
  const CompteBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: psBackgroundColor,
        child: ListView(
          children: [
            header(context),
            const ParametreAccount(),
            const SizedBox(
              height: 10,
            ),
            const ShareAccount(),
            const SizedBox(
              height: 10,
            ),
            const HelpContactCard(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(psDefaultPadding),
              child: CupertinoButton.filled(
                  child: const Text("Se déconnecter"),
                  onPressed: () => goToScreen(context, const WelcomeScreen())),
            )
          ],
        ));
  }

  ListTile header(BuildContext context) {
    return ListTile(
      title: Text(
        "AndyJojo01",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: const Text("+225 07 685 666 47"),
      trailing: Chip(
        label: Text("200 000 SMS",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ),
    );
  }
}
