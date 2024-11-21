import 'dart:convert';

class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  // Método para convertir el modelo a un mapa (serialización)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  // Método para crear un UserModel a partir de un mapa (deserialización)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? 'defaultName',
      email: map['email'] ?? 'defaultEmail',
    );
  }

  // Método para convertir el modelo a una cadena JSON
  String toJson() {
    final map = toMap();
    return json.encode(map);
  }

  // Método para crear un modelo desde una cadena JSON
  factory UserModel.fromJson(String source) {
    final map = json.decode(source);
    return UserModel.fromMap(map);
  }
}
