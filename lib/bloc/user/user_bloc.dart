import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';
import 'package:bloc_flutter_ejercicio/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

// Siempre empezar con estados efimeros y luego probar con bases de datos
class UserBloc extends Bloc<UserEvent, UserState> {
  // Se necesita del repositorio para api o bbdd
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<EditEvent>((EditEvent event, Emitter<UserState> emit) async {
      // aca dentro va la logica
      emit(UserLoading());

      await Future.delayed(const Duration(seconds: 2));
      // Cada que se hace un llamado o interactua con api o bbdd se debe hacer un try catch
      try {
        // usamos el estaado del evento para agregar nuevo usuario
        UserModel user = event.newUser;

        await userRepository.updateUser(user);

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
          // Si usuario es null es porque no hay usuario agregado
          emit(UserInitial());
        }
      } catch (error) {
        emit(UserError(message: "Error in LoadUserEvent $error"));
      }
    });
  }
}
