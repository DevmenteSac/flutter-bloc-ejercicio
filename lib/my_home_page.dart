import 'package:bloc_flutter_ejercicio/bloc/counter/counter_bloc.dart';
import 'package:bloc_flutter_ejercicio/bloc/user/user_bloc.dart';
import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';

import 'package:bloc_flutter_ejercicio/utils/dialogs/showInputDialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                switch (state) {
                  case UserInitial():
                    return const Text("Agrega un Usuario");

                  case UserLoaded():
                    return Column(
                      children: [
                        Text("Hola ${state.userModel.name}"),
                        Text("Tu correo es ${state.userModel.email}"),
                      ],
                    );

                  case UserLoading():
                    return const CircularProgressIndicator();

                  case UserError():
                    return Text(state.message);

                  default:
                    return const Text("Estado desconocido");
                }
              },
            ),
            const SizedBox(height: 20),
            // BlocConsumer sirve como Listener(ejecutar acciones) y Builder(reconstruir UI)
            BlocConsumer<CounterBloc, CounterState>(
              // para ejecutar acciones
              listener: (context, state) {
                if (state is CounterLimitReached) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(state.message),
                    ),
                  );
                }
              },
              // para reconstruir UI
              builder: (context, state) {
                // depende del estado emitido se reconstruye algo en UI
                switch (state) {
                  case CounterInitial():
                    return const Text("Push + Button to Start");
                  case CounterValue():
                    return Text(
                        "You have pushed the button ${state.counter} times");
                  case CounterLimitReached():
                    return Text(
                        "You have pushed the button ${state.counter} times");
                  case CounterLoading():
                    return const CircularProgressIndicator.adaptive();

                  default:
                    return const Text("Estado desconocido");
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            // para mandar eventos al BLoC
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementPressed());
            },
            tooltip: "Decrement",
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterRestartPressed());
            },
            tooltip: "Restart",
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () async {
              UserModel? user = await showInputDialog(context);

              if (user != null) {
                context.read<UserBloc>().add(EditEvent(newUser: user));
              }
            },
            tooltip: "Edit",
            child: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
