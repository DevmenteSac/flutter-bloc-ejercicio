part of 'user_bloc.dart';

@immutable
sealed class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel userModel;

  UserLoaded({required this.userModel});
}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;

  UserError({required this.message});
}
