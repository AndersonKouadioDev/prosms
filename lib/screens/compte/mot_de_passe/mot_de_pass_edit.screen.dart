import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/componants/mysnackbar.dart';
import 'package:prosms/screens/dashboard/dashboard.screen.dart';
import 'package:prosms/utility/regex.dart';
import 'package:prosms/utility/utility.dart';

class MotDePassEditScreen extends StatefulWidget {
  const MotDePassEditScreen({super.key});

  @override
  State<MotDePassEditScreen> createState() => _MotDePassEditScreenState();
}

class _MotDePassEditScreenState extends State<MotDePassEditScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController passwordController =
      TextEditingController(text: "");

  late TextEditingController confirmePasswordController =
      TextEditingController(text: "");

  @override
  void dispose() {
    passwordController.dispose();
    confirmePasswordController.dispose();
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
                "Modifier mon Mot de Passe",
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
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: Text(
                    "Entrer mon nouveau mot de passe",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                validator: (value) {
                  if (!isValid(value)) {
                    return "Erreur de Mot de passe";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: psDefaultPadding * 2,
              ),
              TextFormField(
                controller: confirmePasswordController,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: Text(
                    "Confirmer mon nouveau mot de passe",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
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
                ScaffoldMessenger.of(context).showSnackBar(snacBarSuccess(
                    title: const Text("Mot de passe modifé"), btnlabel: "Ok"));
                goToScreen(
                    context,
                    const DashboardScreen(
                      index: 2,
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBarError(
                    title:
                        const Text("les mots de passe ne sont pas identiques"),
                    btnlabel: "Ok"));
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)))),
            child: Text(
              "Enregister",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            )),
      )
    ];
  }
}
