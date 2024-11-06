import 'dart:convert';
import 'package:agendadecontactos/contactModel.dart';
import 'package:http/http.dart' as http;

class ContactProviderAPI{

    Future<String> crearContacto(ContactModel contact) async{
        try{
            var url = Uri.parse("http://10.0.2.2:8282/api/contact");
            var response = await http.post(url, body:{
                'nombre' : contact.nombre,
                'apellidos' : contact.apellidos,
                'telefono' : contact.telefono,
                'correo' :contact.email
            });

            String rawResponse = utf8.decode(response.bodyBytes);
            return rawResponse;
        }
        catch(ex){
            String msg = ex.toString();
            return msg;
        }
    }
}