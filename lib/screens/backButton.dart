import 'package:flutter/material.dart';

Widget backButton(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: const Icon(Icons.arrow_back_ios_sharp),
  );
}
