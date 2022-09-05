import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/screens/others/404.screen.dart';
import 'cards.dart';
import 'services.dart';
import 'historiques.dart';
import 'package:prosms/model/services.dart';
import 'package:prosms/model/sms.dart';

// Dashboard Body Content
class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: psBackgroundColor,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: psDefaultPadding,
          ),
          CardBalance(
            title: "SMS Disponibles",
            content: "200 000",
            butonlabel: "Souscrire",
            btnicon: Icons.add,
            link: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen404())),
          ),
          const SizedBox(
            height: psDefaultPadding * 2,
          ),
          MyServices(
            smsservices: smsServices,
            label: "Mes Services SMS",
          ),
          const SizedBox(
            height: psDefaultPadding * 1.5,
          ),
          HistoricCards(
            sms: sms,
            label: "Historique des Campages",
          )
        ],
      ),
    );
  }
}
