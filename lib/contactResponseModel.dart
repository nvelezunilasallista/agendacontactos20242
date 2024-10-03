import 'package:agendadecontactos/contactModel.dart';

class ContactResponseModel {

  List<ContactModel>listaContactos = <ContactModel>[];

  ContactResponseModel.empty(){
    this.listaContactos = List.empty();
  }

  ContactResponseModel.fromDB(List<Map> resultadosQuery){
    for(int i = 0 ; i < resultadosQuery.length; i++){
      ContactModel contacto = ContactModel(resultadosQuery[i]);
      this.listaContactos.add(contacto);
    }
  }
}