import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottonWidget extends StatelessWidget {
   BottonWidget({super.key,
   required this.onPresssed,
   required this.text});

  Function onPresssed;
  String text; 
  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: MaterialButton(
                height: 60,
                shape: const StadiumBorder(),
                color: const Color.fromARGB(255, 65, 147, 219),
                onPressed: onPresssed(),
                child:  Text(
                  text,
                ),
              ),
            );
  }
}