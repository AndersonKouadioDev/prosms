import 'package:flutter/material.dart';

class SMS {
  final int id;
  final String title;
  final String date;
  final String? modele;
  final int nombreSms;
  final String expediteur;
  final IconData? icon;
  final String? image;

  SMS({
    required this.id,
    required this.title,
    required this.date,
    required this.expediteur,
    this.modele,
    this.nombreSms = 0,
    this.icon,
    this.image,
  });
}

// SMS Services List

final List<SMS> sms = [
  SMS(
      id: 1,
      title: "Mon premier sms",
      date: "15/08/2022 21:30",
      expediteur: "Campagne 1",
      nombreSms: 120),
  SMS(
      id: 2,
      title: "Mon deuxième sms",
      date: "16/08/2022 10:00",
      expediteur: "Campagne 2",
      nombreSms: 45),
  SMS(
      id: 3,
      title: "Mon troisème sms",
      date: "16/08/2022 15:10",
      expediteur: "Campagne 3",
      nombreSms: 3000)
];

