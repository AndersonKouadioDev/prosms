import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/model/sms.dart';
import 'package:prosms/model/services.dart';
import 'package:prosms/screens/others/404.screen.dart';


// Card Money

class MyCard extends StatelessWidget {
  final String? title;
  final String? content;
  final String? butonlabel;
  final Function? link;
  final IconData? btnicon;
  final IconData? titleicon;
  const MyCard(
      {Key? key,
      this.title,
      this.content,
      this.butonlabel,
      this.link,
      this.btnicon,
      this.titleicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(psDefaultPadding)),
        color: Colors.white,
        boxShadow: psBoxShadow(),
      ),
      margin: const EdgeInsets.symmetric(horizontal: psDefaultPadding * 1.5),
      padding: const EdgeInsets.all(psDefaultPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: title,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.6),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: "\n\n$content ",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary))
              ])),
              Icon(
                titleicon,
                size: psDefaultPadding * 1.8,
                color: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          const SizedBox(
            height: psDefaultPadding,
          ),
          GestureDetector(
            onTap: () => link!(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
              padding: const EdgeInsets.all(psDefaultPadding * 0.5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius:
                    const BorderRadius.all(Radius.circular(psDefaultPadding)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    btnicon,
                    size: psDefaultPadding,
                  ),
                  Text(
                    butonlabel!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Card Balance

class CardBalance extends StatelessWidget {
  final String? title;
  final String? content;
  final String? butonlabel;
  final Function? link;
  final IconData? btnicon;
  const CardBalance(
      {Key? key,
      this.title,
      this.content,
      this.butonlabel,
      this.link,
      this.btnicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(psDefaultPadding * 0.5),
      child: Column(children: [
        Text(title!,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.6),
                fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding * 2),
          child: FittedBox(
            child: Text(content!,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary)),
          ),
        ),
        InkWell(
          onTap: () => link!(),
          child: Container(
            padding: const EdgeInsets.all(psDefaultPadding * 0.4),
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.only(
                left: psDefaultPadding,
                right: psDefaultPadding,
                top: psDefaultPadding * 0.5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(psDefaultPadding)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  btnicon!,
                  size: psDefaultPadding,
                ),
                Text(
                  butonlabel!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

// Card Service Shape Messag

class ServiceCard extends StatelessWidget {
  final SmsService smsservice;
  const ServiceCard({
    Key? key,
    required this.smsservice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => smsservice.page)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: psDefaultPadding * 0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: psBoxShadow(),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(psDefaultPadding * 0.8),
                      bottomLeft: Radius.circular(psDefaultPadding * 0.8),
                      bottomRight: Radius.circular(psDefaultPadding * 0.8))),
              padding: const EdgeInsets.all(psDefaultPadding * 0.5),
              child: Icon(
                smsservice.icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: psDefaultPadding * 0.5,
            ),
            FittedBox(
              child: Text(smsservice.title),
            )
          ],
        ),
      ),
    );
  }
}

// Historique Card

class HistoricCard extends StatelessWidget {
  final SMS mysms;
  const HistoricCard({Key? key, required this.mysms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Screen404())),
      child: Container(
        padding: const EdgeInsets.all(psDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mysms.expediteur),
                    const SizedBox(
                      height: 5,
                    ),
                    Chip(
                      avatar: const Icon(Icons.call_made_rounded),
                      label: Text(mysms.title),
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(mysms.date)
                  ],
                ),
              ],
            ),
            Row(children: [
              FittedBox(
                child: Text("${mysms.nombreSms} SMS",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold)),
              ),
              Icon(Icons.chevron_right,
                  color: Theme.of(context).colorScheme.secondary)
            ])
          ],
        ),
      ),
    );
  }
}

// Item Account

class ItemAccount extends StatelessWidget {
  const ItemAccount(
      {Key? key,
      required this.context,
      required this.icon,
      required this.label,
      required this.press})
      : super(key: key);

  final BuildContext context;
  final IconData icon;
  final String label;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press(),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
              Icon(Icons.chevron_right,
                  color: Theme.of(context).colorScheme.secondary)
            ],
          )),
    );
  }
}
// Item Account

class ItemAccountPopup extends StatelessWidget {
  const ItemAccountPopup({
    Key? key,
    required this.context,
    required this.icon,
    required this.label,
    required this.page,
  }) : super(key: key);

  final BuildContext context;
  final IconData icon;
  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          showCupertinoModalPopup(context: context, builder: (context) => page),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
              Icon(Icons.chevron_right,
                  color: Theme.of(context).colorScheme.secondary)
            ],
          )),
    );
  }
}
