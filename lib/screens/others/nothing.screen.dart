import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';

class NothingScreen extends StatelessWidget {
  final String title;
  final String message;
  const NothingScreen({Key? key, required this.title, required this.message})
      : super(key: key);

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
                  title,
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
            Expanded(
                child: Column(
              children: [
                Icon(
                  Icons.not_interested_outlined,
                  size: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: psDefaultPadding * 2,
                ),
                FittedBox(
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
