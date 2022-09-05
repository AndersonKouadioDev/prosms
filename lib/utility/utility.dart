import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

Future<void> goToScreen(context, screen) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

Future<void> goToURL(String url) async {
  final Uri theUrl = Uri.parse(url);
  if (!await launchUrl(theUrl)) {
    throw 'Could not launch $theUrl';
  }
}

Future<void> shareViaOtherApp(
    {required type,
    String subject = "",
    String message = "",
    String url = ""}) async {
  Share.share("$message \n\n$url", subject: subject);
}
