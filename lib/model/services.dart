import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/screens/expediteur/expediteur.screen.dart';
import 'package:prosms/screens/others/404.screen.dart';
import 'package:prosms/screens/repertoire/repertoire.screen.dart';

class SmsService {
  final IconData icon;
  final String title;
  final Widget page;
  SmsService({required this.icon, required this.title, required this.page});
}

// SMS Services List

final List<SmsService> smsServices = [
  SmsService(
      icon: CupertinoIcons.group,
      title: "Envoi Groupé",
      page: const Screen404()),
  SmsService(
      icon: CupertinoIcons.paperplane,
      title: "Envoi Rapide",
      page: const Screen404()),
  SmsService(
      icon: CupertinoIcons.doc_append,
      title: "Modèle SMS",
      page: const Screen404()),
  SmsService(
      icon: Icons.sensor_occupied_rounded,
      title: "Expéditeurs",
      page: const ExpediteurScreen()),
  SmsService(
      icon: CupertinoIcons.doc_person,
      title: "Repertoire",
      page: const RepertoireScreen()),
  SmsService(
      icon: Icons.horizontal_split_rounded,
      title: "Historique",
      page: const Screen404()),
];
