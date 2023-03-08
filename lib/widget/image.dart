// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class Logo extends StatelessWidget {
   Logo({
    super.key,
    required this.title
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
           Text(title),
        ],
      ),
    );
  }
}
