import 'package:bloc_flutter_ejercicio/data/providers/user_shared_preferences.dart';
import 'package:bloc_flutter_ejercicio/data/repositories/user_repository.dart';
import 'package:bloc_flutter_ejercicio/my_app.dart';

import 'package:flutter/material.dart';

void main() {
  // Se inicializa la fuente de datos
  final userShared = UserSharedPreferences();

  // Se inicializa el repositorio
  final userRepository = UserRepository(userShared: userShared);
  runApp(MyApp(userRepository: userRepository));
}
