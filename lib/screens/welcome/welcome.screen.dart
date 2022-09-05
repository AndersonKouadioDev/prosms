import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/screens/login_signin/login_signin.screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/welcome_image.png"),
              ),
            ),
            const SizedBox(
              height: psDefaultPadding * 3,
            ),
            Text(
              "Bonjour et Binevenue \nl'application Prosms!",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: psDefaultPadding * 2,
            ),
            const Text(
              "Prosms est une application de gestion d'envoi d'sms, rapide et très facile. Vous pouvez utiliser Prosms hors connexion internet.",
              style: TextStyle(
                color: Color(0xAA000000),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: psDefaultPadding * 2,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginSigninScreen()));
                },
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Skip",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 34.0,
                      )
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
