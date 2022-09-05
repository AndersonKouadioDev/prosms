import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';

class MonApiScreen extends StatelessWidget {
  const MonApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: psBackgroundColor,
        iconTheme: const IconThemeData(color: psSecondaryColor),
      ),
      body: SafeArea(
          child: Container(
        color: psBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: psDefaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Mon Api",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
                decoration: BoxDecoration(
                    boxShadow: psBoxShadow(),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(psDefaultPadding * 0.8),
                        bottomLeft: Radius.circular(psDefaultPadding * 0.8),
                        bottomRight: Radius.circular(psDefaultPadding * 0.8))),
                padding: const EdgeInsets.symmetric(
                    horizontal: psDefaultPadding,
                    vertical: psDefaultPadding * 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'API KEY :   ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                              const SizedBox(
                                height: psDefaultPadding,
                              ),
                              Text(
                                'API PASS :   ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: psDefaultPadding,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DX6hIzBTeE',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              const SizedBox(
                                height: psDefaultPadding,
                              ),
                              Text(
                                'MlilD-qGh-yd0gH',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: psDefaultPadding * 2),
                      child: CupertinoButton.filled(
                          child: const Text("Regénérer"), onPressed: () {}),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
