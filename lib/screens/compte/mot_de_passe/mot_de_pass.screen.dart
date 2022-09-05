import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/componants/mysnackbar.dart';
import 'package:prosms/screens/compte/mot_de_passe/mot_de_pass_edit.screen.dart';
import 'package:prosms/utility/regex.dart';
import 'package:prosms/utility/utility.dart';

class MotDePassScreen extends StatefulWidget {
  const MotDePassScreen({super.key});

  @override
  State<MotDePassScreen> createState() => _MotDePassScreenState();
}

class _MotDePassScreenState extends State<MotDePassScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: psBackgroundColor,
        iconTheme: const IconThemeData(color: psSecondaryColor),
        actions: saveBtn(context),
      ),
      body: SafeArea(
          child: Container(
        color: psBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
        child: motdepassForm(context),
      )),
    );
  }

  Form motdepassForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Entrer votre Mot de Passe Actuel",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              )
            ],
          ),
          const SizedBox(
            height: psDefaultPadding,
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: passwordController,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(),
                validator: (value) {
                  if (!isValid(value)) {
                    return "Erreur de Mot de passe";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ))
        ],
      ),
    );
  }

  List<Widget> saveBtn(BuildContext context) {
    return [
      Container(
        margin: const EdgeInsets.all(10),
        child: TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(snacBarSuccess(
                    title: const Text("Mot de passe accepté"), btnlabel: "Ok"));
                goToScreen(context, const MotDePassEditScreen());
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)))),
            child: Text(
              "Suivant",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            )),
      )
    ];
  }
}
