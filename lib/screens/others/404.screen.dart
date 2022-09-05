import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/constants.dart';

class Screen404 extends StatelessWidget {
  const Screen404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: psBackgroundColor,
        iconTheme: const IconThemeData(color: psSecondaryColor),
      ),
      body: SafeArea(
          child: Container(
        color: psBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info,
              size: psDefaultPadding * 3,
            ),
            Text(
              "Désolé la page n'est pas encore disponible.",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.chevron_left,
                            size: psDefaultPadding * 1.5,
                          ),
                          Text(
                            "Retour",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    )),
                CupertinoButton.filled(
                    minSize: psDefaultPadding,
                    padding: const EdgeInsets.symmetric(
                        horizontal: psDefaultPadding,
                        vertical: psDefaultPadding * 0.3),
                    child: Text(
                      "A propos",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () => showAboutDialog(
                          context: context,
                          useRootNavigator: false,
                          applicationVersion: "1.0.0",
                          applicationLegalese: "Tout droit reservé",
                          applicationIcon: const Icon(
                              CupertinoIcons.square_stack_3d_down_right_fill),
                        )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
