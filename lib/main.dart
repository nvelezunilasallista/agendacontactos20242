import 'package:agendadecontactos/contactList.dart';
import 'package:agendadecontactos/createContact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(routes:{
      "/": (BuildContext context) => ContactList(),
      "/createcontact": (BuildContext) => CreateContact()
    })
  );
}

