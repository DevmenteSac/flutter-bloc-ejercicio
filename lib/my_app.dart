import 'package:bloc_flutter_ejercicio/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter_ejercicio/bloc/user/user_bloc.dart';
import 'package:bloc_flutter_ejercicio/data/repositories/user_repository.dart';

import 'package:bloc_flutter_ejercicio/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  // Aca se recibe la instancia del repositorio
  final UserRepository userRepository;
  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // Se usa BlocProvider para acceder al BLoC en todo el arbol
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
          // Este Bloc activa un evento al comienzo
          BlocProvider<UserBloc>(
              create: (context) =>
                  UserBloc(userRepository)..add(LoadUserEvent())),
        ],
        child: const MyHomePage(title: 'Flutter BloC Demo Home Page'),
      ),
    );
  }
}
