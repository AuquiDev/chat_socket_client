import 'package:chat_socket_client/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final RefreshController  _refreshController = RefreshController(initialRefresh:  false);

  final usuarios = [
    Usuario(
        online: true, email: 'alberto@gmail.com', nombre: 'Alberto', uid: '1'),
    Usuario(online: true, email: 'maria@gmail.com', nombre: 'Maria', uid: '2'),
    Usuario(online: false, email: 'Ceci@gmail.com', nombre: 'Ceci', uid: '3'),
    Usuario(
        online: true, email: 'leonel@gmail.com', nombre: 'Leonel', uid: '4'),
    Usuario(online: true, email: 'gaby@gmail.com', nombre: 'Gaby', uid: '5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(
            'Mi nombre',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              )),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ), //Icon(Icons.offline_bolt,color: Colors.red,),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _cargarUsuarios,//Creamos un para refrezcar usuarios
          header: const WaterDropHeader(
            complete: Icon(Icons.check,color: Colors.blueAccent,),
            waterDropColor: Colors.purple,
          ),
          child: _listViewUsuarios()));
  }


  _cargarUsuarios() async{
    
    await Future.delayed(const Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
    
  }


  ListView _listViewUsuarios() {
    return ListView.separated(
          itemBuilder: (context, index) {
            return _usuarioListTile(usuarios[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 50.0),
              child: const Divider(),
            );
          },
          itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario user) {
    return ListTile(
              leading: CircleAvatar(
                child: Text(user.nombre.substring(0, 2)),
              ),
              title: Text(user.nombre),
              subtitle: Text(user.email),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color:user.online ==true ?  Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(100)
                ),
              )
            );
  }
}
