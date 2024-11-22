part of 'user_bloc.dart';

// Diferentes eventos(metodos)
@immutable
sealed class UserEvent {}

class EditEvent extends UserEvent {
  final UserModel newUser;

  EditEvent({required this.newUser});
}

class LoadUserEvent extends UserEvent {}
