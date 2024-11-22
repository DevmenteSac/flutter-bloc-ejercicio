import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// fuente de datos, api, sql, firebase, etc. metodos GENERALES para CRUD (create, read, update, delete)
class UserSharedPreferences {
  static const String _userKey = "user";

  Future<UserModel?> loadUser() async {
    // Cambié a UserModel? para manejar el caso nulo
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userJson = prefs.getString(_userKey);
      if (userJson != null) {
        return UserModel.fromJson(userJson);
      }
      return null; // Si no hay usuario guardado, retorna null. Esto sirve para gestioanr errores y UI
    } catch (e) {
      throw Exception("Error loading user: $e");
    }
  }

  Future<void> saveUser(UserModel newUser) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_userKey, newUser.toJson());
    } catch (e) {
      throw Exception("Error saving user: $e");
    }
  }
}
