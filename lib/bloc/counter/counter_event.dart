part of 'counter_bloc.dart';

// Diferentes eventos(metodos)
@immutable
sealed class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterRestartPressed extends CounterEvent {}
