import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/componants/mysnackbar.dart';
import 'package:prosms/screens/expediteur/expediteur.screen.dart';
import 'package:prosms/utility/regex.dart';
import 'package:prosms/utility/utility.dart';

class AddExpediteurScreen extends StatefulWidget {
  const AddExpediteurScreen({super.key});

  @override
  State<AddExpediteurScreen> createState() => _AddExpediteurScreenState();
}

class _AddExpediteurScreenState extends State<AddExpediteurScreen> {
  final formKey = GlobalKey<FormState>();
  int libelleCounter = 0;

  late TextEditingController libelleController =
      TextEditingController(text: "");

  late TextEditingController descriptionController =
      TextEditingController(text: "");

  @override
  void dispose() {
    libelleController.dispose();
    descriptionController.dispose();
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
                "Nouveau Expéditeur",
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
                controller: libelleController,
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    libelleCounter = libelleController.text.length;
                  });
                  if (libelleCounter > 11) {
                    libelleController.text =
                        libelleController.text.substring(1, 12);
                  }
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  counter: Chip(
                    label: Text('$libelleCounter'),
                    backgroundColor: libelleCounter == 11
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  label: Text(
                    "Entrer le libéllé *",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                validator: (value) {
                  if (!isValid(value)) {
                    return "Le libéllé ne doit pas dépasser 11 caractères.";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: psDefaultPadding * 2,
              ),
              TextFormField(
                controller: descriptionController,
                autofocus: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: Text(
                    "Entrer la description",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
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
                    title: const Text("Expéditeur créé"), btnlabel: "Ok"));
                goToScreen(context, const ExpediteurScreen());
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
