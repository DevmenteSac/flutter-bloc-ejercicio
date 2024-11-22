import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// Se reciben eventos(metodos)
// Se mandan estados(atributos)

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Al comenzar se usara el estado CounterInitial
  CounterBloc() : super(const CounterInitial()) {
    // Cuando se añada el evento CounterIncrementPressed se ejecutara esto
    // Se define el tipo de evento que recibe y el tipo de estado que emite
    on<CounterIncrementPressed>(
      (CounterIncrementPressed event, Emitter<CounterState> emit) {
        // aca dentro va la logica
        emit(CounterValue(counter: state.counter + 1));
      },
    );

    on<CounterDecrementPressed>(
        (CounterDecrementPressed event, Emitter<CounterState> emit) {
      if (state.counter > 0) {
        emit(CounterValue(counter: state.counter - 1));
      } else {
        const String message = "Counter limit reached";
        emit(const CounterLimitReached(counter: 0, message: message));
      }
    });

    on<CounterRestartPressed>(
        (CounterRestartPressed event, Emitter<CounterState> emit) async {
      emit(const CounterLoading());
      await Future.delayed(const Duration(seconds: 2));

      emit(const CounterInitial());
    });
  }
}
