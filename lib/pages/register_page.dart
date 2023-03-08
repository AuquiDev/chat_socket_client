// ignore_for_file: avoid_print

import 'package:chat_socket_client/routes/routes.dart';
import 'package:chat_socket_client/widget/custom_imput.dart';
import 'package:chat_socket_client/widget/image.dart';
import 'package:chat_socket_client/widget/label.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  [
              Logo(title: 'Register',),
              const FormSRegister()
              
          ],
        ),
      ),
    );
  }
}


class FormSRegister extends StatefulWidget {
  const FormSRegister({
    super.key,
  });

  @override
  State<FormSRegister> createState() => _FormSRegisterState();
}

class _FormSRegisterState extends State<FormSRegister> {
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
                  'Registrese.',
                ),
              ),
            ),
            Labelwidget(route: appRoutes[2], cuestion: '', text: 'Ingrese ahora !',)
          ],
        ));
  }
}

