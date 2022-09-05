import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/model/sms.dart';
import 'package:prosms/screens/others/nothing.screen.dart';
import 'cards.dart';

// List View To  Service Card
class HistoricCards extends StatefulWidget {
  final List<SMS> sms;
  final String label;
  const HistoricCards({super.key, required this.sms, this.label = " "});

  @override
  State<HistoricCards> createState() => _HistoricCardsState();
}

class _HistoricCardsState extends State<HistoricCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: psDefaultPadding * 0.5,
        right: psDefaultPadding * 0.5,
        left: psDefaultPadding * 0.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NothingScreen(
                                title: 'Historique des Campagnes',
                                message: "Vous n'avez pas encore envoyé d'SMS",
                              ))),
                  child: Text(
                    "Tout afficher",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ))
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(psDefaultPadding)),
              color: Colors.white,
              boxShadow: psBoxShadow(),
            ),
            margin: const EdgeInsets.only(top: psDefaultPadding * 0.5),
            child: Column(
              children: getHistorique(context, sms),
            ),
          )
        ],
      ),
    );
  }
}

getHistorique(context, List<SMS> sms) {
  List<Widget> historiques = [];
  int index = 0;
  for (var i = 0; i < sms.length * 2 - 1; i++) {
    if (i.isOdd) {
      historiques.add(Divider(
        height: 2,
        color: Theme.of(context).colorScheme.secondary,
      ));
    } else {
      historiques.add(HistoricCard(mysms: sms[index]));
      index++;
    }
  }
  return historiques;
}
