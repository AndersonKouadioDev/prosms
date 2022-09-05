import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/screens/compte/info_perso/info_perso.screen.dart';
import 'package:prosms/screens/compte/mon_api/mon_api.screen.dart';
import 'package:prosms/screens/compte/mot_de_passe/mot_de_pass.screen.dart';
import 'package:prosms/constants.dart';
import 'cards.dart';
import 'package:prosms/utility/utility.dart';
// Parametre Card

class ParametreAccount extends StatelessWidget {
  const ParametreAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(psDefaultPadding)),
        color: Colors.white,
        boxShadow: psBoxShadow(),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Paramètre",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          ItemAccount(
              context: context,
              icon: CupertinoIcons.person_alt,
              label: "Informations personnelles",
              press: () => goToScreen(context, const InfoPersoScreen())),
          ItemAccount(
              context: context,
              icon: CupertinoIcons.lock,
              label: "Modifier mon mot de passe",
              press: () => goToScreen(context, const MotDePassScreen())),
          ItemAccount(
              context: context,
              icon: CupertinoIcons.shield,
              label: "Mon API",
              press: () => goToScreen(context, const MonApiScreen())),
        ],
      ),
    );
  }
}

// Share Card

class ShareAccount extends StatelessWidget {
  const ShareAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(psDefaultPadding)),
        color: Colors.white,
        boxShadow: psBoxShadow(),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Partage",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          ItemAccount(
              context: context,
              icon: Icons.share,
              label: "Partager l'application",
              press: () => shareViaOtherApp(
                  type: 'text',
                  subject: "Super Cool",
                  message: "Decouvrez cette nouvelle application",
                  url: "https://www.prosms.pro/")),
        ],
      ),
    );
  }
}

// Help & Contact Card

class HelpContactCard extends StatelessWidget {
  const HelpContactCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(psDefaultPadding)),
        color: Colors.white,
        boxShadow: psBoxShadow(),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Aide et Contact",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          ItemAccount(
            context: context,
            icon: CupertinoIcons.building_2_fill,
            label: "Qui Sommes-nous ?",
            press: () => goToURL("https://www.prosms.pro/"),
          ),
          ItemAccountPopup(
              context: context,
              icon: CupertinoIcons.phone,
              label: "Nous Contacter",
              page: contactSection(context)),
        ],
      ),
    );
  }

  Widget contactSection(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(psDefaultPadding),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () =>
                    goToURL('mailto:andersonkouadio0118@gmail.com'),
                icon: const Icon(
                  CupertinoIcons.envelope_fill,
                  size: psDefaultPadding,
                ),
                label: Text(
                  'Email',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            TextButton.icon(
                onPressed: () => goToURL('tel:+225-07-68-56-66-47'),
                icon: const Icon(
                  CupertinoIcons.phone_fill,
                  size: psDefaultPadding,
                ),
                label: Text(
                  'Téléphone',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            TextButton.icon(
                onPressed: () => goToURL('sms:+225-07-68-56-66-47'),
                icon: const Icon(
                  CupertinoIcons.bubble_left_fill,
                  size: psDefaultPadding,
                ),
                label: Text(
                  'Message',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          ],
        ),
      ),
    );
  }
}
