import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "Login et Singin",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(psDefaultPadding),
            child: Column(
              children: [
                Image.asset("assets/images/Video Place Here.png"),
                const SizedBox(
                  height: psDefaultPadding * 2,
                ),
                const Text(
                  "Une boîte à propos. Il s'agit d'une boîte de dialogue avec l'icône, le nom, le numéro de version et le copyright de l'application, ainsi qu'un bouton permettant d'afficher les licences des logiciels utilisés par l'application.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: psDefaultPadding * 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () => showDialog(
                          context: context,
                          builder: ((context) => const MyCard(
                                title: "Hey !",
                                message:
                                    "Une boîte à propos. Il s'agit d'une boîte \nde dialogue avec l'icône, le nom.",
                                icon: Icons.more_horiz,
                              ))),
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      label: Text(
                        "Plus",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => showDialog(
                          context: context,
                          builder: ((context) => const MyCard(
                                title: "Hey !",
                                message:
                                    "Une boîte à propos. Il s'agit d'une boîte \nde dialogue avec l'icône, le nom.",
                                icon: Icons.help,
                              ))),
                      icon: const Icon(
                        Icons.help,
                        size: 30,
                      ),
                      label: Text(
                        "Aide",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class MyCard extends StatelessWidget {
  const MyCard(
      {Key? key,
      required this.title,
      required this.message,
      required this.icon})
      : super(key: key);

  final String title;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Card(
          elevation: 0,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: psDefaultPadding * 2,
              ),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: psDefaultPadding,
              ),
              Text(
                message,
                style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .color!
                        .withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: psDefaultPadding,
              ),
              Icon(
                icon,
                color: Colors.green,
                size: 35,
              )
            ]),
          ),
        )
      ],
    );
  }
}
