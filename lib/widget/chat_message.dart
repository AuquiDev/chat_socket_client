import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animatedController;

  const ChatMessage(
      {super.key,
      required this.texto,
      required this.uid,
      required this.animatedController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animatedController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animatedController, curve: Curves.fastOutSlowIn),
        child: Container(
          child: uid == '123' ? _myMessage() : _notMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 50, bottom: 5, right: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xff4d9ef6),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 50, bottom: 5, left: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xffe4e5e8),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
