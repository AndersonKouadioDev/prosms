import 'package:flutter/material.dart';
import 'package:prosms/constants.dart';
import 'package:prosms/model/services.dart';
import 'cards.dart';

// List View To  Service Card
class MyServices extends StatefulWidget {
  final List<SmsService> smsservices;
  final String label;
  const MyServices({super.key, required this.smsservices, this.label = " "});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: psDefaultPadding * 0.5,
        right: psDefaultPadding * 0.5,
        left: psDefaultPadding * 0.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.only(top: psDefaultPadding * 0.5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.smsservices.length,
              itemBuilder: ((context, index) {
                return ServiceCard(smsservice: widget.smsservices[index]);
              }),
            ),
          )
        ],
      ),
    );
  }
}
