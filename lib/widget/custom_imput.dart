import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImput extends StatelessWidget {
  CustomImput(
      {super.key,
      required this.icon,
      required this.isPaswword,
      required this.keyboardType,
      required this.placeholder,
      required this.textController});

  IconData icon;
  String placeholder;
  TextEditingController textController;
  TextInputType keyboardType;
  bool isPaswword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        obscureText: isPaswword,
        controller: textController,
        autocorrect: false,   
        keyboardType: keyboardType,
        decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon:  Icon(icon),
        filled: true,
        fillColor: const Color.fromARGB(255, 234, 225, 182),
        // enabled: false,
        border: _outLineBorder(),
        errorBorder: _outLineBorder(),
        focusedErrorBorder: _outLineBorder(),
        focusedBorder: _outLineBorder(),
        disabledBorder: _outLineBorder(),
        enabledBorder: _outLineBorder())
      ),
    );
  }

  OutlineInputBorder _outLineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.none, color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));
  }
}
