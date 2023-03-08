// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class Labelwidget extends StatelessWidget {
   Labelwidget({
    super.key,
    required this.route,
    required this.cuestion,
    required this.text,
   
  });
  Widget route;
  String text;
  String cuestion;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
         Text(
          cuestion,
          style: const TextStyle(
              color: Color.fromARGB(255, 72, 74, 76),
              fontWeight: FontWeight.bold),
        ),
        
        MaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => route));
          },
          child:  Text(
            text,
            style: const TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}