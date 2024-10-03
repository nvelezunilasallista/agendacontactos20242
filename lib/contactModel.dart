class ContactModel{

  String id = "";
  String nombre = "";
  String apellidos = "";
  String email = "";
  String telefono = "";

  ContactModel(Map json){
    this.id = json["_id"];
    this.nombre = json["nombre"];
    this.apellidos = json["apellidos"];
    this.email = json["email"];
    this.telefono = json["telefono"];
  }

  ContactModel.fromValues(String id, String nombre, String apellidos,
                          String email, String telefono){
    this.id = id;
    this.nombre = nombre;
    this.apellidos = apellidos;
    this.email = email;
    this.telefono = telefono;
  }
}