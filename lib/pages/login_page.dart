
// ignore_for_file: avoid_print

import 'package:chat_socket_client/routes/routes.dart';
import 'package:chat_socket_client/widget/custom_imput.dart';
import 'package:chat_socket_client/widget/image.dart';
import 'package:chat_socket_client/widget/label.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:  [
              Logo(title: 'Messenger',),
              const FormS(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormS extends StatefulWidget {
  const FormS({
    super.key,
  });

  @override
  State<FormS> createState() => _FormSState();
}

class _FormSState extends State<FormS> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomImput(
                icon: Icons.mail,
                isPaswword: false,
                keyboardType: TextInputType.emailAddress,
                placeholder: 'Correo',
                textController: emailCtrl),
            CustomImput(
                icon: Icons.lock, // Icons.lock_open,
                isPaswword: true,
                keyboardType: TextInputType.visiblePassword,
                placeholder: 'Password',
                textController: passwordCtrl),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: MaterialButton(
                height: 60,
                shape: const StadiumBorder(),
                color: const Color.fromARGB(255, 65, 147, 219),
                onPressed: () {
                  print(emailCtrl.text);
                  print(passwordCtrl.text);
                },
                child: const Text(
                  'Ingrese',
                ),
              ),
            ),
            Labelwidget(route: appRoutes[3], cuestion: '¿No tienes una cuenta?', text: 'Registrarse.',)
          ],
        ));
  }
}

