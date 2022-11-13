class ModeloUsuario {
  int? id;
  String? nombre;
  String? telefono;
  String? correo;

  ModeloUsuario({this.id, this.nombre, this.telefono, this.correo});

  factory ModeloUsuario.fromJson(Map<String, dynamic> json) {
    return ModeloUsuario(
        id: json['id'],
        nombre: json['name'],
        telefono: json['phone'],
        correo: json['email']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'telefono': telefono,
      'correo': correo,
    };
  }
}
