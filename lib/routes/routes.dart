import 'package:chat_socket_client/pages/chat_page.dart';
import 'package:chat_socket_client/pages/loading_page.dart';
import 'package:chat_socket_client/pages/login_page.dart';
import 'package:chat_socket_client/pages/register_page.dart';
import 'package:chat_socket_client/pages/usuarios_pages.dart';
import 'package:flutter/material.dart';

final List<Widget> appRoutes = [ 
   const UsuariosPage(),
 const LoadingPage(),
  const LoginPage(),
   const RegisterPage(),
   const ChatPage(),
];


