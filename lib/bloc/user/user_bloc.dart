import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';
import 'package:bloc_flutter_ejercicio/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<EditEvent>((EditEvent event, Emitter<UserState> emit) async {
      emit(UserLoading());

      await Future.delayed(const Duration(seconds: 2));
      try {
        UserModel user = event.newUser;

        userRepository.updateUser(user);

        emit(UserLoaded(userModel: user));
      } catch (error) {
        emit(UserError(message: "Error in Try Catch $error"));
      }
    });

    on<LoadUserEvent>((LoadUserEvent event, Emitter<UserState> emit) async {
      emit(UserLoading());
      try {
        UserModel? user = await userRepository
            .getUser(); // Cambié a UserModel? para manejar nulos
        if (user != null) {
          emit(UserLoaded(userModel: user));
        } else {
          emit(UserInitial());
        }
      } catch (error) {
        emit(UserError(message: "Error in LoadUserEvent $error"));
      }
    });
  }
}
