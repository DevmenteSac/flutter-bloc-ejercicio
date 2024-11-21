import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';
import 'package:bloc_flutter_ejercicio/data/providers/user_shared_preferences.dart';

class UserRepository {
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
