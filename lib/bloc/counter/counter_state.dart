part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counter;

  const CounterState({required this.counter});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

class CounterValue extends CounterState {
  const CounterValue({required super.counter});
}

class CounterLimitReached extends CounterState {
  final String message;

  const CounterLimitReached({required super.counter, required this.message});
}

class CounterLoading extends CounterState {
  const CounterLoading() : super(counter: 0);
}
