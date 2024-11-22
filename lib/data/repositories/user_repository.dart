import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';
import 'package:bloc_flutter_ejercicio/data/providers/user_shared_preferences.dart';

// gestor de fuente de datos, se crean los metodos ESPECIFICOS para cada funcion de la app
// intermediario entre fuente de datos y BLoC
class UserRepository {
  //  Se necesita de la fuente de datos para el CRUD general
  final UserSharedPreferences _userShared;

  UserRepository({required UserSharedPreferences userShared})
      : _userShared = userShared;

  Future<UserModel?> getUser() async {
    return await _userShared.loadUser();
  }

  Future<void> updateUser(UserModel user) async {
    _userShared.saveUser(user);
  }
}
