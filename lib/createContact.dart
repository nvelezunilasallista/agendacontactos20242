import 'package:agendadecontactos/contactModel.dart';
import 'package:agendadecontactos/contactProvider.dart';
import 'package:flutter/material.dart';

class CreateContact extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CreateContact();
  }
}

class _CreateContact extends State<CreateContact> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String nombre = "";
  String apellidos = "";
  String email = "";
  String telefono = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear Contacto")),
      body : Container(
        child: Form(
          key: formKey,
          child: Column(children: [
            obtenerCampoNombre(),
            obtenerCampoApellidos(),
            obtenerCampoEmail(),
            obtenerCampoTelefono(),
            obtenerBotonGuardar()
          ],) ,)
      )
    );
  }

  obtenerCampoNombre(){
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: "Nombre del contacto"),
      validator: (value){
        if(value!.length > 3){
          return null;
        }else{
          return "El nombre debe tener mas de 3 caracteres";
        }
      },
      onSaved: (value){
        this.nombre = value!;
      }
    );
  }

  obtenerCampoApellidos(){
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: "Apellido del contacto"),
      validator: (value){
        if(value!.length > 3){
          return null;
        }else{
          return "El apellido debe tener mas de 3 caracteres";
        }
      },
      onSaved: (value){
        this.apellidos = value!;
      }
    );
  }

  obtenerCampoTelefono(){
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(labelText: "Teléfono del contacto"),
      validator: (value){
        if(value!.length >= 7 && value.length <=10){
          return null;
        }else{
          return "El teléfono debe tener entre 7 y 10 caracteres";
        }
      },
      onSaved: (value){
        this.telefono = value!;
      }
    );
  }

  obtenerCampoEmail(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: "Email del contacto"),
      validator: (value){
        if(value!.length > 3){
          return null;
        }else{
          return "El email debe tener mas de 3 caracteres";
        }
      },
      onSaved: (value){
        this.email = value!;
      }
    );
  }

  obtenerBotonGuardar(){
    return ElevatedButton(onPressed: (){
      if(formKey.currentState!.validate()){
        formKey.currentState!.save();
        crearContactoenBaseDatos();
        Navigator.pop(context);
      }
    }, child: Text("Guardar contacto"));
  }

  crearContactoenBaseDatos() async{
    ContactModel contact = 
    ContactModel.fromValues("", nombre, apellidos, email, telefono, "0");
    ContactProvider provider = ContactProvider();
    await provider.init();
    var id = await provider.agregarContacto(contact);
  }
}
