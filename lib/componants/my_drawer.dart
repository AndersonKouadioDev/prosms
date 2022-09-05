import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/screens/others/404.screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          header(),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen404())),
            leading: const Icon(Icons.home),
            title: Text(
              "Acceuil",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen404())),
            leading: const Icon(Icons.home),
            title: Text(
              "Acceuil",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen404())),
            leading: const Icon(Icons.home),
            title: Text(
              "Acceuil",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
          ),
          const Divider(
            height: 10,
            color: psSecondaryColor,
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen404())),
            leading: const Icon(Icons.home),
            title: Text(
              "Acceuil",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen404())),
            leading: const Icon(Icons.home),
            title: Text(
              "Acceuil",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
          ),
        ],
      ),
    );
  }

// Header Drawer
  Widget header() {
    return Stack(
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Video Place Here.png'),
                    colorFilter:
                        ColorFilter.mode(psSecondaryColor, BlendMode.modulate),
                    fit: BoxFit.cover)),
            currentAccountPicture: Image.asset("assets/images/user.png"),
            accountName: const Text("AndyJojo01"),
            accountEmail: const Text("andersonkouadio0118@gmail.com")),
        Positioned(
            top: psDefaultPadding,
            right: psDefaultPadding,
            child: CupertinoButton(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Text(
                    "Retour",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                  const Icon(Icons.chevron_right_outlined, color: Colors.white),
                ],
              ),
            ))
      ],
    );
  }
}
