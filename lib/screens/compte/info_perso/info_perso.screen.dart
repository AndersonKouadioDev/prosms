import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/componants/mysnackbar.dart';
import 'package:prosms/utility/regex.dart';

class InfoPersoScreen extends StatefulWidget {
  const InfoPersoScreen({super.key});

  @override
  State<InfoPersoScreen> createState() => _InfoPersoScreenState();
}

class _InfoPersoScreenState extends State<InfoPersoScreen> {

  
  final Map person = {
    'Nom': "Kouadio",
    "Prenoms": "N'guessan Joseph Anderson",
    "Email": "andersonkouadio0118@gmail.com",
    "Phone": "+225 07 685 666 47",
    "Login": "AndyJojo01"
  };

  final formKey = GlobalKey<FormState>();

  late TextEditingController nomCotroller =
      TextEditingController(text: person['Nom']);

  late TextEditingController prenomsCotroller =
      TextEditingController(text: person['Prenoms']);

  late TextEditingController emailCotroller =
      TextEditingController(text: person['Email']);

  late TextEditingController phoneCotroller =
      TextEditingController(text: person['Phone']);

  late TextEditingController loginCotroller =
      TextEditingController(text: person['Login']);

  Map enables = {
    'Nom': false,
    'Prenoms': false,
    'Email': false,
    'Phone': false,
    'Login': false,
  };
  bool isUpdate = false;

  Map setEnables(String? cle) {
    if (cle != null) {
      enables.updateAll((key, value) => false);
      enables[cle] = true;
      setState(() {
        isUpdate = true;
      });
    } else {
      enables.updateAll((key, value) => false);
    }
    return enables;
  }

  @override
  void dispose() {
    nomCotroller.dispose();
    prenomsCotroller.dispose();
    emailCotroller.dispose();
    phoneCotroller.dispose();
    loginCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: psBackgroundColor,
        iconTheme: const IconThemeData(color: psSecondaryColor),
        actions: isUpdate ? saveBtn(context) : null,
      ),
      body: SafeArea(
          child: Container(
        color: psBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
        child: infoPersoForm(context),
      )),
    );
  }

  Form infoPersoForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Informations Personnelle",
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
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: loginCotroller,
                    decoration: InputDecoration(
                        enabled: enables['Login'], label: const Text("Login")),
                    validator: (value) {
                      if (!isValid(value)) {
                        return "Entrer un login valide";
                      } else {
                        return null;
                      }
                    },
                  )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          enables = setEnables('Login');
                        });
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: emailCotroller,
                      keyboardType: TextInputType.emailAddress,
                      enabled: enables['Email'],
                      decoration: const InputDecoration(label: Text("Email")),
                      validator: (value) {
                        if (!isEmailValid(value)) {
                          return "Entrer un Email valide";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          enables = setEnables('Email');
                        });
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nomCotroller,
                      keyboardType: TextInputType.name,
                      enabled: enables['Nom'],
                      decoration: const InputDecoration(label: Text("Nom")),
                      validator: (value) {
                        if (!isValid(value)) {
                          return "Entrer un Nom valide";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          enables = setEnables('Nom');
                        });
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: prenomsCotroller,
                      keyboardType: TextInputType.name,
                      enabled: enables['Prenoms'],
                      decoration: const InputDecoration(label: Text("Prenoms")),
                      validator: (value) {
                        if (!isValid(value)) {
                          return "Entrer un Prénom valide";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          enables = setEnables('Prenoms');
                        });
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: phoneCotroller,
                      keyboardType: TextInputType.phone,
                      enabled: enables['Phone'],
                      decoration: const InputDecoration(
                        label: Text("Phone"),
                      ),
                      validator: (value) {
                        if (!isPhoneValid(value)) {
                          return "Entrer un Numéro de Téléphone valide\nCommençant par +indicateur.\nExemple : +225 XX XXX XXX XX";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          enables = setEnables('Phone');
                        });
                      },
                      icon: const Icon(Icons.edit))
                ],
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
                setState(() {
                  enables = setEnables(null);
                  isUpdate = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(snacBarSuccess(
                    title: const Text("Informations personnelles modifiées"),
                    btnlabel: "Ok"));
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)))),
            child: Text(
              "Enregistrer",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            )),
      )
    ];
  }
}
