import 'package:agendadecontactos/contactProvider.dart';
import 'package:agendadecontactos/contactResponseModel.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ContactList();
  }
}

class _ContactList extends State<ContactList>{

  List<Widget> listadoContactos = <Widget>[];
  @override
  Widget build(BuildContext context) {
    obtenerContactos();
    return Scaffold(
      appBar: AppBar(title: Text("Listado de contactos")),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: listadoContactos,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushNamed(context, "/createcontact");
        }, 
        label: Text("Crear contacto")
        ),
    );
    
  }

  obtenerContactos() async{
    ContactProvider provider = ContactProvider();
    await provider.init(); // Asegura BBDD Creada
    ContactResponseModel response = await provider.obtenerContactos();
    List<Widget> contactosAMostrar = <Widget>[];
    for(int i = 0; i < response.listaContactos.length; i++){
      Card card = Card(
        child: Column(children: [
          Text(response.listaContactos[i].nombre+
          " "+response.listaContactos[i].apellidos),
          Text(response.listaContactos[i].telefono),
          Text(response.listaContactos[i].email)
        ],),
      );
      contactosAMostrar.add(card);
    }
    setState((){
      this.listadoContactos = contactosAMostrar;
    });
  }
}