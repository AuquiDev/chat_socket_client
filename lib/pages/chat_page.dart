// ignore_for_file: avoid_print

import 'dart:io';

import 'package:chat_socket_client/pages/login_page.dart';
import 'package:chat_socket_client/widget/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final _focusnode = FocusNode();

  final List<ChatMessage> _messages = [
    // const ChatMessage(texto: 'Alberto hola', uid: '123'),
    // const ChatMessage(
    //     texto:
    //         'que tal! como esta asdhasldhlashdl asdlasd dsad asdasd sd asdsadas d dsalshalsdkhaslds?',
    //     uid: '124'),
    // const ChatMessage(texto: 'que tal! como estas?', uid: '124'),
    // const ChatMessage(
    //     texto:
    //         'que tal! com dhsajdbs daskdsakdashsalhdlasdadas dsd asldhas hdasd hdas hd askdlhasdl halsdhl sado estas?',
    //     uid: '123'),
  ];

  bool _estaEscribiendo = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black45,
              )),
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                maxRadius: 14,
                child: Text('Texto'.substring(0, 2)),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Alberto Sanchez',
                style: TextStyle(color: Colors.black45, fontSize: 12),
              )
            ],
          )),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _messages.length,
            reverse: true,
            itemBuilder: (context, index) => _messages[index],
          )),
          const Divider(
            height: 1,
          ),
          Container(
            height: 100,
            color: Colors.white,
            child: _inputChat(),
          )
        ],
      ),
    );
  }

  SafeArea _inputChat() => SafeArea(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Flexible(
                  child: TextField(
                controller: _textController,
                onSubmitted: _handleSummit,
                onChanged: (value) {
                  //TODO: Cuando hay un valor para pdoer postear.
                  setState(() {
                    if (value.trim().isNotEmpty) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'enviar mensaje',
                ),
                focusNode: _focusnode,
              )),

              //Boton Enviar.
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Platform.isIOS
                    ? CupertinoButton(
                        onPressed: !_estaEscribiendo == false
                            ? () => _handleSummit(_textController.text.trim())
                            : null,
                        child: const Text('enviar'),
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: !_estaEscribiendo == false
                                  ? () =>
                                      _handleSummit(_textController.text.trim())
                                  : null,
                              icon: const Icon(
                                Icons.send,
                              )),
                        )),
              )
            ],
          )));

  _handleSummit(String texto) {
    if (texto.isEmpty) return;

    print(texto);
    _textController.clear();

    _focusnode.requestFocus();

    final newMessage = ChatMessage(
      texto: texto,
      uid: '123',
      animatedController: AnimationController(vsync: this, duration: const Duration(milliseconds: 800)),
    );

    _messages.insert(0, newMessage);
    newMessage.animatedController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: limpiar socket dispose. el Off del socket

    //Limpiar cada una des instancias que tenemos en nuestro arreglo de mensajes

    for (ChatMessage message in _messages) {
      message.animatedController.dispose();
    }

    super.dispose();
  }
}
